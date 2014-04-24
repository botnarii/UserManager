package com.springapp.mvc.model;


import com.springapp.mvc.controller.validators.FieldMatch;
import com.springapp.mvc.controller.validators.UniqueCustomer;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


@FieldMatch(first = "password", second = "confirmPassword")
public class RegistrationForm {

    @NotEmpty
    @UniqueCustomer
    @Size(max = 45, message = "UniqueCustomer too long")
    @Pattern(regexp = "[a-z-A-Z0-9]*", message = "UniqueCustomer has invalid characters")
    private String username;

    @NotEmpty
    @Pattern(regexp = "[a-z-A-Z0-9]*", message = "Password has invalid characters")
    @Size(min = 5, max = 9,  message = "Password length should be between 5 to 9 Characters.")
    private String password;

    @NotEmpty
    @Pattern(regexp = "[a-z-A-Z0-9]*", message = "Password has invalid characters")
    @Size(min = 5, max = 9,  message = "Password length should be between 5 to 9 Characters.")
    private String confirmPassword;

    @NotEmpty
    @Size(max = 45, message = "First name too long")
    @Pattern(regexp = "[a-z-A-Z]*", message = "First name has invalid characters")
    private String firstName;

    @NotEmpty
    @Size(max = 45, message = "Last name too long")
    @Pattern(regexp = "[a-z-A-Z]*", message = "Last name has invalid characters")
    private String lastName;

    @NotEmpty
    @UniqueCustomer
    @Email
    @Size(max = 100, message = "Email too long")
    private String email;

    private short enabled;


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
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

    public short getEnabled() {
        return enabled;
    }

    public void setEnabled(short enabled) {
        this.enabled = enabled;
    }
}
