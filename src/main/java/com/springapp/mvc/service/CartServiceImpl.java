package com.springapp.mvc.service;


import com.springapp.mvc.model.Product;
import com.springapp.mvc.model.ProductModel;
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
    public List<Product> sortProducts(ProductModel model) {
        List<Product> productList = getProducts();
        List<Product> tempList = new ArrayList<Product>();
        if (null != model.getScreen()) {
            for (int size : model.getScreen()) {
                for (Product product : productList) {
                    if (size == 13) {
                        if (product.getDisplaySize() <= size) {
                            tempList.add(product);
                        }
                    } else if (size == 18) {
                        if (product.getDisplaySize() >= size) {
                            tempList.add(product);
                        }
                    } else {
                        if (product.getDisplaySize() == size) {
                            tempList.add(product);
                        }
                    }
                }
            }
        }
        return tempList;
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
    public int getCartSize() {
        return shoppingCart.getItemCount();
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
