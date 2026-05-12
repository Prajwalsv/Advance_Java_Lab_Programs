<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Student,java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"><title>View Students | HMS</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>body{background:#f0f4f8}.navbar{background:linear-gradient(135deg,#1a237e,#283593)}.card{border:none;border-radius:16px;box-shadow:0 4px 20px rgba(0,0,0,.1)}.badge-pending{background:#ffebee;color:#c62828}.badge-clear{background:#e8f5e9;color:#2e7d32}</style>
</head>
<body>
<nav class="navbar navbar-dark px-4 py-3">
  <a class="navbar-brand fw-bold" href="index.jsp"><i class="bi bi-building me-2"></i>HMS</a>
  <span class="text-white">View Students</span>
</nav>
<div class="container mt-4">
  <div class="card p-3 mb-4">
    <form action="DisplayStudentsServlet" method="get" class="d-flex gap-2 align-items-end">
      <div class="flex-grow-1">
        <label class="form-label mb-1 fw-semibold">Search by Student ID</label>
        <input type="number" name="id" class="form-control" placeholder="Enter Student ID" min="1">
      </div>
      <button type="submit" class="btn btn-info text-white px-4">Search</button>
      <a href="DisplayStudentsServlet" class="btn btn-outline-secondary px-4">View All</a>
    </form>
  </div>
  <%String error=(String)request.getAttribute("error");if(error!=null){%><div class="alert alert-danger"><%=error%></div><%}%>
  <%Student single=(Student)request.getAttribute("student");if(single!=null){%>
  <div class="card p-4 mb-4" style="max-width:500px">
    <h5 class="fw-bold text-info mb-3"><i class="bi bi-person-badge-fill me-2"></i>Student Details</h5>
    <table class="table table-bordered">
      <tr><th>Student ID</th><td><%=single.getStudentID()%></td></tr>
      <tr><th>Name</th><td><%=single.getStudentName()%></td></tr>
      <tr><th>Room Number</th><td><%=single.getRoomNumber()%></td></tr>
      <tr><th>Admission Date</th><td><%=single.getAdmissionDate()%></td></tr>
      <tr><th>Fees Paid</th><td>₹<%=String.format("%.2f",single.getFeesPaid())%></td></tr>
      <tr><th>Pending Fees</th><td><span class="badge rounded-pill px-3 py-2 <%=single.getPendingFees()>0?"badge-pending":"badge-clear"%>">₹<%=String.format("%.2f",single.getPendingFees())%></span></td></tr>
    </table>
    <div class="d-flex gap-2">
      <a href="UpdateStudentServlet?id=<%=single.getStudentID()%>" class="btn btn-success btn-sm">Edit</a>
      <a href="DeleteStudentServlet?id=<%=single.getStudentID()%>" class="btn btn-danger btn-sm">Delete</a>
    </div>
  </div>
  <%}%>
  <%List<Student> students=(List<Student>)request.getAttribute("students");if(students!=null){%>
  <div class="card p-4">
    <h5 class="fw-bold text-info mb-3"><i class="bi bi-people-fill me-2"></i>All Students <span class="badge bg-info ms-2"><%=students.size()%></span></h5>
    <%if(students.isEmpty()){%><p class="text-muted">No students found.</p><%}else{%>
    <div class="table-responsive">
      <table class="table table-hover align-middle">
        <thead class="table-dark"><tr><th>ID</th><th>Name</th><th>Room</th><th>Admission Date</th><th>Fees Paid</th><th>Pending</th><th>Actions</th></tr></thead>
        <tbody>
          <%for(Student st:students){%>
          <tr>
            <td><%=st.getStudentID()%></td>
            <td><strong><%=st.getStudentName()%></strong></td>
            <td><span class="badge bg-secondary"><%=st.getRoomNumber()%></span></td>
            <td><%=st.getAdmissionDate()%></td>
            <td>₹<%=String.format("%.2f",st.getFeesPaid())%></td>
            <td><span class="badge rounded-pill px-3 py-2 <%=st.getPendingFees()>0?"badge-pending":"badge-clear"%>">₹<%=String.format("%.2f",st.getPendingFees())%></span></td>
            <td>
              <a href="UpdateStudentServlet?id=<%=st.getStudentID()%>" class="btn btn-sm btn-success me-1"><i class="bi bi-pencil"></i></a>
              <a href="DeleteStudentServlet?id=<%=st.getStudentID()%>" class="btn btn-sm btn-danger"><i class="bi bi-trash"></i></a>
            </td>
          </tr>
          <%}%>
        </tbody>
      </table>
    </div>
    <%}}%>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
