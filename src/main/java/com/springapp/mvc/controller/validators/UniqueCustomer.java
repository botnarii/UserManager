package com.springapp.mvc.controller.validators;




import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = UniqueCustomerConstraintValidator.class)
@Target({ ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
public @interface UniqueCustomer {

    String message() default "{UniqueCustomer}";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
