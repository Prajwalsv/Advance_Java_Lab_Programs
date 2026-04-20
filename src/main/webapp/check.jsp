	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
    String user = (String) session.getAttribute("user");

    if (user != null) {
%>

<h2>Hello again <%= user %>!</h2>
<p>Session is still active.</p>

<%
    } else {
%>

<h2>Session expired! Please go back and enter details again.</h2>

<%
    }
%>
</body>
</html>