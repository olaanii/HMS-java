<%@page import="com.entity.Appointment"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Patient Comment - Healthcare HMS</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<c:if test="${empty doctObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>

	<!-- Page Banner -->
	<div class="hms-page-banner">
		<div class="container">
			<h2><i class="fas fa-comment-medical me-2"></i> Patient Comment</h2>
			<span class="breadcrumb-text"><a href="index.jsp">Home</a> &gt; <a href="patient.jsp">Patients</a> &gt; Comment</span>
		</div>
	</div>

	<%
	int id = Integer.parseInt(request.getParameter("id"));
	AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
	Appointment ap = dao.getAppointmentById(id);
	%>

	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="hms-form-card">
					<div class="card-body">
						<p class="hms-form-title"><i class="fas fa-notes-medical me-2"></i> Add Comment & Diagnosis</p>

						<form class="row g-3" action="../updateStatus" method="post">
							<!-- Patient Info (readonly) -->
							<div class="col-md-6">
								<label class="hms-label">Patient Name</label>
								<input type="text" readonly value="<%=ap.getFullName()%>"
									class="form-control hms-input" style="opacity:0.7">
							</div>
							<div class="col-md-6">
								<label class="hms-label">Age</label>
								<input type="text" value="<%=ap.getAge()%>" readonly
									class="form-control hms-input" style="opacity:0.7">
							</div>
							<div class="col-md-6">
								<label class="hms-label">Phone Number</label>
								<input type="text" readonly value="<%=ap.getPhNo()%>"
									class="form-control hms-input" style="opacity:0.7">
							</div>
							<div class="col-md-6">
								<label class="hms-label">Diseases</label>
								<input type="text" readonly value="<%=ap.getDiseases()%>"
									class="form-control hms-input" style="opacity:0.7">
							</div>

							<!-- Comment textarea -->
							<div class="col-md-12">
								<label class="hms-label">Doctor's Comment / Diagnosis</label>
								<textarea required name="comm" class="form-control hms-input" rows="4"
									placeholder="Enter your diagnosis, recommendations, or prescription notes..."></textarea>
							</div>

							<input type="hidden" name="id" value="<%=ap.getId()%>">
							<input type="hidden" name="did" value="<%=ap.getDoctorId()%>">

							<div class="col-12 text-center mt-2">
								<button class="hms-btn hms-btn-primary hms-btn-lg">
									<i class="fas fa-paper-plane"></i> Submit Comment
								</button>
								<a href="patient.jsp" class="hms-btn hms-btn-outline ms-2">
									<i class="fas fa-arrow-left"></i> Back
								</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
