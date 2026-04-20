<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Session Demo with Custom Expiry</h2>

<form action="welcome.jsp" method="post">
    Enter Name:
    <input type="text" name="uname" required><br><br>

    Session Expiry Time (in seconds):
    <input type="text" name="time" required><br><br>

    <input type="submit" value="Submit">
</form>
</body>
</html>