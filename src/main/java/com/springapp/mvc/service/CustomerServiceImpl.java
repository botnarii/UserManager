package com.springapp.mvc.service;


import com.springapp.mvc.model.*;
import com.springapp.mvc.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private AddressRepository addressRepository;
    @Autowired
    private ShippingRepository shippingRepository;
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private OrderLineRepository orderLineRepository;
    @Autowired
    private ShippingDetailsRepository shippingDetailsRepository;

    @Override
    public Customer createCustomerFromFormModel(RegistrationForm form) {
        Customer customer = new Customer();
        customer.setUsername(form.getUsername());
        customer.setPassword(form.getPassword());
        customer.setFirstName(form.getFirstName());
        customer.setLastName(form.getLastName());
        customer.setEmail(form.getEmail());
        customer.setEnabled(form.getEnabled());
        return customer;
    }

    @Override
    @Transactional
    public Customer save(Customer customer) {
        return customerRepository.save(customer);
    }

    @Override
    @Transactional
    public Address save(Address address) {
        return addressRepository.save(address);
    }

    @Override
    @Transactional
    public void deleteAddressById(Long addressId) {
        addressRepository.delete(addressId);
    }

    @Override
    @Transactional
    public Address saveAddr(Address address, int option) {
        Customer customer = findByUsername();
        switch (option) {
            case 1:
                customer.getAddresses().add(address);
                break;
            case 2:
                customer.getAddresses().add(address);
                break;
        }
        address.setCustomer(customer);
        addressRepository.save(address);
        return address;
    }

    @Override
    @Transactional
    public Address editAddr(Address address, int option) {
        Customer customer = findByUsername();
        switch (option) {
            case 1:
                Address billing = customer.getBillingAddress();
                if (!billing.equals(address)) {
                    addressRepository.delete(billing);
                    customer.getAddresses().remove(billing);
                } else {
                    return address;
                }
                break;
            case 2:
                Address shipping = customer.getShippingAddress();
                if (!shipping.equals(address)) {
                    addressRepository.delete(shipping);
                    customer.getAddresses().remove(shipping);
                } else {
                    return address;
                }
                break;
        }
        address.setCustomer(customer);
        customer.getAddresses().add(address);
        customerRepository.save(customer);
        return address;
    }

    @Override
    public Customer findCustomerById(long customerId) {
        return customerRepository.findOne(customerId);
    }

    @Override
    public Customer findByEmail(String email) {
        return customerRepository.findByEmail(email);
    }

    @Override
    public Customer findByUsername() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String user = auth.getName();
        return customerRepository.findByUsername(user);
    }

    @Override
    public Customer findByUsernameAndPassword(String username, String password) {
        return customerRepository.findByUsernameAndPassword(username, password);
    }

    @Override
    public boolean checkUniqueCustomerRegistrationByUsername(String username) {
        return (customerRepository.findByUsername(username) != null);
    }

    @Override
    public boolean checkUniqueCustomerRegistrationByEmail(String email) {
        return (customerRepository.findByEmail(email) != null);
    }

    @Override
    public Boolean checkAddress(int option) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String user = auth.getName();
        Customer customer = customerRepository.findByUsername(user);
        switch (option) {
            case 1:
                return customer.getBillingAddress() != null;
            case 2:
                return customer.getShippingAddress() != null;
        }
        return false;
    }

    @Override
    @Transactional
    public Customer packOrder(ShoppingCart shoppingCart) {
        Customer customer = findByUsername();
        saveOrderDetails(shoppingCart, customer);
        return customer;
    }

    public void saveOrderDetails(ShoppingCart shoppingCart, Customer customer) {
        Date today = new Date();

        Order order = new Order();
        order.setCustomer(customer);
        order.setDateTime(new Timestamp(today.getTime()));

        Shipping shipping = new Shipping(new Timestamp(today.getTime()));

        for(ShoppingCartItem item: shoppingCart.getItems()) {
            OrderLine orderLine = new OrderLine(item.getQuantity());
            orderLine.setPk(new OrderLineId(order, item.getProduct()));

            ShippingDetails shippingDetails = new ShippingDetails(new ShippingDetailsId(shipping, order, item.getProduct()), item.getQuantity());

            orderRepository.saveAndFlush(order);
            orderLineRepository.saveAndFlush(orderLine);
            shippingRepository.saveAndFlush(shipping);
            shippingDetailsRepository.saveAndFlush(shippingDetails);
        }

    }

    public Order findLatestOrderByCustomer(Customer customer) {
        List<Order> orders = orderRepository.findAllByCustomer(customer);
        return orders.get(orders.size() - 1);
    }

    @Override
    public List<OrderLine> findOrderLines(Customer customer) {
        Order latest = findLatestOrderByCustomer(customer);
        return orderLineRepository.findAllByOrderId(latest.getId());
    }

    @Override
    public Invoice<InvoiceLine> createInvoice(Customer customer) {
        Order latest = findLatestOrderByCustomer(customer);
        List<OrderLine> list = orderLineRepository.findAllByOrderId(latest.getId());
        Invoice<InvoiceLine> invoice = new Invoice<InvoiceLine>();
        BigDecimal totalPrice = BigDecimal.ZERO;
        for (OrderLine line : list) {

            BigDecimal totalPricePerProduct = Util.multiplyCurrencies(line.getProduct().getUnitPrice(), new BigDecimal(line.getQuantity()));
            totalPrice = Util.addCurrencies(totalPrice, totalPricePerProduct);

            String dollars = Util.getPriceInDollars(totalPricePerProduct);
            String unitPrice = Util.getPriceInDollars(line.getProduct().getUnitPrice());

            InvoiceLine invoiceLine = new InvoiceLine(line.getProductId(), line.getProduct().getName(), line.getQuantity(), unitPrice, dollars);
            invoice.addElement(invoiceLine);
        }

        invoice.setTotal(Util.getPriceInDollars(totalPrice));

        return invoice;
    }
}
