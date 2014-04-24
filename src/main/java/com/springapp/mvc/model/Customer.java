package com.springapp.mvc.model;



import com.springapp.mvc.controller.validators.UniqueCustomer;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "CUSTOMERS")
public class Customer implements Serializable {


    @Id
    @GeneratedValue(generator="increment")
    @GenericGenerator(name="increment", strategy = "increment")
    @Column(name = "CUSTOMER_ID")
    private long customerId;

    @Column(name = "USER_NAME", length = 45, nullable = false)
    private String username;

    @Column(name = "PASSWORD", length = 45, nullable = false)
    private String password;

    @Column(name = "FIRST_NAME", length = 45, nullable = false)
    private String firstName;

    @Column(name = "LAST_NAME", length = 45, nullable = false)
    private String lastName;

    @Column(name = "EMAIL", length = 100, nullable = false)
    private String email;

    @OneToMany(fetch = FetchType.EAGER, mappedBy="customer", cascade=CascadeType.ALL, orphanRemoval = true)
    private List<Address> addresses;

    @Column(name = "USER_ROLE", length = 45, nullable = false)
    private String userRole = Role.ROLE_USER.getRole();

    @Column(name = "ENABLED")
    private short enabled = 1;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "customer", cascade = CascadeType.ALL)
    private List<Order> order = new ArrayList<Order>();

    public Customer() {
    }

    public Customer(String username, String password, String firstName, String lastName, String email, String userRole, short enabled) {
        this.username = username;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.userRole = userRole;
        this.enabled = enabled;
    }

    public long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(long customerId) {
        this.customerId = customerId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public short getEnabled() {
        return enabled;
    }

    public void setEnabled(short enabled) {
        this.enabled = enabled;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Order> getOrder() {
        return order;
    }

    public void setOrder(List<Order> order) {
        this.order = order;
    }

    public List<Address> getAddresses() {
        return addresses;
    }

    public void setAddresses(List<Address> addresses) {
        this.addresses = addresses;
    }

    public Address findAddressById(Integer id) {
        Address result = null;

        if (addresses != null) {
            for (Address address : addresses) {
                if (address.getId().equals(id)) {
                    result = address;

                    break;
                }
            }
        }
        return result;
    }

    public Address getBillingAddress() {
        Address result = null;
        for (int i = 0; i < getAddresses().size(); i++) {
            if (getAddresses().get(i).getAddressType().equals("billing")) {
                result = getAddresses().get(i);
            }
        }
        return result;
    }

    public Address getShippingAddress() {
        Address result = null;
        for (int i = 0; i < getAddresses().size(); i++) {
            if (getAddresses().get(i).getAddressType().equals("shipping")) {
                result = getAddresses().get(i);
            }
        }
        return result;
    }

    public void deleteAddress(Address address) {
        for (int i = 0; i < getAddresses().size(); i++) {
            if (getAddresses().get(i).equals(address)) {
                getAddresses().remove(i);
            }
        }
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == this) return true;
        if (!(obj instanceof Customer)) return false;
        Customer client = (Customer) obj;
        return client.customerId == customerId && client.username.equals(username) && client.email.equals(email);
    }
}
