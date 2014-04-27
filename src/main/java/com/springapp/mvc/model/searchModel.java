package com.springapp.mvc.model;


import java.math.BigDecimal;

public class SearchModel {

    private String name;
    private BigDecimal unitPrice;
    private String brand;
    private String currentOffer;
    private int displaySize;

    public SearchModel() {
    }

    public SearchModel(String name, BigDecimal unitPrice, String brand, String currentOffer, int displaySize) {
        this.name = name;
        this.unitPrice = unitPrice;
        this.brand = brand;
        this.currentOffer = currentOffer;
        this.displaySize = displaySize;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getCurrentOffer() {
        return currentOffer;
    }

    public void setCurrentOffer(String currentOffer) {
        this.currentOffer = currentOffer;
    }

    public int getDisplaySize() {
        return displaySize;
    }

    public void setDisplaySize(int displaySize) {
        this.displaySize = displaySize;
    }
}
