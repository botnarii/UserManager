<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title product-header">Our Products</h2>
                    </div>
                    <div class="panel-body">
                        <c:choose>
                            <c:when test="${empty products}">
                                <p>Our stocks are empty.</p>
                            </c:when>
                            <c:otherwise>
                                <div class="productList">
                                    <ul>
                                        <c:forEach var="product" items="${products}">
                                            <li class="pull-left" style="width: 160px; list-style: none">
                                                <div class="product">
                                                    <div class="product_img">
                                                        <img src="<c:url value='/download/${product.productId}'/>" width="150px" height="150px">
                                                    </div>
                                                    <div class="product_label" style="width: 150px; height: 185px;">
                                                        <div class="pull-left ">
                                                            <div class="product_descr">
                                                                <strong>${product.name}</strong>
                                                            </div>
                                                            <div class="product_price">
                                                                <p>Price: $${product.unitPrice}</p>
                                                            </div>
                                                        </div>
                                                        <div style="height: 45%;"></div>
                                                        <div class="pull-right" style="margin-right: 10%;">
                                                            <form:form id="cartForm" method="get" action="${flowExecutionUrl}">
                                                                <div style="float: left; padding-right: 15px;">
                                                                    <input type="number" id="qty" name="addQty" value="1" class="form-control" style="height: 30px; width: 90px" >
                                                                    <input type="hidden" name="_eventId" value="addToCart">
                                                                    <input type="hidden" name="productId" value="${product.productId}">
                                                                </div>
                                                                <div>
                                                                    <input type="submit" class="btn btn-primary" value="add to cart">
                                                                </div>
                                                                <div class="clearfix"></div>
                                                            </form:form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </c:otherwise>
                        </c:choose>
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
                                        <h5 class="list-group-item-heading">${item.product.name} <span class="pull-right"><a href="${flowExecutionUrl}&_eventId=delete&productId=${item.product.productId}">[delete]</a></span></h5>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">${item.quantity}x</div>
                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><img src="<c:url value='/download/${item.product.productId}'/>" width="50px" height="50px"></div>
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
                                                Total: ${shoppingCart.totalPriceInDollars}
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
