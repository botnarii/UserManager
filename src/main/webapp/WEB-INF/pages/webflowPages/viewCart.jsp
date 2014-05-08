<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                <div class="panel panel-default">
                    <h2 id="product-header">Your Cart</h2>
                    <div class="panel-body">
                        <div class="list-group">
                            <c:choose>
                                <c:when test="${empty shoppingCart.items}">
                                    <p>Your cart is empty.</p>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="item" items="${shoppingCart.items}">
                                        <div class="list-group-item">
                                            <div class="row">
                                                <div class="col-lg-3">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <img src="<c:url value='/download/${item.product.productId}'/>" width="100" height="100">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-2"></div>
                                                        <div class="col-lg-7">
                                                            <span><a class="deleteUrl" href="<c:url value='/delete-from-cart?productId=${item.product.productId}'/>">remove</a></span>
                                                        </div>
                                                        <div class="col-lg-3"></div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-9">
                                                    <div class="list-group-item-heading"><h2>${item.product.name}</h2></div>
                                                    <div class="well well-lg" style="margin-right: 10px;">
                                                        <p></p>
                                                        <p>${item.product.description}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                        
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 visible-lg visible-md visible-sm">
                <div class="pull-right cartContainer">
                    <c:choose>
                        <c:when test="${empty shoppingCart.items}">
                            <p>Your cart is empty.</p>
                        </c:when>
                        <c:otherwise>
                            <div class="list-group">
                                <h4>Your Cart - ${shoppingCart.itemCount} items <span class="pull-right"><a href="${flowExecutionUrl}&_eventId=cancelCheckout">[cancel]</a></span></h4>
                                <c:forEach var="item" items="${shoppingCart.items}">
                                    <div class="list-group-item">
                                        <h5 class="list-group-item-heading">${item.product.name} <span class="pull-right"><a class="deleteUrl" href="<c:url value='/delete-from-cart?productId=${item.product.productId}'/>">[delete]</a></span></h5>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">${item.quantity}x</div>
                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><img src="<c:url value='/download/${item.product.productId}'/>" width="50" height="50"></div>
                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">${item.unitPriceInDollars}</div>
                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">${item.totalPriceInDollars}</div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <div class="list-group">
                                    <div class="list-group-item">
                                        <div class="list-group-item-heading">
                                        </div>
                                        <div class="row">
                                            <div class="pull-left" style="padding-left: 10px;">
                                                <button type="button" onclick="window.location='${flowExecutionUrl}&_eventId=customerAddress'" class="btn btn-default"><spring:message code="label.order.makeOrder"/></button>
                                            </div>
                                            <div class="pull-right" style="font-weight: bold; padding-right: 10px;">
                                                Total: <span class="total-price">${shoppingCart.totalPriceInDollars}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>
