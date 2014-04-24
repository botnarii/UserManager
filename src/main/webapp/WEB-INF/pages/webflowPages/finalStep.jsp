<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="row">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="col-lg-12">
                <div class="row">
                    <div class="pull-right">
                        <a href="${flowExecutionUrl}&_eventId=cancelCheckout">[cancel]</a>
                    </div>
                    <div class="pull-left" >
                        <h4>Invoice</h4>
                    </div>
                </div>
                <div class="row" style="border: 1px solid #000000">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-lg-4">
                            </div>
                            <div class="col-lg-4">
                                <h3>Invoice</h3>
                                <h4>Order ID: ${order.id}</h4>
                                <h5>Date: <fmt:formatDate value="${order.dateTime}" pattern="dd-MM-yyyy HH:mm:ss"/></h5>
                                <h5>Client: ${customer.lastName}, ${customer.firstName}</h5>
                            </div>
                            <div class="col-lg-4">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <address>
                                    <strong>Billing Address</strong><br>
                                    ${customer.billingAddress.street}<br>
                                    ${customer.billingAddress.city}<br>
                                    ${customer.billingAddress.state}<br>
                                    ${customer.billingAddress.country}<br>
                                    ${customer.billingAddress.zipCode}<br>
                                </address>
                            </div>
                            <div class="col-lg-6">
                                <div class="pull-right">
                                    <address>
                                        <strong>Shipping Address</strong><br>
                                        ${customer.shippingAddress.street}<br>
                                        ${customer.shippingAddress.city}<br>
                                        ${customer.shippingAddress.state}<br>
                                        ${customer.shippingAddress.country}<br>
                                        ${customer.shippingAddress.zipCode}<br>
                                    </address>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <table class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>Product ID</th><th>Product Description</th><th>Purchased Articles</th><th>Unity Price</th><th>Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${invoice.invoiceElement}" var="invoiceLine">
                                    <tr>
                                        <td>${invoiceLine.prodId}</td><td>${invoiceLine.name}</td><td>${invoiceLine.qty}</td><td>${invoiceLine.unityPrice}</td><td>${invoiceLine.totalPrice}</td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <th>Total</th><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><th>${invoice.total}</th>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="pull-right" style="padding: 20px;">
                                <button type="button" onclick="window.location='${flowExecutionUrl}&_eventId=orderOk'" class="btn btn-default"><spring:message code="label.order.finishOrder"/></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
