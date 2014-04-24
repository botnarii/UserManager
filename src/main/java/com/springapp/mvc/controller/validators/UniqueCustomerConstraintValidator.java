package com.springapp.mvc.controller.validators;


import com.springapp.mvc.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class UniqueCustomerConstraintValidator implements ConstraintValidator<UniqueCustomer, String> {

    @Autowired
    private CustomerService customerService;

    @Override
    public void initialize(UniqueCustomer constraintAnnotation) {

    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        boolean isValidUsername = !customerService.checkUniqueCustomerRegistrationByUsername(value); //value != null
        boolean isValidEmail = !customerService.checkUniqueCustomerRegistrationByEmail(value);

        if (!isValidUsername) {
            context.disableDefaultConstraintViolation();
            context.buildConstraintViolationWithTemplate("Such username is already in use.").addConstraintViolation();
            return false;
        } else if (!isValidEmail) {
            context.disableDefaultConstraintViolation();
            context.buildConstraintViolationWithTemplate("Such email is already in use.").addConstraintViolation();
            return false;
        }
        return true;
    }
}
