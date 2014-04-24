package com.springapp.mvc.model;


import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import java.io.Serializable;

@Embeddable
public class ShippingDetailsId implements Serializable {

    @ManyToOne(optional = false)
    private Shipping shipping;
    @ManyToOne(optional = false)
    private Order order;
    @OneToOne(optional = true)
    private Product product;

    public ShippingDetailsId() {
    }

    public ShippingDetailsId(Shipping shipping, Order order, Product product) {
        this.shipping = shipping;
        this.order = order;
        this.product = product;
    }

    public Shipping getShipping() {
        return shipping;
    }

    public void setShipping(Shipping shipping) {
        this.shipping = shipping;
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
