<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<div class="row">
    <div class="col-lg-12">
        <div class="pull-right">
            <sec:authorize ifAnyGranted="ROLE_ADMIN">
                <a href="<c:url value="/addProduct"/>">[add new products]</a>
            </sec:authorize>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2 class="panel-title product-header">Our Products</h2>
            </div>
            <div class="panel-body">
                <div class="productList row">
                    <ul>
                        <c:forEach var="product" items="${products}">
                            <li class="pull-left" style="width: 260px; list-style: none">
                                <div class="product" style="width: 245px">
                                    <a href="<c:url value="/page?productId=${product.productId}"/>">
                                        <div class="product_img">
                                            <img src="<c:url value='/download/${product.productId}'/>" width="240px" height="240px">
                                        </div>
                                    </a>
                                    <div class="product_label">
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
                                            <form:form id="cartForm" method="get" action="addToCart">
                                                <div class="pull-left" style="padding-right: 15px;">
                                                    <input type="number" id="qty" name="addQty" value="1" class="form-control" style="height: 30px; width: 90px" >
                                                    <input type="hidden" name="_eventId" value="addToCart">
                                                    <input type="hidden" name="productId" value="${product.productId}">
                                                </div>
                                                <div class="pull-right">
                                                    <input type="submit" class="btn btn-primary" value="add to cart">
                                                </div>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>