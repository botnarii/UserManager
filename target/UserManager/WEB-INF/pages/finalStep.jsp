<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                <h4>Final Details</h4>
            </div>
            <div style="padding: 50px; margin: 0 auto; border: 1px solid #000000">
                <div style="margin: 0 auto;">
                    <h4>Order ID: ${order.id}</h4>
                    <h6>From: <fmt:formatDate value="${order.dateTime}" pattern="dd-MM-yyyy HH:mm:ss"/></h6>
                    <h6>Client's name: ${customer.lastName}, ${customer.firstName}</h6>
                </div>
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
        </div>
    </div>
</div>
</body>
</html>
