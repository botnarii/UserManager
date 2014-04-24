package com.springapp.mvc.model;


import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "SHIPPING")
public class Shipping extends AbstractPersistable<Long> implements Serializable {

    @Column(name = "DATE_TIME")
    private Timestamp dateTime;

    /**
     * <p>Sets primary key.</p>
     *
     * <p><strong>Note</strong>: <code>AbstractPersistable</code>
     * does not allow a public set of the pk.</p>
     */
    public void setPk(Long id) {
        this.setId(id);
    }

    public Shipping() {
    }

    public Shipping(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }
}
