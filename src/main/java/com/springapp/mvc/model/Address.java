package com.springapp.mvc.model;


import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@Table(name = "ADDRESS")
public class Address extends AbstractPersistable<Integer> implements Serializable {

//    @Id
//    @GeneratedValue(strategy = GenerationType.AUTO)
//    @Column(name = "ADDRESS_ID")
//    private Long addressId;

    @Size(min = 3, max = 60, message = "")
    @Column(name="street", length = 60, nullable = false)
    private String street;

    @Size(min = 3, max = 60, message = "Min 3 max 60 characters")
    @Column(name="city", length = 60, nullable = false)
    private String city;

    @Column(name="state", length = 40, nullable = true)
    private String state;

    @Column(name="country", length = 40, nullable = false)
    private String country;

    @Column(name="ZIP_CODE", length = 10, nullable = false)
    private String zipCode;

    @Column(name = "ADDRESS_TYPE", length = 10, nullable = false)
    private String addressType;

    @ManyToOne
    @JoinColumn(name="CUSTOMER_ID", unique=false, nullable=false, updatable=false)
    private Customer customer;

    public Address() {

    }

    public Address(String street, String city, String state, String country) {
        this.street = street;
        this.city = city;
        this.state = state;
        this.country = country;
    }

    /**
     * <p>Sets primary key.</p>
     *
     * <p><strong>Note</strong>: <code>AbstractPersistable</code>
     * does not allow a public set of the pk.</p>
     */
    public void setPk(Integer id) {
        this.setId(id);
    }

//    public void setAddressId(Long customerId) {
//        this.addressId = customerId;
//    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

//    public Long getAddressId() {
//        return addressId;
//    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getAddressType() {
        return addressType;
    }

    public void setAddressType(String addressType) {
        this.addressType = addressType;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == this) return true;
        if (!(obj instanceof Address)) return false;
        Address addr = (Address) obj;
        return addr.addressType.equals(addressType) && addr.country.equals(country)
                && addr.city.equals(city) && addr.street.equals(street);
    }
}
