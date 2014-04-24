<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <div class="panel panel-default">
        <%--<sec:authorize ifNotGranted="ROLE_ADMIN">--%>
        <%--<spring:url value="/home" var="home"/>--%>
        <%--<script type="text/javascript">--%>
        <%--$(document).ready(function(){--%>
        <%--window.location.replace("${home}");--%>
        <%--})--%>
        <%--</script>--%>
        <%--</sec:authorize>--%>
        <sec:authorize ifAnyGranted="ROLE_ADMIN">
            <div class="panel-heading">
                <h2 class="panel-title product-header">Add a Product</h2>
            </div>
            <div class="panel-body">
                <!--  Form 1 -->
                    <%--<i>Uploading File Without Ajax</i><br/>--%>
                    <%--<form id="form1" method="post" action="upload" enctype="multipart/form-data">--%>

                    <%--<!-- File input -->--%>
                    <%--<input name="file" id="file" type="file" /><br/>--%>

                    <%--<input type="submit" value="Upload" />--%>
                    <%--</form>--%>
                    <%--<hr/>--%>

                <!--  Form 2 -->
                    <%--<i>Uploading File With Ajax</i><br/>--%>
                <form:form commandName="article" id="imgUpload" method="post" action="upload" enctype="multipart/form-data">
                    <div class="row form-group">
                        <div class="container-fluid">
                            <div class="row">
                                <div id="form-group-prodname" class="form-group col-lg-4">
                                    <label class="control-label" for="name">Product name:</label>
                                    <form:input name="name" id="name" placeholder="Product name"  path="name" cssClass="form-control"/>
                                    <form:errors id="error-email" path="name" cssClass="help-block error-box"/>
                                </div>
                            </div>
                            <div class="row">
                                <div id="form-group-prodprice" class="form-group col-lg-4">
                                    <label class="control-label" for="unitPrice">Product unit price:</label>
                                    <form:input name="unitPrice" id="unitPrice" placeholder="Product unit price"  path="unitPrice" cssClass="form-control"/>
                                    <form:errors id="error-email" path="unitPrice" cssClass="help-block error-box"/>
                                </div>
                            </div>
                            <div class="row">
                                <div id="form-group-prodinstock" class="form-group col-lg-4">
                                    <label class="control-label" for="inStockQty">Products in stock:</label>
                                    <form:input name="inStockQty" id="inStockQty" placeholder="Products in stock"  path="inStockQty" cssClass="form-control"/>
                                    <form:errors id="error-email" path="inStockQty" cssClass="help-block error-box"/>
                                </div>
                            </div>
                            <div class="row">
                                <div id="form-group-prodbrand" class="form-group col-lg-4">
                                    <label class="control-label" for="brand">Product brand:</label>
                                    <form:select path="brand" id="brand" name="brand" cssClass="form-control">
                                        <form:option value="Acer"/>
                                        <form:option value="Apple"/>
                                        <form:option value="Asus"/>
                                        <form:option value="Del"/>
                                        <form:option value="Lenovo"/>
                                        <form:option value="Samsung"/>
                                    </form:select>
                                    <form:errors id="error-email" path="brand" cssClass="help-block error-box"/>
                                </div>
                            </div>
                            <div class="row">
                                <div id="form-group-prodoffer" class="form-group col-lg-4">
                                    <label class="control-label" for="currentOffer">Current Offer:</label>
                                    <form:select path="currentOffer" id="currentOffer" name="currentOffer" cssClass="form-control">
                                        <form:option value="On sale"/>
                                        <form:option value="On clearance"/>
                                        <form:option value="Refurbished"/>
                                        <form:option value="In store"/>
                                        <form:option value="Web only"/>
                                    </form:select>
                                    <form:errors id="error-email" path="currentOffer" cssClass="help-block error-box"/>
                                </div>
                            </div>
                            <div class="row">
                                <div id="form-group-proddisplay" class="form-group col-lg-4">
                                    <label class="control-label" for="displaySize">Display Size:</label>
                                    <form:select path="displaySize" id="displaySize" name="displaySize" cssClass="form-control">
                                        <form:option value="13"/>
                                        <form:option value="14"/>
                                        <form:option value="15"/>
                                        <form:option value="17"/>
                                        <form:option value="19"/>
                                        <form:option value="22"/>
                                    </form:select>
                                    <form:errors id="error-email" path="displaySize" cssClass="help-block error-box"/>
                                </div>
                            </div>
                            <div class="row">
                                <div id="form-group-proddescr" class="form-group col-lg-6">
                                    <label class="control-label" for="descr">Description:</label>
                                    <form:textarea name="descr" id="descr" placeholder="Description"  path="description" cssClass="form-control"/>
                                    <form:errors id="error-email" path="description" cssClass="help-block error-box"/>
                                </div>
                            </div>
                            <div class="row">
                                <div id="form-group-prodimg" class="form-group col-lg-4">
                                    <form:label path="image">Product Image</form:label>
                                    <input name="imgfile" id="imgfile" type="file" cssClass="form-control"/>
                                    <form:errors id="error-email" path="image" cssClass="help-block error-box"/>
                                </div>
                            </div>
                            <div class="row">
                                <input type="submit" value="Upload" class="btn btn-default"/>
                            </div>
                        </div>
                    </div>
                    <%--<form:input name="name" id="name" placeholder="Product name"  path="name"/><br/>--%>
                    <%--<form:input name="unitPrice" id="unitPrice" placeholder="Product unit price"  path="unitPrice"/><br/>--%>
                    <%--<form:input name="inStockQty" id="inStockQty" placeholder="Products in stock"  path="inStockQty"/><br/>--%>
                    <%--<form:input name="brand" id="brand" placeholder="Product brand"  path="brand"/><br/>--%>
                    <%--<form:input name="currentOffer" id="currentOffer" placeholder="Current Offer"  path="currentOffer"/><br/>--%>
                    <%--<form:input name="displaySize" id="displaySize" placeholder="Display Size"  path="displaySize"/><br/>--%>
                    <%--<form:textarea name="descr" id="descr" placeholder="Product description..." rows="5" cols="50" path="description"/><br/>--%>
                    <%--<!-- File input -->--%>
                    <%--<form:label path="image">Product Image</form:label>--%>
                    <%--<input name="imgfile" id="imgfile" type="file"/><br/>--%>
                    <%--<input type="submit" value="Upload" />--%>
                </form:form>

                    <%--<button value="Submit" onclick="uploadJqueryForm()" >Upload</button><i>Using JQuery Form Plugin</i><br/>--%>
                    <%--<button value="Submit" onclick="uploadFormData()" >Upload</button><i>Using FormData Object</i>--%>

                <div id="result">
                </div>
            </div>
        </sec:authorize>
    </div>
</div>
