<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
                        <h4>Shopping Cart</h4>
                    </div>
                </div>
                <div class="row" style="border: 1px solid #000000">
                    <c:choose>
                        <c:when test="${empty shoppingCart.items}">
                            <p>Your cart is empty.</p>
                        </c:when>
                        <c:otherwise>
                            <div class="final-order-tab">
                                <h3>Your Cart - ${shoppingCart.itemCount} items</h3>
                                <table class="table table-hover">
                                    <tr class="active">
                                        <th>Item</th>
                                        <th class="numeric">Quantity</th>
                                        <th class="numeric">Unit Price</th>
                                        <th class="numeric">Total</th>
                                        <th class="numeric">Action</th>
                                    </tr>
                                    <c:forEach var="item" items="${shoppingCart.items}">
                                        <tr>
                                            <th><img style="height:auto; width:auto; max-width:100px; max-height:67px;" src="<c:url value='/download/${item.product.productId}'/>">&nbsp;${item.product.name}</th>
                                            <td class="numeric">${item.quantity}</td>
                                            <td class="numeric">${item.unitPriceInDollars}</td>
                                            <td class="numeric">${item.totalPriceInDollars}</td>
                                            <td class="numeric"><a href="${flowExecutionUrl}&_eventId=delete&productId=${item.product.productId}">[delete]</a></td>
                                        </tr>
                                    </c:forEach>
                                    <tr class="active">
                                        <th colspan="3">TOTAL:</th>
                                        <th class="numeric">${shoppingCart.totalPriceInDollars}</th>
                                    </tr>
                                </table>
                                <div class="pull-right" style="padding: 20px;">
                                    <button type="button" onclick="window.location='${flowExecutionUrl}&_eventId=pack'" class="btn btn-default"><spring:message code="label.order.makeOrder"/></button>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>