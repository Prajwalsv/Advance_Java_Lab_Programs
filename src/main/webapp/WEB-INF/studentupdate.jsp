<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"><title>Add Student | HMS</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>body{background:#f0f4f8}.navbar{background:linear-gradient(135deg,#1a237e,#283593)}.card{border:none;border-radius:16px;box-shadow:0 4px 20px rgba(0,0,0,.1)}</style>
</head>
<body>
<nav class="navbar navbar-dark px-4 py-3">
  <a class="navbar-brand fw-bold" href="index.jsp"><i class="bi bi-building me-2"></i>HMS</a>
  <span class="text-white">Add Student</span>
</nav>
<div class="container mt-5" style="max-width:600px">
  <div class="card p-4">
    <h4 class="mb-4 fw-bold text-primary"><i class="bi bi-person-plus-fill me-2"></i>Add New Student</h4>
    <% String error=(String)request.getAttribute("error"); String success=(String)request.getAttribute("success");
       if(error!=null){%><div class="alert alert-danger alert-dismissible fade show"><%=error%><button type="button" class="btn-close" data-bs-dismiss="alert"></button></div><%}
       if(success!=null){%><div class="alert alert-success alert-dismissible fade show"><%=success%><button type="button" class="btn-close" data-bs-dismiss="alert"></button></div><%}%>
    <form action="AddStudentServlet" method="post" novalidate id="addForm">

      <!-- Student ID with auto-fill -->
      <div class="mb-3">
        <label class="form-label fw-semibold">Student ID <span class="text-danger">*</span></label>
        <div class="d-flex gap-2">
          <input type="number" name="studentID" id="studentID" class="form-control" placeholder="Enter Student ID" required min="1">
          <button type="button" class="btn btn-outline-primary px-3" onclick="autoFill()">Auto Fill</button>
        </div>
        <small class="text-muted">Enter ID → click Auto Fill to load existing data</small>
      </div>

      <div class="mb-3">
        <label class="form-label fw-semibold">Student Name <span class="text-danger">*</span></label>
        <input type="text" name="studentName" id="studentName" class="form-control" placeholder="Enter full name" required maxlength="100">
      </div>

      <div class="mb-3">
        <label class="form-label fw-semibold">Room Number <span class="text-danger">*</span></label>
        <input type="text" name="roomNumber" id="roomNumber" class="form-control" placeholder="e.g. 101" required maxlength="10">
      </div>

      <div class="mb-3">
        <label class="form-label fw-semibold">Admission Date <span class="text-danger">*</span></label>
        <input type="date" name="admissionDate" id="admissionDate" class="form-control" required>
      </div>

      <div class="mb-3">
        <label class="form-label fw-semibold">Fees Paid (₹)</label>
        <input type="number" name="feesPaid" id="feesPaid" class="form-control" placeholder="0.00" min="0" step="0.01" value="0">
      </div>

      <div class="mb-4">
        <label class="form-label fw-semibold">Pending Fees (₹)</label>
        <input type="number" name="pendingFees" id="pendingFees" class="form-control" placeholder="0.00" min="0" step="0.01" value="0">
      </div>

      <div class="d-flex gap-2">
        <button type="submit" class="btn btn-primary px-4">Add Student</button>
        <a href="index.jsp" class="btn btn-outline-secondary px-4">Cancel</a>
      </div>
    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
function autoFill() {
  var id = document.getElementById('studentID').value;
  if (!id) { alert('Please enter a Student ID first!'); return; }

  fetch('GetStudentServlet?id=' + id)
    .then(response => response.json())
    .then(data => {
      if (data.error) {
        // ID not found - clear fields for new entry
        document.getElementById('studentName').value = '';
        document.getElementById('roomNumber').value = '';
        document.getElementById('admissionDate').value = '';
        document.getElementById('feesPaid').value = '0';
        document.getElementById('pendingFees').value = '0';
        alert('New Student ID! Fill in the details.');
      } else {
        // Fill fields with existing data
        document.getElementById('studentName').value = data.studentName;
        document.getElementById('roomNumber').value = data.roomNumber;
        document.getElementById('admissionDate').value = data.admissionDate;
        document.getElementById('feesPaid').value = data.feesPaid;
        document.getElementById('pendingFees').value = data.pendingFees;
      }
    })
    .catch(err => {
      document.getElementById('studentName').value = '';
      document.getElementById('roomNumber').value = '';
      document.getElementById('admissionDate').value = '';
      document.getElementById('feesPaid').value = '0';
      document.getElementById('pendingFees').value = '0';
    });
}

document.getElementById('addForm').addEventListener('submit',function(e){
  if(!this.checkValidity()){e.preventDefault();e.stopPropagation();}
  this.classList.add('was-validated');
});
</script>
</body>
</html>
