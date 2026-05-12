<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Student,java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"><title>Report Result | HMS</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>body{background:#f0f4f8}.navbar{background:linear-gradient(135deg,#1a237e,#283593)}.card{border:none;border-radius:16px;box-shadow:0 4px 20px rgba(0,0,0,.1)}@media print{.no-print{display:none}}</style>
</head>
<body>
<nav class="navbar navbar-dark px-4 py-3 no-print">
  <a class="navbar-brand fw-bold" href="index.jsp"><i class="bi bi-building me-2"></i>HMS</a>
  <span class="text-white">Report Result</span>
</nav>
<div class="container mt-4">
  <%String error=(String)request.getAttribute("error");if(error!=null){%><div class="alert alert-danger"><%=error%></div><%}%>
  <%List<Student> results=(List<Student>)request.getAttribute("results");
    String reportTitle=(String)request.getAttribute("reportTitle");
    String reportType=(String)request.getAttribute("reportType");
    if(results!=null){%>
  <div class="card p-4">
    <div class="d-flex justify-content-between align-items-start mb-4 flex-wrap gap-2">
      <div>
        <h5 class="fw-bold text-warning mb-1"><i class="bi bi-file-earmark-bar-graph me-2"></i><%=reportTitle%></h5>
        <small class="text-muted">Total Records: <strong><%=results.size()%></strong></small>
      </div>
      <div class="no-print d-flex gap-2">
        <button onclick="window.print()" class="btn btn-sm btn-outline-secondary"><i class="bi bi-printer me-1"></i>Print</button>
        <a href="report_form.jsp" class="btn btn-sm btn-warning">New Report</a>
        <a href="index.jsp" class="btn btn-sm btn-outline-dark">Home</a>
      </div>
    </div>
    <%if(results.isEmpty()){%>
      <div class="alert alert-info"><i class="bi bi-info-circle me-2"></i>No records found for this report.</div>
    <%}else{%>
    <div class="table-responsive">
      <table class="table table-hover align-middle">
        <thead class="table-dark"><tr><th>#</th><th>ID</th><th>Name</th><th>Room</th><th>Admission Date</th><th>Fees Paid</th><th>Pending Fees</th></tr></thead>
        <tbody>
          <%int sno=1;double totalPending=0;for(Student s:results){totalPending+=s.getPendingFees();%>
          <tr>
            <td><%=sno++%></td><td><%=s.getStudentID()%></td>
            <td><strong><%=s.getStudentName()%></strong></td>
            <td><span class="badge bg-secondary"><%=s.getRoomNumber()%></span></td>
            <td><%=s.getAdmissionDate()%></td>
            <td>₹<%=String.format("%.2f",s.getFeesPaid())%></td>
            <td><%if(s.getPendingFees()>0){%><span class="text-danger fw-bold">₹<%=String.format("%.2f",s.getPendingFees())%></span><%}else{%><span class="text-success">₹0.00 ✓</span><%}%></td>
          </tr>
          <%}%>
        </tbody>
        <%if("pending".equals(reportType)){%>
        <tfoot class="table-warning"><tr><td colspan="6" class="text-end fw-bold">Total Pending:</td><td class="fw-bold text-danger">₹<%=String.format("%.2f",totalPending)%></td></tr></tfoot>
        <%}%>
      </table>
    </div>
    <%}}%>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
