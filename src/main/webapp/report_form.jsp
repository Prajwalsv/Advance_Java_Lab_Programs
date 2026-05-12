<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"><title>Reports | HMS</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>body{background:#f0f4f8}.navbar{background:linear-gradient(135deg,#1a237e,#283593)}.card{border:none;border-radius:16px;box-shadow:0 4px 20px rgba(0,0,0,.1)}.report-card{cursor:pointer;transition:all .2s;border:2px solid transparent}.report-card:hover{border-color:#3949ab;transform:translateY(-3px)}.report-card.selected{border-color:#1a237e;background:#e8eaf6}</style>
</head>
<body>
<nav class="navbar navbar-dark px-4 py-3">
  <a class="navbar-brand fw-bold" href="index.jsp"><i class="bi bi-building me-2"></i>HMS</a>
  <span class="text-white">Reports</span>
</nav>
<div class="container mt-5" style="max-width:700px">
  <%String error=(String)request.getAttribute("error");if(error!=null){%><div class="alert alert-danger"><%=error%></div><%}%>
  <div class="card p-4">
    <h4 class="fw-bold text-warning mb-4"><i class="bi bi-bar-chart-fill me-2"></i>Generate Report</h4>
    <form action="ReportServlet" method="post" id="reportForm">
      <div class="row g-3 mb-4">
        <div class="col-md-4">
          <div class="card p-3 text-center report-card" onclick="selectReport('pending',event)">
            <i class="bi bi-cash-coin fs-2 text-danger mb-2"></i>
            <h6 class="fw-semibold">Pending Fees</h6>
            <small class="text-muted">Students with outstanding fees</small>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card p-3 text-center report-card" onclick="selectReport('room',event)">
            <i class="bi bi-door-open fs-2 text-primary mb-2"></i>
            <h6 class="fw-semibold">By Room</h6>
            <small class="text-muted">Students in a specific room</small>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card p-3 text-center report-card" onclick="selectReport('daterange',event)">
            <i class="bi bi-calendar-range fs-2 text-success mb-2"></i>
            <h6 class="fw-semibold">Date Range</h6>
            <small class="text-muted">Students by admission period</small>
          </div>
        </div>
      </div>
      <input type="hidden" name="reportType" id="reportType" value="">
      <div id="fields-room" class="mb-3 d-none">
        <label class="form-label fw-semibold">Room Number</label>
        <input type="text" name="roomNumber" class="form-control" placeholder="e.g. 101">
      </div>
      <div id="fields-daterange" class="mb-3 d-none">
        <div class="row g-2">
          <div class="col"><label class="form-label fw-semibold">From Date</label><input type="date" name="fromDate" class="form-control"></div>
          <div class="col"><label class="form-label fw-semibold">To Date</label><input type="date" name="toDate" class="form-control"></div>
        </div>
      </div>
      <button type="submit" class="btn btn-warning px-4 fw-semibold" id="genBtn" disabled>
        <i class="bi bi-file-earmark-bar-graph me-2"></i>Generate Report
      </button>
      <a href="index.jsp" class="btn btn-outline-secondary ms-2 px-4">Back</a>
    </form>
  </div>
</div>
<script>
function selectReport(type,event){
  document.getElementById('reportType').value=type;
  document.getElementById('genBtn').disabled=false;
  document.querySelectorAll('.report-card').forEach(c=>c.classList.remove('selected'));
  event.currentTarget.classList.add('selected');
  document.getElementById('fields-room').classList.add('d-none');
  document.getElementById('fields-daterange').classList.add('d-none');
  if(type==='room') document.getElementById('fields-room').classList.remove('d-none');
  if(type==='daterange') document.getElementById('fields-daterange').classList.remove('d-none');
}
document.getElementById('reportForm').addEventListener('submit',function(e){
  if(!document.getElementById('reportType').value){e.preventDefault();alert('Please select a report type.');}
});
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
