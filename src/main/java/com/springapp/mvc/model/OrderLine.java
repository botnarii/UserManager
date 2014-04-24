package com.springapp.mvc.model;


import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.*;
import java.io.Serializable;


@Entity
@Table(name = "ORDER_LINE")
public class OrderLine implements Serializable {

    @EmbeddedId
    private OrderLineId pk;

    @Column(name = "QUANTITY")
    private int quantity;

    public OrderLine() {
    }

    public OrderLine(int quantity) {
        this.quantity = quantity;
    }

    public OrderLine(OrderLineId pk, int quantity) {
        this.pk = pk;
        this.quantity = quantity;
    }

    public OrderLineId getPk() {
        return pk;
    }

    public void setPk(OrderLineId pk) {
        this.pk = pk;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return getPk().getProduct();
    }

    public Long getProductId() {
        return getPk().getProduct().getProductId();
    }
}
