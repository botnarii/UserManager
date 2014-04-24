package com.springapp.mvc.service;


import com.springapp.mvc.model.Product;
import com.springapp.mvc.model.ShoppingCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service("cartService")
public class CartServiceImpl implements CartService {

    @Autowired
    private ShoppingCart shoppingCart;
    @Autowired
    private ProductService product;

    @Override
    public ShoppingCart getShoppingCart() {
        return shoppingCart;
    }

    @Override
    public List<Product> getProducts() {
        List<Product> list = product.getProducts();
        Collections.sort(list);
        return list;
    }

    @Override
    public List<Product> getRecommendations() {
        return null;
    }

    @Override
    public Product getProduct(long productId) {
        return product.getProduct(productId);
    }

    @Override
    public List<String> getShippingOptions() {
        return null;
    }

    @Override
    public void submitOrderForPayment() {
        shoppingCart.clear();
    }

    @Override
    public void deleteAllProducts() {
        shoppingCart.clear();
    }

    @Override
    public void deleteOneProduct(long productId) {
        shoppingCart.deleteItem(productId);
    }
}
