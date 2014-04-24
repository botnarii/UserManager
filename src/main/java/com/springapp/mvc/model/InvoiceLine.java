package com.springapp.mvc.model;


import java.io.Serializable;

public class InvoiceLine implements Serializable {

    private long prodId;
    private String name;
    private int qty;
    private String unityPrice;
    private String totalPrice;

    public InvoiceLine() {
    }

    public InvoiceLine(long prodId, String name, int qty, String unityPrice, String totalPrice) {
        this.prodId = prodId;
        this.name = name;
        this.qty = qty;
        this.unityPrice = unityPrice;
        this.totalPrice = totalPrice;
    }

    public long getProdId() {
        return prodId;
    }

    public void setProdId(long prodId) {
        this.prodId = prodId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public String getUnityPrice() {
        return unityPrice;
    }

    public void setUnityPrice(String unityPrice) {
        this.unityPrice = unityPrice;
    }

    public String getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }
}
