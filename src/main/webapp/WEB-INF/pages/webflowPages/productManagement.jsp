<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>

<sec:authorize ifAnyGranted="ROLE_ADMIN">
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2 class="panel-title product-header">Add</h2>
            </div>
            <div class="panel-body">
                <div id="result">
                    <span style="color: red"><c:out value="${param.imgError}"/></span>
                    <span style="color: green; font-weight: bold"><c:out value="${param.imgSuccess}"/></span>
                </div>
                <form:form commandName="productForm" id="imgUpload" method="post" action="upload" enctype="multipart/form-data">
                    <div class="row form-group">
                        <div class="container-fluid">
                            <div class="row">
                                <div id="form-group-prodname" class="form-group col-lg-3">
                                    <label class="control-label" for="name">Product name:</label>
                                    <form:input name="name" id="name" placeholder="Product name"  path="name" cssClass="form-control"/>
                                    <form:errors path="name" cssClass="help-block error-box"/>
                                </div>
                                <div id="form-group-prodprice" class="form-group col-lg-3">
                                    <label class="control-label" for="unitPrice">Product unit price:</label>
                                    <form:input name="unitPrice" id="unitPrice" placeholder="Product unit price"  path="unitPrice" cssClass="form-control"/>
                                    <form:errors id="error-email" path="unitPrice" cssClass="help-block error-box"/>
                                </div>
                                <div id="form-group-prodinstock" class="form-group col-lg-3">
                                    <label class="control-label" for="inStockQty">Products in stock:</label>
                                    <form:input name="inStockQty" id="inStockQty" placeholder="Products in stock"  path="inStockQty" cssClass="form-control"/>
                                    <form:errors id="error-email" path="inStockQty" cssClass="help-block error-box"/>
                                </div>
                                <div id="form-group-prodbrand" class="form-group col-lg-3">
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
                                <div id="form-group-prodoffer" class="form-group col-lg-3">
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
                                <div id="form-group-proddisplay" class="form-group col-lg-3">
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
                                <div id="form-group-proddescr" class="form-group col-lg-3">
                                    <label class="control-label" for="descr">Description:</label>
                                    <form:textarea name="descr" id="descr" placeholder="Description"  path="description" cssClass="form-control"/>
                                    <form:errors id="error-email" path="description" cssClass="help-block error-box"/>
                                </div>
                                <div id="form-group-prodimg" class="form-group col-lg-3">
                                    <form:label path="image">Product Image</form:label>
                                    <input name="imgfile" id="imgfile" type="file"/>
                                    <form:errors id="error-email" path="image" cssClass="help-block error-box"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4"></div>
                                <div class="col-lg-4"><input type="submit" value="Upload" class="btn btn-default"/></div>
                                <div class="col-lg-4"></div>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2 class="panel-title product-header">Edit/Delete</h2>
            </div>
            <div class="panel-body">
                <form:form commandName="productForm" id="searchProduct" method="post" action="search-product" enctype="multipart/form-data">
                    <div class="row form-group">
                        <div class="container-fluid">
                            <div class="row">
                                <div id="form-group-prodname-del" class="form-group col-lg-3">
                                    <label class="control-label" for="name">Product name:</label>
                                    <form:input name="name" id="name" placeholder="Product name"  path="name" cssClass="form-control"/>
                                    <form:errors path="name" cssClass="help-block error-box"/>
                                </div>
                                <div id="form-group-prodprice-del" class="form-group col-lg-3">
                                    <label class="control-label" for="unitPrice">Product unit price:</label>
                                    <form:input name="unitPrice" id="unitPrice" placeholder="Product unit price"  path="unitPrice" cssClass="form-control"/>
                                    <form:errors id="error-email" path="unitPrice" cssClass="help-block error-box"/>
                                </div>
                                <div id="form-group-prodinstock-del" class="form-group col-lg-3">
                                    <label class="control-label" for="inStockQty">Products in stock:</label>
                                    <form:input name="inStockQty" id="inStockQty" placeholder="Products in stock"  path="inStockQty" cssClass="form-control"/>
                                    <form:errors id="error-email" path="inStockQty" cssClass="help-block error-box"/>
                                </div>
                                <div id="form-group-prodbrand-del" class="form-group col-lg-3">
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
                                <div id="form-group-prodoffer-del" class="form-group col-lg-3">
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
                                <div id="form-group-proddisplay-del" class="form-group col-lg-3">
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
                                <div class="col-lg-4"></div>
                                <div class="col-lg-4"><input type="submit" value="Search" class="btn btn-default"/></div>
                                <div class="col-lg-4"></div>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</sec:authorize>
