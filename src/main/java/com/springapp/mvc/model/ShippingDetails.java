package com.springapp.mvc.model;


import org.springframework.data.jpa.domain.AbstractPersistable;


import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "SHIPPING_DETAILS")
public class ShippingDetails implements Serializable {

    @EmbeddedId
    private ShippingDetailsId pk;

    @Column(name = "DELIVERED_QTY")
    private int deliveredQuantity;

    public ShippingDetails() {
    }

    public ShippingDetails(ShippingDetailsId pk, int deliveredQuantity) {
        this.pk = pk;
        this.deliveredQuantity = deliveredQuantity;
    }

    public int getDeliveredQuantity() {
        return deliveredQuantity;
    }

    public void setDeliveredQuantity(int deliveredQuantity) {
        this.deliveredQuantity = deliveredQuantity;
    }

    public ShippingDetailsId getPk() {
        return pk;
    }

    public void setPk(ShippingDetailsId pk) {
        this.pk = pk;
    }
}
