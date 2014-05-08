package com.springapp.mvc.service;


import com.springapp.mvc.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;

@Component
public class CachedDBData {

    @Autowired
    private CartService cartService;

    private List<Product> products;

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    @PostConstruct
    private void getDataFromDB() {
        //products = cartService.getProducts();
        setProducts(cartService.getProducts());
    }
}
