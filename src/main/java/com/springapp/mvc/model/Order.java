package com.springapp.mvc.model;


import org.springframework.data.jpa.domain.AbstractPersistable;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "ORDER_LIST")
public class Order extends AbstractPersistable<Long> implements Serializable {

    @Column(name = "DATE_TIME")
    private Timestamp dateTime;

    @ManyToOne
    @JoinColumn(name="CUSTOMER_ID", unique=false, nullable=false, updatable=false)
    private Customer customer;

    /**
     * <p>Sets primary key.</p>
     *
     * <p><strong>Note</strong>: <code>AbstractPersistable</code>
     * does not allow a public set of the pk.</p>
     */
    public void setPk(Long id) {
        this.setId(id);
    }


    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }


}
