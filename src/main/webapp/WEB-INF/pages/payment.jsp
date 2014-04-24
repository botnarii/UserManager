<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Credit Card Details</title>

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
                <a href="${flowExecutionUrl}&_eventId=cancelOperation">[cancel]</a>
            </div>
            <div style="margin: 0 auto;" >
                <h4>Payment Details</h4>
            </div>
            <div style="padding: 35px; border: 1px solid #000000">
                <sec:authorize ifAnyGranted="ROLE_USER">
                    <%--@elvariable id="shoppingCart" type="com.springapp.mvc.model.ShoppingCart"--%>
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
                                </table>
                            </div>
                            <div id="billingAddressForm" style="float: left; border-right: 1px solid #00ff00; width: 500px">
                                <div class="creditInfo">
                                    <form:form>
                                        <div class="row form-group">
                                            <div id="form-group-CardType" class="form-group col-lg-4">
                                                <label class="control-label" for="card-type">Credit Card Type:</label>
                                                <select id="card-type" class="form-control">
                                                    <option>Visa</option>
                                                    <option>MasterCard</option>
                                                    <option>Discover</option>
                                                    <option>American Express</option>
                                                </select>
                                            </div>
                                            <div class="row">
                                                <div id="form-group-CardNumber" class="form-group col-lg-4">
                                                    <label class="control-label" for="ccNumber">Credit Card Number:</label>
                                                    <input type="number" id="ccNumber" name="ccNumber"/>
                                                </div>
                                                <div id="form-group-ExpirationDate" class="form-group col-lg-4">
                                                    <label class="control-label" for="expiration">Expiration Date:</label>
                                                    <input type="date" id="expiration" name="expiration"/>
                                                </div>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                                <div style="float: left; margin-left: 0;">
                                    <input type="button" onclick="window.location='${flowExecutionUrl}&_eventId=prevStep'" class="btn btn-primary" value="Back"/>
                                </div>
                                <div style="float: right; margin-right: 110px;">
                                    <input type="button" onclick="window.location='${flowExecutionUrl}&_eventId=nextStep'" class="btn btn-primary" value="Next"/>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                        </c:otherwise>
                    </c:choose>
                </sec:authorize>
            </div>
        </div>
    </div>
</div>

</body>
</html>
