<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Home</title>

    <%--<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">--%>
    <%--<link href="http://getbootstrap.com/dist/css/bootstrap-responsive.min.css" rel="stylesheet">--%>
    <link href="<c:url value='/css/bootstrap-theme.css' /> " rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/bootstrap.css'/> " rel="stylesheet" type="text/css">
    <style>
        .numeric {
            padding-right: 40px;
            margin: 0;
        }
    </style>
</head>
<body>
	<div style="float: left">
        <h1>${message}</h1>
	</div>
    <div style="float: right">
        <ul style="list-style: none; float: left">
            <li>
                <sec:authorize ifAnyGranted="ROLE_USER">
                    <a href="${pageContext.request.contextPath}/logout">[logout]</a>
                </sec:authorize>
            </li>
            <li>
                <sec:authorize access="isAnonymous()">
                    <a href="${pageContext.request.contextPath}/login">[login]</a>
                </sec:authorize>
            </li>
        </ul>
    </div>
    <div style="clear: both"></div>
    <h2>Your Cart</h2>
    <%--<h5>Your cart currently contains <span style="color: #ff0000"><c:out value="${shoppingCart.getItemCount()}" /></span> items.</h5>--%>
    <h5>Your cart currently contains <span style="color: #ff0000">${shoppingCart.itemCount}</span> items.</h5>

    <a href="${pageContext.request.contextPath}/checkout">Checkout</a>
    <div class="panel panel-default" style="width: 600px;">
        <div class="panel-body">
            <div style="padding: 50px; border: 1px solid #ff0000">
                <h2>Our Products</h2>
                <table>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td>${product.description}</td>
                            <td class="numeric">${product.unitPrice}</td>
                            <td>
                                <form:form method="get" action="addToCart">
                                    <div style="float: left; padding-right: 15px;">
                                        <input type="number" size="5" name="addQty" value="1" class="form-control" style="height: 30px; width: 90px" >
                                        <input type="hidden" name="productId" value="${product.productId}">
                                    </div>
                                    <div style="float: right">
                                        <input type="submit" class="btn btn-primary" value="add to cart">
                                    </div>
                                    <div class="clearfix"></div>
                                </form:form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</body>
</html>