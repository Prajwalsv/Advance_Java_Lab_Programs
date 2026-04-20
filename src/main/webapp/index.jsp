<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session Demo</title>
</head>
<body>
<%
    String name = request.getParameter("username");

    // Create session and store name
    session.setAttribute("user", name);

    // Set session expiry = 1 minute
    session.setMaxInactiveInterval(60);
%>

<h2>Hello <%= name %>!</h2>
<p>Session expires in 1 minute.</p>

<a href="check.jsp">Check Session Status</a>
</body>
</html>