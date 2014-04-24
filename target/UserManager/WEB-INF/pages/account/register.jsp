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
                <%--<form:form action="register" commandName="customer" method="POST" enctype="utf8" role="form">--%>
                <form:form commandName="customer" method="POST" enctype="utf8" role="form">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="enabled" value=1 />
                    <div class="row form-group">
                        <div id="form-group-firstName" class="form-group col-lg-4">
                            <label class="control-label" for="user-firstName"><spring:message code="label.user.firstName"/>:</label>
                            <form:input id="user-firstName" path="firstName" cssClass="form-control"/>
                            <form:errors id="error-firstName" path="firstName" cssClass="help-block"/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div id="form-group-lastName" class="form-group col-lg-4">
                            <label class="control-label" for="user-lastName"><spring:message code="label.user.lastName"/>:</label>
                            <form:input id="user-lastName" path="lastName" cssClass="form-control"/>
                            <form:errors id="error-lastName" path="lastName" cssClass="help-block"/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div id="form-group-email" class="form-group col-lg-4">
                            <label class="control-label" for="user-email"><spring:message code="label.user.email"/>:</label>
                            <form:input id="user-email" path="email" cssClass="form-control"/>
                            <form:errors id="error-email" path="email" cssClass="help-block"/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div id="form-group-username" class="form-group col-lg-4">
                            <label class="control-label" for="user-email"><spring:message code="label.user.username"/>:</label>
                            <form:input id="user-email" path="username" cssClass="form-control"/>
                            <form:errors id="error-email" path="username" cssClass="help-block"/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div id="form-group-password" class="form-group col-lg-4">
                            <label class="control-label" for="user-password"><spring:message code="label.user.password"/>:</label>
                            <form:password id="user-password" path="password" cssClass="form-control"/>
                            <form:errors id="error-password" path="password" cssClass="help-block"/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div id="form-group-passwordVerification" class="form-group col-lg-4">
                            <label class="control-label" for="user-passwordVerification"><spring:message code="label.user.passwordVerification"/>:</label>
                            <input type="password" id="user-passwordVerification" class="form-control"/>
                                <%--<form:errors id="error-passwordVerification" path="passwordVerification" cssClass="help-block"/>--%>
                        </div>
                    </div>
                    <%--<button type="submit" class="btn btn-default"><spring:message code="label.user.registration.submit.button"/></button>--%>
                    <input type="hidden" class="btn btn-default" name="_flowExecutionUrl" value="${flowExecutionUrl}">
                    <input type="hidden" name="_eventId" value="submitRegistration"/>
                    <input type="submit" class="btn btn-default" value="Register">
                    <button type="button" onclick="window.location='${flowExecutionUrl}&_eventId=cancelRegistration'" class="btn btn-default"><spring:message code="label.user.registration.cancel.button"/></button>
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