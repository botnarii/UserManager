<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="row">
    <div class="panel panel-default">
        <div class="panel-body">
           <div class="col-lg-12">
               <div class="row">
                   <div class="col-lg-6"></div>
                   <div class="col-lg-6">
                       <div class="pull-left" >
                           <h4>Payment Details</h4>
                       </div>
                   </div>
               </div>
               <div class="row">
                   <div class="col-lg-12" style="border: 1px solid #000000;">
                       <sec:authorize ifAnyGranted="ROLE_USER">
                           <%--@elvariable id="shoppingCart" type="com.springapp.mvc.model.ShoppingCart"--%>
                           <c:choose>
                               <c:when test="${empty shoppingCart.items}">
                                   <p>Your cart is empty.</p>
                               </c:when>
                               <c:otherwise>
                                   <div class="row">
                                       <div class="col-lg-7 col-sm-12 col-xs-12 pull-right">
                                           <div class="list-group">
                                               <h4>Your Cart - ${shoppingCart.itemCount} items <span class="pull-right"><a href="${flowExecutionUrl}&_eventId=cancelCheckout">[cancel]</a></span></h4>
                                               <c:forEach var="item" items="${shoppingCart.items}">
                                                   <div class="list-group-item">
                                                       <h5 class="list-group-item-heading">${item.product.name} <span class="pull-right"><a class="deleteUrl" href="<c:url value='/delete-from-cart?productId=${item.product.productId}'/>">[delete]</a></span></h5>
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
                                                           <div class="pull-right" style="font-weight: bold; padding-right: 10px;">
                                                               Total: <span class="total-price">${shoppingCart.totalPriceInDollars}</span>
                                                           </div>
                                                       </div>
                                                   </div>
                                               </div>
                                           </div>
                                       </div>
                                       <div id="billingAddressForm" class="col-lg-5 col-sm-12 col-xs-12 pull-left" style="padding-top: 35px">
                                           <div class="creditInfo">
                                               <form:form>
                                                   <div class="form-group">
                                                       <div id="form-group-CardType" class="form-group col-lg-4 col-xs-4">
                                                           <label class="control-label" for="card-type">Credit Card Type:</label>
                                                           <select id="card-type" class="form-control">
                                                               <option>Visa</option>
                                                               <option>MasterCard</option>
                                                               <option>Discover</option>
                                                               <option>American Express</option>
                                                           </select>
                                                       </div>
                                                       <div class="row">
                                                           <div id="form-group-CardNumber" class="form-group col-lg-4 col-xs-4">
                                                               <label class="control-label" for="ccNumber">Credit Card Number:</label>
                                                               <input type="number" id="ccNumber" name="ccNumber"/>
                                                           </div>
                                                           <div id="form-group-ExpirationDate" class="form-group col-lg-4 col-xs-4">
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
                                   </div>
                               </c:otherwise>
                           </c:choose>
                       </sec:authorize>
                   </div>
               </div>
           </div>
        </div>
    </div>
</div>
