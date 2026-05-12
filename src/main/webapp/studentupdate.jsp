<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Student"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="UTF-8">

  <title>Update Student | HMS</title>

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

    Update Student

  </span>

</nav>

<!-- Main Container -->
<div class="container mt-5" style="max-width:600px">

  <!-- Search Card -->
  <div class="card p-4 mb-4">

    <h5 class="fw-bold text-success mb-3">

      <i class="bi bi-search me-2"></i>

      Search Student by ID

    </h5>

    <form action="UpdateStudentServlet"
          method="get"
          class="d-flex gap-2">

      <input type="number"
             name="id"
             class="form-control"
             placeholder="Enter Student ID"
             required
             min="1">

      <button type="submit"
              class="btn btn-success px-4">

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

    <h5 class="fw-bold text-success mb-3">

      <i class="bi bi-pencil-square me-2"></i>

      Update Student Details

    </h5>

    <form action="UpdateStudentServlet"
          method="post"
          id="updateForm"
          novalidate>

      <input type="hidden"
             name="studentID"
             value="<%=s.getStudentID()%>">

      <!-- Student ID -->
      <div class="mb-3">

        <label class="form-label fw-semibold">

          Student ID

        </label>

        <input type="text"
               class="form-control bg-light"
               value="<%=s.getStudentID()%>"
               disabled>

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
               value="<%=s.getStudentName()%>"
               required
               maxlength="100">

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
               value="<%=s.getRoomNumber()%>"
               required
               maxlength="10">

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
               value="<%=s.getAdmissionDate()%>"
               required>

      </div>

      <!-- Fees Paid -->
      <div class="mb-3">

        <label class="form-label fw-semibold">

          Fees Paid (₹)

        </label>

        <input type="number"
               name="feesPaid"
               class="form-control"
               value="<%=s.getFeesPaid()%>"
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
               value="<%=s.getPendingFees()%>"
               min="0"
               step="0.01">

      </div>

      <!-- Buttons -->
      <div class="d-flex gap-2">

        <button type="submit"
                class="btn btn-success px-4"
                onclick="return confirm('Are you sure you want to update this student details?');">

          Update

        </button>

        <a href="index.jsp"
           class="btn btn-outline-secondary px-4">

          Cancel

        </a>

      </div>

    </form>

  </div>

  <%
    }
  %>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>

  const f =
          document.getElementById('updateForm');

  if(f){

    f.addEventListener('submit', function(e){

      if(!this.checkValidity()){

        e.preventDefault();

        e.stopPropagation();

      }

      this.classList.add('was-validated');

    });

  }

</script>

</body>

</html>