package com.springapp.mvc.controller;


import com.springapp.mvc.model.Address;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

/**
 * Person Spring Web Flow Validator.
 * Spring Web Flow activated validation based on bean name (${model} + 'Validator').
 *
 * @author David Winterfeldt
 */
@Component
public class Address1Validator {

    /**
     * Validates 'addressForm' view state after binding to address.
     * Spring Web Flow activated validation ('validate' + ${state}).
     */
    public void validateAddressPage1(Address address, MessageContext context) {
        if (!StringUtils.hasText(address.getStreet())) {
            context.addMessage(new MessageBuilder().error().source("street").code("address.form.street.error").build());
        }

        if (!StringUtils.hasText(address.getCity())) {
            context.addMessage(new MessageBuilder().error().source("city").code("address.form.city.error").build());
        }

        if (!StringUtils.hasText(address.getState())) {
            context.addMessage(new MessageBuilder().error().source("state").code("address.form.state.error").build());
        }

        if (!StringUtils.hasText(address.getCountry())) {
            context.addMessage(new MessageBuilder().error().source("country").code("address.form.country.error").build());
        }

        if (!StringUtils.hasText(address.getZipCode())) {
            context.addMessage(new MessageBuilder().error().source("zipCode").code("address.form.zipCode.error").build());
        }
    }
}
