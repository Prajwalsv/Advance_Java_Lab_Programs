<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session Check</title>
</head>
<body>

<%
    String user = (String) session.getAttribute("user");

    if (user == null) {
%>
        <h2>Session expired!</h2>
        <a href="index.jsp">Go Back</a>
<%
    } else {
%>
        <h2>Welcome back <%= user %>!</h2>
        <p>Session is still active.</p>
<%
    }
%>
</body>
</html>