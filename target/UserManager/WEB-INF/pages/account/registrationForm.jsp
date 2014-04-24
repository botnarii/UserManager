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
    <script src="js/jquery.min.js"/>
    <style>
        .error-box {
            height: 40px;
            color: #A30E0E;
            background-color: #FDC0C0;
        }
    </style>
    <script>
        var passwordField = $("#txtNewPassword");
        var confirmPasswordField = $("#txtConfirmPassword");
        var passwordValue = passwordField.val();
        var confirmPasswordValue = confirmPasswordField.val();
        function validatePassword() {
            if(passwordValue !== confirmPasswordValue) {
                window.location="<c:url value='/register'/>";
            }
        }
    </script>
</head>
<body>
<div class="page-header">
    <h1>Register User Account</h1>
</div>
<sec:authorize access="isAnonymous()">
    <div class="container">
        <div style="margin: 0 auto;">
            <form:form action="register" commandName="registrationForm" method="POST" enctype="utf8" role="form">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="hidden" name="enabled" value=1 />

                <div class="row form-group">
                    <div id="form-group-username" class="form-group col-lg-4">
                        <label class="control-label" for="username"><spring:message code="label.user.username"/>:</label>
                        <form:input id="username" path="username" placeholder="Username" cssClass="form-control"/>
                        <form:errors id="error-email" path="username" cssClass="help-block error-box"/>
                    </div>
                    <div id="form-group-email" class="form-group col-lg-4">
                        <label class="control-label" for="user-email"><spring:message code="label.user.email"/>:</label>
                        <form:input id="user-email" path="email" placeholder="valid email" cssClass="form-control"/>
                        <form:errors id="error-email" path="email" cssClass="help-block error-box"/>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div id="form-group-firstName" class="form-group col-lg-4">
                            <label class="control-label" for="user-firstName"><spring:message code="label.user.firstName"/>:</label>
                            <form:input id="user-firstName" path="firstName" placeholder="your name" cssClass="form-control"/>
                            <form:errors id="error-firstName" path="firstName" cssClass="help-block error-box"/>
                        </div>
                        <div id="form-group-lastName" class="form-group col-lg-4">
                            <label class="control-label" for="user-lastName"><spring:message code="label.user.lastName"/>:</label>
                            <form:input id="user-lastName" path="lastName" placeholder="your family name" cssClass="form-control"/>
                            <form:errors id="error-lastName" path="lastName" cssClass="help-block error-box"/>
                        </div>
                    </div>
                </div>
                <div class="row form-group">
                    <div id="form-group-password" class="form-group col-lg-4">
                        <label class="control-label" for="txtNewPassword"><spring:message code="label.user.password"/>:</label>
                        <form:password id="txtNewPassword" path="password" placeholder="between 5 to 9 chars" cssClass="form-control"/>
                        <form:errors id="error-password" path="password" cssClass="help-block error-box"/>
                    </div>
                    <div id="form-group-passwordVerification" class="form-group col-lg-4">
                        <label class="control-label" for="txtConfirmPassword"><spring:message code="label.user.passwordVerification"/>:</label>
                        <form:password id="txtConfirmPassword" path="confirmPassword" placeholder="retype password" cssClass="form-control"/>
                        <form:errors id="error-password" path="confirmPassword" cssClass="help-block error-box"/>
                    </div>
                </div>
                <button id="registerBtn" type="submit" name="_eventId_submit" class="btn btn-default" ><spring:message code="label.user.registration.submit.button"/></button>
                <%--<button type="button" onclick="window.location='${flowExecutionUrl}&_eventId=cancelRegistration'" class="btn btn-default"><spring:message code="label.user.registration.cancel.button"/></button>--%>
            </form:form>
        </div>
    </div>
    <script>
        $(function(){
            $("#txtConfirmPassword").on('keyup',function(){
                var passwordField = $("#txtNewPassword");
                var confirmPasswordField = $("#txtConfirmPassword");
//                var submitButton = $("#registerBtn");

                var passwordValue = passwordField.val();
                var confirmPasswordValue = confirmPasswordField.val();

                if (passwordValue != confirmPasswordValue){
//                    $("#registerBtn").addClass("disabled");
                    $(confirmPasswordField).css("background-color", "#E77979"); //roz
                    $(passwordField).css("background-color", "#E77979"); //roz
                }
                if (passwordValue == confirmPasswordValue) {
                    $(confirmPasswordField).css("background-color", "#79E570"); //verde
                    $(passwordField).css("background-color", "#79E570"); //verde
//                    $("#registerBtn").removeClass("disabled");
                }
            });
        });
    </script>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <p><spring:message code="text.registration.page.authenticated.user.help"/></p>
</sec:authorize>
</body>
</html>