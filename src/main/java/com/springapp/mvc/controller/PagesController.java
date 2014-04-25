package com.springapp.mvc.controller;

import com.springapp.mvc.model.Product;
import com.springapp.mvc.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PagesController {

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/page", method = RequestMethod.GET)
    public String loadPage(@RequestParam long productId, Model model) {
        Product product = productService.getProduct(productId);
        model.addAttribute("productPage", product);
        return "page";
    }
}
