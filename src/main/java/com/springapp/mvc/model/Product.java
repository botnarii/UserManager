package com.springapp.mvc.model;


import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Size;
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

    @Column(name = "DESCRIPTION", length = 3000)
    private String description;
    @Column(name = "UNIT_PRICE")
    private BigDecimal unitPrice;
    @Column(name = "IN_STOCK_QTY")
    private Integer inStockQty = 0;
    @Column(name="PRODUCT_IMAGE")
    @Lob
    private Blob image;
    @Column(name = "PRODUCT_BRAND")
    private String brand;
    @Column(name = "PRODUCT_OFFER")
    private String currentOffer;
    @Column(name = "PRODUCT_DISPLAY")
    private Integer displaySize = 0;
    @Column(name = "ADDED_DATE")
    private Timestamp dateTime;

    public Product(){}

    public Product(String description, BigDecimal unitPrice, int inStockQty) {
        this.description = description;
        this.unitPrice = unitPrice;
        this.inStockQty = inStockQty;
    }

    public Product(long productId, String description, BigDecimal unitPrice, int inStockQty) {
        this.description = description;
        this.unitPrice = unitPrice;
        this.inStockQty = inStockQty;
        this.productId = productId;
    }

    public Product(String name, String description, BigDecimal unitPrice, int inStockQty, Blob image, String brand, String currentOffer, int displaySize, Timestamp dateTime) {
        this.name = name;
        this.description = description;
        this.unitPrice = unitPrice;
        this.inStockQty = inStockQty;
        this.image = image;
        this.brand = brand;
        this.currentOffer = currentOffer;
        this.displaySize = displaySize;
        this.dateTime = dateTime;
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

    public void setInStockQty(Integer inStockQty) {
        this.inStockQty = inStockQty;
    }

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

    public void setDisplaySize(Integer displaySize) {
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
