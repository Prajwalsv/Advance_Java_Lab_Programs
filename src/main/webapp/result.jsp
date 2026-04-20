<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Student Result</h2>

Roll No: <%= request.getAttribute("roll") %><br>
Name: <%= request.getAttribute("name") %><br><br>

Marks:<br>
Sub1: <%= request.getAttribute("s1") %><br>
Sub2: <%= request.getAttribute("s2") %><br>
Sub3: <%= request.getAttribute("s3") %><br>
Sub4: <%= request.getAttribute("s4") %><br>
Sub5: <%= request.getAttribute("s5") %><br><br>

Average: <%= request.getAttribute("avg") %><br>
Result: <%= request.getAttribute("result") %><br><br>

<a href="index.jsp">Go Back</a>
</body>
</html>