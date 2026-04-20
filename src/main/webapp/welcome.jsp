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
    String name = request.getParameter("uname");
    String timeStr = request.getParameter("time");

    if (name != null && timeStr != null) {

        int time = Integer.parseInt(timeStr);

        // Store in session
        session.setAttribute("user", name);

        // Set expiry time (user-defined)
        session.setMaxInactiveInterval(time);
    }

    String user = (String) session.getAttribute("user");

    if (user != null) {
%>

<h2>Hello <%= user %>!</h2>
<p>Session will expire in <%= session.getMaxInactiveInterval() %> seconds.</p>

<a href="check.jsp">Click here to check session</a>

<%
    } else {
%>

<h2>Session expired! Please enter again.</h2>

<%
    }
%>
</body>
</html>