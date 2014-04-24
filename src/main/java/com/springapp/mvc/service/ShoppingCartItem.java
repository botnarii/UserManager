package com.springapp.mvc.service;


import com.springapp.mvc.model.Product;
import com.springapp.mvc.model.Util;

import java.io.Serializable;
import java.math.BigDecimal;

public class ShoppingCartItem implements Comparable<ShoppingCartItem>, Serializable {

    private Product product;
    private int quantity;

    public ShoppingCartItem(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void incrementQuantity() {
        quantity ++;
    }

    public void incrementQuantity(int qty) {
        quantity += qty;
    }

    public BigDecimal getUnitPrice() {
        return product.getUnitPrice();
    }

    public BigDecimal getTotalPrice() {
        return Util.multiplyCurrencies(getUnitPrice(), new BigDecimal(quantity));
    }

    public String getUnitPriceInDollars() {
        return Util.getPriceInDollars(getUnitPrice());
    }

    public String getTotalPriceInDollars() {
        return Util.getPriceInDollars(getTotalPrice());
    }

    @Override
    public boolean equals(Object o) {
        return o instanceof ShoppingCartItem &&
                product.equals(((ShoppingCartItem) o).product);
    }

    @Override
    public int hashCode() {
        return product.hashCode();
    }

    public int compareTo(ShoppingCartItem item) {
        return product.compareTo(item.product);
    }
}
