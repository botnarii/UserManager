package com.springapp.mvc.model;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Invoice<T> implements Serializable {

    private List<T> invoiceElement = new ArrayList<T>();
    private String total;


    public Invoice<T> transfer(List<T> from, Invoice<T> to) {
        for (T element : from) {
            to.addElement(element);
        }
        return to;
    }

    public void addElement(T item) {
        this.invoiceElement.add(item);
    }

    public List<T> getInvoiceElement() {
        return invoiceElement;
    }

    public void setInvoiceElement(List<T> invoiceElement) {
        this.invoiceElement = invoiceElement;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }
}
