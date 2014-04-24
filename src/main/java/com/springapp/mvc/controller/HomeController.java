package com.springapp.mvc.controller;

import com.springapp.mvc.model.Customer;
import com.springapp.mvc.model.Product;
import com.springapp.mvc.service.CartService;
import com.springapp.mvc.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    private CartService cartService;
    @Autowired
    private CustomerService customerService;

    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

    @RequestMapping(value = "home",method = RequestMethod.GET)
    public String printWelcome(ModelMap model) {
        model.addAttribute("message", "Welcome To The Shop");
        List<Product> list = cartService.getProducts();
        model.addAttribute("products", list);
        model.addAttribute("shoppingCart", cartService.getShoppingCart());
        createWebAdmin();
        return "home";
    }

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String goHome(ModelMap model) {
        model.addAttribute("message", "Welcome To The Shop");
        List<Product> list = cartService.getProducts();
        model.addAttribute("products", list);
        model.addAttribute("shoppingCart", cartService.getShoppingCart());
        createWebAdmin();
        return "home";
    }

    private void createWebAdmin() {
        boolean newUser = customerService.checkUniqueCustomerRegistrationByUsername("admin");
        if (!newUser) {
            Customer customer = new Customer("admin", "12345", "Ion", "Botnari", "ionb87@outlook.com", "ROLE_ADMIN", (short) 1);
            customerService.save(customer);
        }
    }
}