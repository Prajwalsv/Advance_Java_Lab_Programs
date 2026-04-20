<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>student result form</title>
<script>
function validateForm() {
    let roll = document.forms["form"]["rollno"].value;
    let name = document.forms["form"]["name"].value;
    let s1 = document.forms["form"]["sub1"].value;
    let s2 = document.forms["form"]["sub2"].value;
    let s3 = document.forms["form"]["sub3"].value;
    let s4 = document.forms["form"]["sub4"].value;
    let s5 = document.forms["form"]["sub5"].value;

    if (roll=="" || name=="" || s1=="" || s2=="" || s3=="" || s4=="" || s5=="") {
        alert("All fields are required");
        return false;
    }

    let marks = [s1,s2,s3,s4,s5];
    for (let m of marks) {
        if (isNaN(m) || m < 0 || m > 100) {
            alert("Marks must be between 0 and 100");
            return false;
        }
    }
    return true;
}
</script>
</head>
<body>
<h2>Student Result Form</h2>

<form name="form" action="ResultServlet" method="post" onsubmit="return validateForm()">

Roll No: <input type="text" name="rollno"><br><br>
Name: <input type="text" name="name"><br><br>

Sub1: <input type="text" name="sub1"><br><br>
Sub2: <input type="text" name="sub2"><br><br>
Sub3: <input type="text" name="sub3"><br><br>
Sub4: <input type="text" name="sub4"><br><br>
Sub5: <input type="text" name="sub5"><br><br>

<input type="submit" value="Calculate Result">

</form>
</body>
</html>