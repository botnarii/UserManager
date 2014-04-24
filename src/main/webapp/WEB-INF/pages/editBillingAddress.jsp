<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="addressBox">
    <div class="slidingDiv" >
        <h4>Billing Address Form</h4>
        <form:form commandName="address1" method="POST" enctype="utf8" role="form">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="addressType" value="billing">
            <div class="row form-group">
                <div id="form-group-Country" class="form-group col-lg-4">
                    <label class="control-label" for="country"><spring:message code="label.user.address.country"/>:</label>
                    <form:select id="country" path="country" cssClass="form-control" >
                        <form:option value="Canada"/>
                        <form:option value="Mexico"/>
                        <form:option value="USA"/>
                        <form:option value="Europe"/>
                    </form:select>
                    <form:errors id="error-lastName" path="country" cssClass="help-block"/>
                </div>
            </div>
            <div class="row form-group">
                <div id="form-group-State" class="form-group col-lg-4">
                    <label class="control-label" for="state"><spring:message code="label.user.address.state"/>:</label>
                    <form:select id="state" path="state" cssClass="form-control">
                        <form:option value="Alberta"/>
                        <form:option value="British Columbia"/>
                        <form:option value="Ontario"/>
                        <form:option value="Quebec"/>
                    </form:select>
                    <form:errors id="error-lastName" path="state" cssClass="help-block"/>
                </div>
            </div>
            <div class="row form-group">
                <div id="form-group-City" class="form-group col-lg-4">
                    <label class="control-label" for="city"><spring:message code="label.user.address.city"/>:</label>
                    <form:input id="city" path="city" cssClass="form-control"/>
                    <form:errors id="error-lastName" path="city" cssClass="help-block"/>
                </div>
            </div>
            <div class="row form-group">
                <div id="form-group-Street" class="form-group col-lg-4">
                    <label class="control-label" for="street"><spring:message code="label.user.address.street"/>:</label>
                    <form:input id="street" path="street" cssClass="form-control"/>
                    <form:errors id="error-lastName" path="street" cssClass="help-block"/>
                </div>
            </div>
            <div class="row form-group">
                <div id="form-group-ZipCode" class="form-group col-lg-4">
                    <label class="control-label" for="zipcode"><spring:message code="label.user.address.zipcode"/>:</label>
                    <form:input id="zipcode" path="zipCode" cssClass="form-control"/>
                    <form:errors id="error-lastName" path="zipCode" cssClass="help-block"/>
                </div>
            </div>
            <%--<input type="hidden" name="_eventId" value="editAddress">--%>
            <button type="submit" name="_eventId_edit" value="edit" class="btn btn-default"><spring:message code="label.user.registration.submit.button"/></button>
        </form:form>
    </div>
</div>
