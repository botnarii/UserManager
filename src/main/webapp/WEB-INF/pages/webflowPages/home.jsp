<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="row">
    <div class="col-lg-12">
        <div class="pull-right">
            <sec:authorize ifAnyGranted="ROLE_ADMIN">
                <a href="<c:url value="/productManagement"/>">[add new products]</a>
            </sec:authorize>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="panel panel-default" style="border: none">
            <h2 id="product-header">Our Products</h2>
            <div class="panel-body">
                <div class="row">
                    <div class="listing-control-wrapper clearfix">
                        <div class="col-lg-4">
                            <div class="pull-left">1 - ${fn:length(products)} out of ${fn:length(products)}</div>
                        </div>
                        <div class="col-lg-4">
                            <div class="clearfix" style="width: 75px;">
                                <a href="#" class="pull-left">prec</a>
                                <span style="margin-left: 25%;">1</span>
                                <a href="#" class="pull-right">next</a>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <ul class="pull-right list-unstyled" style="width: 120px;">
                                <li>
                                    <a href="javascript:void(0)">
                                        <span class="pull-left" style="width: 32px; height: 32px; margin-right: 10px; background-image: url('<c:url value="/images/template/preview_list.png"/> ')"></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)">
                                        <span class="pull-left" style="width: 32px; height: 32px; background-image: url('<c:url value="/images/template/2x2_grid.png"/> ')"></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="productList row">
                    <div class="container-fluid">
                        <ul id="item-products" class="list-unstyled clearfix" style="max-width: 940px;">
                            <c:forEach var="product" items="${products}">
                                <li class="pull-left grid-view group-member" style="margin-top: 20px;">
                                    <div class="product product-item">
                                        <div class="img-panel">
                                            <a href="<c:url value="/page?productId=${product.productId}"/>">
                                                <div class="product_img">
                                                    <img src="<c:url value='/download/${product.productId}'/>" width="240px" height="240px">
                                                </div>
                                            </a>
                                        </div>
                                        <div class="product-panel">
                                            <div class="product-price">
                                                <ul class="list-inline list-unstyled">
                                                    <li><div style="width: 15px; height: 20px; background-image: url('<c:url value="/images/template/dollar-icon.png"/> ')"></div></li>
                                                    <li><h1>${product.unitPrice}</h1></li>
                                                </ul>
                                            </div>
                                            <div class="product-descr">
                                                <strong>${product.name}</strong>
                                            </div>
                                            <div class="pull-right buy-form" style="margin-right: 10%; position: absolute; bottom: 10px;">
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
                            <script type="text/javascript">
                                var a = $('#item-products').find('li.group-member');
                                do $(a.slice(0,3)).wrapAll('<li class="listing-row clearfix"><ul class="clearfix">');
                                while((a = a.slice(3)).length>0)
                            </script>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>