package com.springapp.mvc.service;


import com.springapp.mvc.model.AddProductForm;
import com.springapp.mvc.model.Product;
import com.springapp.mvc.model.SearchModel;
import com.springapp.mvc.model.ShoppingCart;

import java.util.List;

public interface ProductService {
    ShoppingCart getShoppingCart();

    Product save(Product product);
    List<Product> getProducts();

    List<Product> getRecommendations();

    Product getProduct(long productId);

    List<String> getShippingOptions();

    Product createProductFromModel(AddProductForm article);
    List<Product> findProductsFromModel(SearchModel searchQuery);
    boolean inStock(long productId);

    void deleteAllProducts();
    void deleteOneProduct(long productId);
}
