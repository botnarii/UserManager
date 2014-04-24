package com.springapp.mvc.model;


import com.sun.deploy.net.HttpResponse;
import org.springframework.http.HttpRequest;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Blob;
import java.sql.Timestamp;

@Entity
@Table(name = "PRODUCTS")
public class Product implements Comparable<Product>, Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "PRODUCT_ID")
    private long productId;
    @Column(name = "PRODUCT_NAME")
    private String name;
    @Column(name = "DESCRIPTION", length = 600)
    private String description;
    @Column(name = "UNIT_PRICE")
    private BigDecimal unitPrice;
    @Column(name = "IN_STOCK_QTY")
    private int inStockQty;
//    @Column(name = "IMG_URL")
//    private String imgUrl;
    @Column(name="PRODUCT_IMAGE")
    @Lob
    private Blob image;
    @Column(name = "PRODUCT_BRAND")
    private String brand;
    @Column(name = "PRODUCT_OFFER")
    private String currentOffer;
    @Column(name = "PRODUCT_DISPLAY")
    private int displaySize;
    @Column(name = "ADDED_DATE")
    private Timestamp dateTime;


    public Product(){}

    public Product(String description, BigDecimal unitPrice, int inStockQty, String imgUrl) {
        this.description = description;
        this.unitPrice = unitPrice;
        this.inStockQty = inStockQty;
//        this.imgUrl = imgUrl;
    }

    public Product(long productId, String description, BigDecimal unitPrice, int inStockQty) {
        this.description = description;
        this.unitPrice = unitPrice;
        this.inStockQty = inStockQty;
        this.productId = productId;
    }

    public long getProductId() {
        return productId;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getInStockQty() {
        return inStockQty;
    }

    public void setInStockQty(int inStockQty) {
        this.inStockQty = inStockQty;
    }
//
//    public String getImgUrl() {
//        return imgUrl;
//    }
//
//    public void setImgUrl(String imgUrl) {
//        this.imgUrl = imgUrl;
//    }

    public Blob getImage() {
        return image;
    }

    public void setImage(Blob image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }



    @Override
    public int compareTo(Product p) {
        int c = description.compareTo(p.description);
        return (c == 0 ? ((Long) productId).compareTo((Long) p.productId) : c);
    }
}
