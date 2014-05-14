<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="row">
    <div class="col-lg-12">
        <div style="border-bottom: 1px solid black; width: 80%;">
            <h1 style="padding-left: 25%">${productPage.name}</h1>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-6">
        <div class="row">
            <img src="<c:url value='/download/${productPage.productId}'/> ">
        </div>
        <div class="row">
            <div class="container-fluid">
                <div class="row"><h3>${productPage.name}</h3></div>
                <div class="row">
                    <div class="well well-lg" style="margin-right: 10px;">
                        <p></p>
                        <p>
                            ${productPage.description}
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="row">
            <div class="list-group">
                <div class="list-group-item">
                    <div class="list-group-item-heading">
                        <h1>price: <span style="color: green">CAD ${productPage.unitPrice}</span></h1>
                    </div>
                    <p style="color: red">599,99 $ + 1,65 $ eco-fees</p>
                    <div style="background: #ffff00; width: 120px; height: 30px; padding: 5px; font-weight: bold;">
                        <p>SAVE 10% NOW</p>
                    </div>
                    <p>Sale ends: April 24, 2018</p>
                </div>
                <div class="list-group-item">
                    <div class="list-group-item-heading">
                        <h3>Special offers</h3>
                    </div>
                    <ul>
                        <li>Get Microsoft Office 365 Home Premium for $79.99 with any PC purchase (SAVE $20).</li>
                        <li>Save $50 on this Canon printer with purchase of a laptop, desktop or tablet!</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2 class="panel-title">Disponibility</h2>
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <div class="list-group-item">
                            <div class="list-group-item-heading">
                                <h3>Online</h3>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <ul class="list-unstyled">
                                        <li style="color: green; font-weight: bold">In stock</li>
                                        <li>Limited quantity available</li>
                                        <li>Only 1 per customer</li>
                                    </ul>
                                </div>
                                <div class="col-lg-6">
                                    <div style="margin: 5px;">
                                        <form:form id="cartForm" method="get" action="addToCart">
                                            <div class="pull-left" style="padding-right: 15px;">
                                                <input type="number" id="qty" name="addQty" value="1" class="form-control" style="height: 30px; width: 90px" >
                                                <input type="hidden" name="_eventId" value="addToCart">
                                                <input type="hidden" name="productId" value="${productPage.productId}">
                                            </div>
                                            <div>
                                                <input type="submit" class="btn btn-primary" value="add to cart">
                                            </div>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item">
                            <div class="list-group-item-heading">
                                <h3>In store</h3>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <ul class="list-unstyled">
                                        <li style="color: red; font-weight: bold"> London</li>
                                        <li style="color: red; font-weight: bold"> Paris</li>
                                        <li style="color: red; font-weight: bold"> Washington</li>
                                    </ul>
                                </div>
                                <div class="col-lg-6">
                                    <div style="margin: 5px;">
                                        <button class="btn btn-default"> Reservation in stores</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

