<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    int nextStudentId = 1;

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {

        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/HostelDB",
            "root",
            "root"
        );

        String sql =
            "SELECT IFNULL(MAX(student_id),0) + 1 AS next_id FROM students";

        ps = con.prepareStatement(sql);

        rs = ps.executeQuery();

        if(rs.next()) {

            nextStudentId = rs.getInt("next_id");

        }

    } catch(Exception e) {

        e.printStackTrace();

    } finally {

        try {

            if(rs != null) rs.close();

            if(ps != null) ps.close();

            if(con != null) con.close();

        } catch(Exception e) {

            e.printStackTrace();

        }

    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Add Student | HMS</title>

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

        .student-id-box{
            background:#f8f9fa;
            font-weight:bold;
            color:#0d6efd;
            font-size:18px;
        }

    </style>

</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-dark px-4 py-3">

    <a class="navbar-brand fw-bold" href="index.jsp">

        <i class="bi bi-building me-2"></i>HMS

    </a>

    <span class="text-white">

        Add Student

    </span>

</nav>

<!-- Main Container -->
<div class="container mt-5" style="max-width:600px">

    <div class="card p-4">

        <h4 class="mb-4 fw-bold text-primary">

            <i class="bi bi-person-plus-fill me-2"></i>

            Add New Student

        </h4>

        <%
            String error = (String)request.getAttribute("error");
            String success = (String)request.getAttribute("success");

            if(error != null){
        %>

        <div class="alert alert-danger alert-dismissible fade show">

            <%= error %>

            <button type="button"
                    class="btn-close"
                    data-bs-dismiss="alert"></button>

        </div>

        <%
            }

            if(success != null){
        %>

        <div class="alert alert-success alert-dismissible fade show">

            <%= success %>

            <button type="button"
                    class="btn-close"
                    data-bs-dismiss="alert"></button>

        </div>

        <%
            }
        %>

        <!-- Form -->
        <form action="AddStudentServlet"
              method="post"
              novalidate
              id="addForm">

            <!-- Student ID -->
            <div class="mb-3">

                <label class="form-label fw-semibold">

                    Student ID

                </label>

                <input type="text"
                       class="form-control student-id-box"
                       value="<%= nextStudentId %>"
                       readonly>

            </div>

            <!-- Student Name -->
            <div class="mb-3">

                <label class="form-label fw-semibold">

                    Student Name
                    <span class="text-danger">*</span>

                </label>

                <input type="text"
                       name="studentName"
                       class="form-control"
                       placeholder="Enter full name"
                       required
                       maxlength="100">

                <div class="invalid-feedback">

                    Please enter student name.

                </div>

            </div>

            <!-- Room Number -->
            <div class="mb-3">

                <label class="form-label fw-semibold">

                    Room Number
                    <span class="text-danger">*</span>

                </label>

                <input type="text"
                       name="roomNumber"
                       class="form-control"
                       placeholder="e.g. 101"
                       required
                       maxlength="20">

                <div class="invalid-feedback">

                    Room number is required.

                </div>

            </div>

            <!-- Admission Date -->
            <div class="mb-3">

                <label class="form-label fw-semibold">

                    Admission Date
                    <span class="text-danger">*</span>

                </label>

                <input type="date"
                       name="admissionDate"
                       class="form-control"
                       required>

                <div class="invalid-feedback">

                    Please select admission date.

                </div>

            </div>

            <!-- Fees Paid -->
            <div class="mb-3">

                <label class="form-label fw-semibold">

                    Fees Paid (₹)

                </label>

                <input type="number"
                       name="feesPaid"
                       class="form-control"
                       placeholder="Enter fees paid"
                       min="0"
                       step="0.01">

            </div>

            <!-- Pending Fees -->
            <div class="mb-4">

                <label class="form-label fw-semibold">

                    Pending Fees (₹)

                </label>

                <input type="number"
                       name="pendingFees"
                       class="form-control"
                       placeholder="Enter pending fees"
                       min="0"
                       step="0.01">

            </div>

            <!-- Buttons -->
            <div class="d-flex gap-2">

                <button type="submit"
                        class="btn btn-primary px-4">

                    Add Student

                </button>

                <a href="index.jsp"
                   class="btn btn-outline-secondary px-4">

                    Cancel

                </a>

            </div>

        </form>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>

    // Bootstrap Validation
    document.getElementById('addForm').addEventListener('submit', function(e) {

        if (!this.checkValidity()) {

            e.preventDefault();
            e.stopPropagation();

        }

        this.classList.add('was-validated');

    });

    // Remove Leading Zeros
    document.querySelectorAll('input[type="number"]').forEach(function(input){

        input.addEventListener('input', function(){

            if(this.value.startsWith('0') &&
               this.value.length > 1 &&
               !this.value.startsWith('0.')){

                this.value = this.value.replace(/^0+/, '');

            }

        });

    });

</script>

</body>

</html>