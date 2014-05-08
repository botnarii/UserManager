package com.springapp.mvc.model;


import java.io.Serializable;
import java.util.List;

public class ProductModel implements Serializable {

    private List<Integer> screen;
//    private List<String> offer;
//    private List<String> status;
//    private List<String> brand;
//    private List<Double> price;

    public List<Integer> getScreen() {
        return screen;
    }

    public void setScreen(List<Integer> screen) {
        this.screen = screen;
    }

//    public List<String> getOffer() {
//        return offer;
//    }
//
//    public void setOffer(List<String> offer) {
//        this.offer = offer;
//    }
//
//    public List<String> getStatus() {
//        return status;
//    }
//
//    public void setStatus(List<String> status) {
//        this.status = status;
//    }
//
//    public List<String> getBrand() {
//        return brand;
//    }
//
//    public void setBrand(List<String> brand) {
//        this.brand = brand;
//    }
//
//    public List<Double> getPrice() {
//        return price;
//    }
//
//    public void setPrice(List<Double> price) {
//        this.price = price;
//    }
}
