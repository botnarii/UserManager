package com.springapp.mvc.model;


import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Locale;

public class Util {

    public static String getPriceInDollars(BigDecimal price) {
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(Locale.US);
        return numberFormat.format(price.doubleValue());
    }

    public static BigDecimal addCurrencies(BigDecimal a, BigDecimal b) {
        return a.add(b);
    }

    public static BigDecimal multiplyCurrencies(BigDecimal a, BigDecimal b) {
        return a.multiply(b);
    }
}
