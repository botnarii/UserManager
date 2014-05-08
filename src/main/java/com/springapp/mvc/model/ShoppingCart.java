package com.springapp.mvc.model;


import com.springapp.mvc.service.ShoppingCartItem;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.*;

public class ShoppingCart implements Serializable {


    private Map<Long, ShoppingCartItem> items = new HashMap<Long, ShoppingCartItem>();

    public ShoppingCart() {
    }

    public List<ShoppingCartItem> getItems() {
        List<ShoppingCartItem> list = new ArrayList<ShoppingCartItem>(items.values());
        Collections.sort(list);
        return list;
    }

    public void addItem(Product product) {
        long productId = product.getProductId();
        ShoppingCartItem item = items.get(productId);
        if (item != null) {
            item.incrementQuantity();
        } else {
            items.put(productId, new ShoppingCartItem(product, 1));
        }
    }

    public void addItems(Product product, int qty) {
        if (qty > 0 && product.getInStockQty() > 0) {
            long productId = product.getProductId();
            ShoppingCartItem item = items.get(productId);
            if (item != null) {
                item.incrementQuantity(qty);
            } else {
                items.put(productId, new ShoppingCartItem(product, qty));
            }
        }
    }

    public void deleteItem(long productId) {
        if (items.containsKey(productId)) {
            items.remove(productId);
        }
    }

    public int getItemCount() {
        int count = 0;
        for (ShoppingCartItem item : items.values()) {
            count += item.getQuantity();
        }
        return count;
    }

    public String getTotalPriceInDollars() {
        BigDecimal total = BigDecimal.ZERO;
        for (ShoppingCartItem item : items.values()) {
            total = Util.addCurrencies(total, item.getTotalPrice());
        }
        return Util.getPriceInDollars(total);
    }

    public void clear() {
        items.clear();
    }
}
