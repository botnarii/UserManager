<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
<head>
    <title>Login</title>

    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://getbootstrap.com/dist/css/bootstrap-responsive.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1 id="banner">Login to Security Demo</h1>
    <form name="f" action="${pageContext.request.contextPath}/j_spring_security_check" method="POST">
        <div class="row form-group">
            <div id="form-group-firstName" class="form-group col-lg-4">
                <label class="control-label" for="username"><spring:message code="label.user.username"/>:</label>
                <input type="text" name='j_username' id="username" class="form-control"/>
                <form:errors id="error-firstName" path="username" cssClass="help-block"/>
            </div>
        </div>
        <div class="row form-group">
            <div id="form-group-password" class="form-group col-lg-4">
                <label class="control-label" for="password"><spring:message code="label.user.password"/>:</label>
                <input type="password" name='j_password' id="password" class="form-control"/>
                <form:errors id="error-firstName" path="password" cssClass="help-block"/>
            </div>
        </div>
        <input type="submit" class="btn btn-default" value="<spring:message code="label.user.login.submit.button"/>">
        <button type="reset" class="btn btn-default"><spring:message code="label.user.login.reset.button"/></button>
        <button type="button" onclick="window.location='${pageContext.request.contextPath}/register'" class="btn btn-default"><spring:message code="label.user.registration.submit.button"/></button>
    </form>
</div>
</body>
</html>