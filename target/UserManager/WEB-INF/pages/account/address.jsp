<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Registration</title>
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://getbootstrap.com/dist/css/bootstrap-responsive.min.css" rel="stylesheet">
</head>
<body>
<div class="page-header">
    <h1>Register User Account</h1>
</div>
<sec:authorize access="isAnonymous()">
    <div class="container">
        <div class="panel panel-default" style="width: 600px;">
            <div class="panel-body">
                <form:form action="address" commandName="address" method="POST" enctype="utf8" role="form">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
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
                    <button type="submit" class="btn btn-default"><spring:message code="label.user.registration.submit.button"/></button>
                </form:form>
            </div>
        </div>
    </div>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <p><spring:message code="text.registration.page.authenticated.user.help"/></p>
</sec:authorize>
</body>
</html>
