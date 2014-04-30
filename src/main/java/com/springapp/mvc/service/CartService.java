package com.springapp.mvc.service;


import com.springapp.mvc.model.Product;
import com.springapp.mvc.model.ShoppingCart;

import java.util.List;

public interface CartService {

    ShoppingCart getShoppingCart();

    List<Product> getProducts();

    List<Product> getRecommendations();

    Product getProduct(long productId);
    int getCartSize();

    List<String> getShippingOptions();

    void submitOrderForPayment();

    void deleteAllProducts();
    void deleteOneProduct(long productId);
}
