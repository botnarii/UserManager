<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logout</title>
</head>
<body>
<% session.invalidate(); %>
You are now logged out!!

<a href="${pageContext.request.contextPath}/login">go back</a>
</body>
</html>
