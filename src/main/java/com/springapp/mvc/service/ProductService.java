package com.springapp.mvc.service;


import com.springapp.mvc.model.Product;
import com.springapp.mvc.model.ShoppingCart;

import java.util.List;

public interface ProductService {
    ShoppingCart getShoppingCart();

    Product save(Product product);
    List<Product> getProducts();

    List<Product> getRecommendations();

    Product getProduct(long productId);

    List<String> getShippingOptions();

    void submitOrderForPayment();

    void deleteAllProducts();
    void deleteOneProduct(long productId);
}
