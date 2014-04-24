package com.springapp.mvc.model;


import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import java.io.Serializable;

@Embeddable
public class OrderLineId implements Serializable {

    @ManyToOne(optional = false)
    private Order order;
    @OneToOne(optional = true )
    private Product product;

    public OrderLineId() {
    }

    public OrderLineId(Order order, Product product) {
        this.order = order;
        this.product = product;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
