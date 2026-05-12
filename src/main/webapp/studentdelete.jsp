<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Student"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Delete Student | HMS</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>

        body{
            background:#f0f4f8;
        }

        .navbar{
            background:linear-gradient(135deg,#1a237e,#283593);
        }

        .card{
            border:none;
            border-radius:16px;
            box-shadow:0 4px 20px rgba(0,0,0,.1);
        }

        .info-row{
            display:flex;
            justify-content:space-between;
            padding:10px 0;
            border-bottom:1px solid #eee;
        }

    </style>

</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-dark px-4 py-3">

    <a class="navbar-brand fw-bold" href="index.jsp">

        <i class="bi bi-building me-2"></i>

        HMS

    </a>

    <span class="text-white">

        Delete Student

    </span>

</nav>

<!-- Main Container -->
<div class="container mt-5" style="max-width:600px">

    <!-- Search Card -->
    <div class="card p-4 mb-4">

        <h5 class="fw-bold text-danger mb-3">

            <i class="bi bi-search me-2"></i>

            Search Student by ID

        </h5>

        <form action="DeleteStudentServlet"
              method="get"
              class="d-flex gap-2">

            <input type="number"
                   name="id"
                   class="form-control"
                   placeholder="Enter Student ID"
                   required
                   min="1">

            <button type="submit"
                    class="btn btn-danger px-4">

                Search

            </button>

        </form>

    </div>

    <!-- Messages -->
    <%
        String error =
                (String)request.getAttribute("error");

        String success =
                (String)request.getAttribute("success");

        if(error != null){
    %>

    <div class="alert alert-danger">

        <%= error %>

    </div>

    <%
        }

        if(success != null){
    %>

    <div class="alert alert-success">

        <%= success %>

    </div>

    <%
        }
    %>

    <!-- Student Details -->
    <%
        Student s =
                (Student)request.getAttribute("student");

        if(s != null){
    %>

    <div class="card p-4">

        <h5 class="fw-bold text-danger mb-3">

            <i class="bi bi-exclamation-triangle-fill me-2"></i>

            Confirm Deletion

        </h5>

        <div class="info-row">

            <span class="text-muted">

                Student ID

            </span>

            <strong>

                <%= s.getStudentID() %>

            </strong>

        </div>

        <div class="info-row">

            <span class="text-muted">

                Name

            </span>

            <strong>

                <%= s.getStudentName() %>

            </strong>

        </div>

        <div class="info-row">

            <span class="text-muted">

                Room No.

            </span>

            <strong>

                <%= s.getRoomNumber() %>

            </strong>

        </div>

        <div class="info-row">

            <span class="text-muted">

                Admission Date

            </span>

            <strong>

                <%= s.getAdmissionDate() %>

            </strong>

        </div>

        <div class="info-row">

            <span class="text-muted">

                Fees Paid

            </span>

            <strong>

                ₹<%= s.getFeesPaid() %>

            </strong>

        </div>

        <div class="info-row">

            <span class="text-muted">

                Pending Fees

            </span>

            <strong class="<%= s.getPendingFees() > 0 ? "text-danger" : "text-success" %>">

                ₹<%= s.getPendingFees() %>

            </strong>

        </div>

        <!-- Warning -->
        <div class="alert alert-warning mt-3 mb-3">

            <i class="bi bi-exclamation-circle me-1"></i>

            This action cannot be undone.

        </div>

        <!-- Delete Form -->
        <form action="DeleteStudentServlet"
              method="post"
              class="d-flex gap-2">

            <input type="hidden"
                   name="studentID"
                   value="<%= s.getStudentID() %>">

            <button type="submit"
                    class="btn btn-danger px-4"
                    onclick="return confirm('Are you sure you want to delete this student?');">

                Yes, Delete

            </button>

            <a href="index.jsp"
               class="btn btn-outline-secondary px-4">

                Cancel

            </a>

        </form>

    </div>

    <%
        }
    %>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>