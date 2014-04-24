package com.springapp.mvc.service;


import com.springapp.mvc.model.Product;
import com.springapp.mvc.model.ShoppingCart;
import com.springapp.mvc.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("productService")
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ShoppingCart shoppingCart;

    @Override
    public ShoppingCart getShoppingCart() {
        return shoppingCart;
    }

    @Override
    @Transactional
    public Product save(Product product) {
        return productRepository.save(product);
    }

    @Override
    public List<Product> getProducts() {
        return productRepository.findAll();
    }

    @Override
    public List<Product> getRecommendations() {
        return null;
    }

    @Override
    public Product getProduct(long productId) {
        return productRepository.findOne(productId);
    }

    @Override
    public List<String> getShippingOptions() {
        return null;
    }

    @Override
    public void submitOrderForPayment() {

    }

    @Override
    public void deleteAllProducts() {
        productRepository.deleteAll();
    }

    @Override
    public void deleteOneProduct(long productId) {
        productRepository.delete(productId);
    }
}
