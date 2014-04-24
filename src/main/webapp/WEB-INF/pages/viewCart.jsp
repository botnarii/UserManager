<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checkout</title>

    <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">

    <style type="text/css" >
        .shoppingCart {
            background: #e7ffcc;
            border-left: 1px solid #000000;
            border-bottom: 1px solid #000000;
            border-right: 1px solid #000000;
            float: right;
            width: 450px;
            padding: 10px;
            margin: 0;;
        }
        .addressBox {
            width: 450px;
            margin: 0;
            padding: 10px;

        }
        .creditInfo {
            margin-bottom: 20px;
            padding: 0;
        }
    </style>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
    </script>
    <script>
        $(document).ready(function(){
            $(".slidingDiv").hide();
            $("#show").click(function() {
                $(".slidingDiv").show(1000, function(){
                    console.log('Paragraph is shown.');
                });
            });

            $("#hide").click(function() {
                $(".slidingDiv").hide(1000, function(){
                    console.log('Paragraph is hidden.');
                });
            });

            $("#toggle").click(function() {
                $(".slidingDiv").toggle(1000);
            });

        });
    </script>

</head>
<body>
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-body">
                <div style="padding: 50px 50px 20px 10px;">
                    <a href="${flowExecutionUrl}&_eventId=cancelCheckout">[cancel]</a>
                </div>
                <div style="margin: 0 auto;" >
                    <h4>Shopping Cart</h4>
                </div>
                <div style="padding: 50px; border: 1px solid #000000">
                    <c:choose>
                        <c:when test="${empty shoppingCart.items}">
                            <p>Your cart is empty.</p>
                        </c:when>
                        <c:otherwise>
                            <div class="shoppingCart">
                                <h3>Your Cart - ${shoppingCart.itemCount} items</h3>
                                <table>
                                    <tr>
                                        <th>Item</th>
                                        <th class="numeric">Quantity</th>
                                        <th class="numeric">Unit Price</th>
                                        <th class="numeric">Total</th>
                                        <th class="numeric">Action</th>
                                    </tr>
                                    <c:forEach var="item" items="${shoppingCart.items}">
                                        <tr>
                                            <td>${item.product.description}</td>
                                            <td class="numeric">${item.quantity}</td>
                                            <td class="numeric">${item.unitPriceInDollars}</td>
                                            <td class="numeric">${item.totalPriceInDollars}</td>
                                            <td class="numeric"><a href="${flowExecutionUrl}&_eventId=delete&productId=${item.product.productId}">[delete]</a></td>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <td>TOTAL:</td>
                                        <td></td>
                                        <td></td>
                                        <td class="numeric">${shoppingCart.totalPriceInDollars}</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="float: right; padding: 20px;">
                                                <button type="button" onclick="window.location='${flowExecutionUrl}&_eventId=customerAddress'" class="btn btn-default"><spring:message code="label.order.makeOrder"/></button>
                                            </div>
                                            <div class="clearfix"></div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${empty products}">
                            <p>Our stocks are empty.</p>
                        </c:when>
                        <c:otherwise>
                            <div style="float: left;">
                                <div style="padding: 50px; border: 1px solid #ff0000">
                                    <h2>Our Products</h2>
                                    <table>
                                        <c:forEach var="product" items="${products}">
                                            <tr>
                                                <td>${product.description}</td>
                                                <td class="numeric">${product.unitPrice}</td>
                                                <td>
                                                    <form:form>
                                                        <div style="float: left; padding-right: 15px;">
                                                            <input type="number" name="addQty" value="1" class="form-control" style="height: 30px; width: 90px" >
                                                            <input type="hidden" name="_flowExecutionUrl" value="${flowExecutionUrl}">
                                                            <input type="hidden" name="_eventId" value="addToCart">
                                                            <input type="hidden" name="productId" value="${product.productId}">
                                                        </div>
                                                        <div style="float: right">
                                                            <input type="submit" class="btn btn-primary" value="add to cart">
                                                                <%--<a href="${flowExecutionUrl}&_eventId=addToCart">[add to cart]</a>--%>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </form:form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
