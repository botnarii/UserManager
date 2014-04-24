package com.springapp.mvc.controller.validators;


import org.mvel2.MVEL;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class FieldMatchValidator implements ConstraintValidator<FieldMatch, Object>
{
    private String firstFieldName;
    private String secondFieldName;

    @Override
    public void initialize(final FieldMatch constraintAnnotation)
    {
        firstFieldName = constraintAnnotation.first();
        secondFieldName = constraintAnnotation.second();
    }

    @Override
    public boolean isValid(final Object value, final ConstraintValidatorContext context) {
        final Object firstObj = MVEL.getProperty(firstFieldName, value);
        final Object secondObj = MVEL.getProperty(secondFieldName, value);

        if (!firstObj.equals(secondObj)) {
            context.disableDefaultConstraintViolation();
            context.buildConstraintViolationWithTemplate("The password fields must match").addNode(secondFieldName).addConstraintViolation();
            return false;
        }
        return true;
    }
}