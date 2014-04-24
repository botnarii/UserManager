package com.springapp.mvc.service;


import com.springapp.mvc.model.*;

import java.util.List;

public interface CustomerService {

    Customer createCustomerFromFormModel(RegistrationForm form);

    Customer save(Customer customer);
    Address save(Address address);
    Address saveAddr(Address address, int option);
    Address editAddr(Address address, int option);
    void deleteAddressById(Long addressId);
    Customer findCustomerById(long customerId);
    Customer findByEmail(String email);
    Customer findByUsername();
    Customer findByUsernameAndPassword(String username, String password);
    Boolean checkAddress(int option);
    Customer packOrder(ShoppingCart shoppingCart);

    List<OrderLine> findOrderLines(Customer customer);
    Order findLatestOrderByCustomer(Customer customer);

    Invoice<InvoiceLine> createInvoice(Customer customer);

    boolean checkUniqueCustomerRegistrationByUsername(String username);
    boolean checkUniqueCustomerRegistrationByEmail(String email);
}
