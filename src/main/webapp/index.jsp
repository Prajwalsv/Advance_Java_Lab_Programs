<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hostel Management System</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body{background:#f0f4f8}
    .navbar{background:linear-gradient(135deg,#1a237e,#283593)}
    .hero{background:linear-gradient(135deg,#1a237e,#3949ab);color:white;padding:60px 0;text-align:center}
    .card{border:none;border-radius:16px;box-shadow:0 4px 20px rgba(0,0,0,.08);transition:transform .2s,box-shadow .2s}
    .card:hover{transform:translateY(-5px);box-shadow:0 8px 30px rgba(0,0,0,.15)}
    .card-icon{font-size:2.5rem;margin-bottom:12px}
    footer{background:#1a237e;color:#ccc;padding:20px 0;text-align:center}
  </style>
</head>
<body>
<nav class="navbar navbar-dark px-4 py-3">
  <span class="navbar-brand fw-bold fs-4"><i class="bi bi-building me-2"></i>Hostel Management System</span>
</nav>
<div class="hero">
  <h1 class="display-5 fw-bold">Welcome to Hostel Management System</h1>
  <p class="lead mt-2">Manage student admissions, rooms, and fees — all in one place.</p>
</div>
<div class="container my-5">
  <div class="row g-4 justify-content-center">
    <div class="col-md-4 col-sm-6">
      <div class="card p-4 text-center h-100">
        <div class="card-icon text-primary"><i class="bi bi-person-plus-fill"></i></div>
        <h5 class="fw-bold">Add Student</h5>
        <p class="text-muted">Register a new student with room and fee details.</p>
        <a href="studentadd.jsp" class="btn btn-primary mt-auto">Add Student</a>
      </div>
    </div>
    <div class="col-md-4 col-sm-6">
      <div class="card p-4 text-center h-100">
        <div class="card-icon text-success"><i class="bi bi-pencil-square"></i></div>
        <h5 class="fw-bold">Update Student</h5>
        <p class="text-muted">Update existing student information and fee records.</p>
        <a href="studentupdate.jsp" class="btn btn-success mt-auto">Update Student</a>
      </div>
    </div>
    <div class="col-md-4 col-sm-6">
      <div class="card p-4 text-center h-100">
        <div class="card-icon text-danger"><i class="bi bi-person-dash-fill"></i></div>
        <h5 class="fw-bold">Delete Student</h5>
        <p class="text-muted">Remove a student record from the hostel system.</p>
        <a href="studentdelete.jsp" class="btn btn-danger mt-auto">Delete Student</a>
      </div>
    </div>
    <div class="col-md-4 col-sm-6">
      <div class="card p-4 text-center h-100">
        <div class="card-icon text-info"><i class="bi bi-people-fill"></i></div>
        <h5 class="fw-bold">View Students</h5>
        <p class="text-muted">Display all students or search by individual ID.</p>
        <a href="DisplayStudentsServlet" class="btn btn-info text-white mt-auto">View Students</a>
      </div>
    </div>
    <div class="col-md-4 col-sm-6">
      <div class="card p-4 text-center h-100">
        <div class="card-icon text-warning"><i class="bi bi-bar-chart-fill"></i></div>
        <h5 class="fw-bold">Reports</h5>
        <p class="text-muted">Generate reports on fees, rooms, and admission dates.</p>
        <a href="report_form.jsp" class="btn btn-warning mt-auto">View Reports</a>
      </div>
    </div>
  </div>
</div>
<footer><p class="mb-0">&copy; 2024 Hostel Management System &mdash; IV SEM CSE-C | 4AL24CS146</p></footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
