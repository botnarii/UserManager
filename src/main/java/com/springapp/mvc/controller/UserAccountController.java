package com.springapp.mvc.controller;


import com.springapp.mvc.model.Address;
import com.springapp.mvc.model.Customer;
import com.springapp.mvc.model.Product;
import com.springapp.mvc.model.RegistrationForm;
import com.springapp.mvc.service.CustomerService;
import com.springapp.mvc.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.math.BigDecimal;
import java.security.Principal;

@SessionAttributes("customer")
@Controller
public class UserAccountController {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap model, Principal principal) {
        return "account/login";
    }

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String getCredentials(ModelMap model, Principal principal) {
        String username = principal.getName();
        Customer customer = customerService.findByUsername();
        model.addAttribute("customer", customer);
        return "redirect:/home";
    }

    @RequestMapping(value = "/accessdenied", method = RequestMethod.GET)
    public String loginerror(ModelMap model) {
        model.addAttribute("error", "true");
        return "account/denied";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout() {
        return "account/logout";
    }

    @RequestMapping("/test/update")
    public String registerFlow(){
        /**Products*/
        Product product1 = new Product("Pizza cu salam.",new BigDecimal(18.95),200, "images/products/pizza_cu_salam.png");
        Product product2 = new Product("Pizza vegetariana.",new BigDecimal(11.25),1000, "images/products/pizza_vegetariana.png");
        Product product3 = new Product("Placinta cu varza.",new BigDecimal(16.99),400, "images/products/placinta_cu_varza.png");
        Product product4 = new Product("Placinta cu cartofi.",new BigDecimal(16.94),450, "images/products/placinta_cu_cartofi.png");
        Product product5 = new Product("Pateu cu cartofi.",new BigDecimal(12.90),900, "images/products/pateu_cu_cartofi.png");
        Product product6 = new Product("Pateu cu carne.",new BigDecimal(14.99),700, "images/products/pateu_cu_carne.png");
        productService.save(product1);
        productService.save(product2);
        productService.save(product3);
        productService.save(product4);
        productService.save(product5);
        productService.save(product6);
        return "redirect:/home";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String getRegistration(Model model) {
        model.addAttribute("customer", new Customer());
        model.addAttribute("registrationForm", new RegistrationForm());
        return "account/registrationForm";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@Valid RegistrationForm registrationForm, BindingResult result, Model model) {
        if (result.hasErrors()){
            System.out.println("has errors");
            return "account/registrationForm";
        } else {
            Customer customer = customerService.createCustomerFromFormModel(registrationForm);
            model.addAttribute("customer", customer);
            customerService.save(customer);
            return "redirect:/login";
        }
    }

    @RequestMapping(value = "/register/address", method = RequestMethod.GET)
    public String getAddress(Model model) {
        Address address = new Address();
        model.addAttribute("address", address);
        return "account/address";
    }

    @RequestMapping(value = "/register/address", method = RequestMethod.POST)
    public String setAddress(@ModelAttribute("address")Address address, HttpSession session, Model model) {
        Customer sessionCustomer = (Customer)session.getAttribute("customer");
        Customer dbCustomer = customerService.findByEmail(sessionCustomer.getEmail());
        dbCustomer.getAddresses().add(address);
        address.setCustomer(dbCustomer);
        customerService.save(address);
        model.addAttribute("customer", dbCustomer);
        return "redirect:/login";
    }

}
