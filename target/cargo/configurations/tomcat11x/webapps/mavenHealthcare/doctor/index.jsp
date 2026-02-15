<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Doctor Dashboard - Healthcare HMS</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<c:if test="${empty doctObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>

	<%
	Doctor d = (Doctor) session.getAttribute("doctObj");
	DoctorDao dao = new DoctorDao(DBConnect.getConn());
	%>

	<div class="hms-dashboard">
		<div class="container-fluid px-4">
			<div class="hms-dashboard-header">
				<h4 class="hms-page-title">Welcome, Dr. ${doctObj.fullName}</h4>
				<p class="text-muted mb-0">Your doctor dashboard overview</p>
			</div>

			<div class="row g-4 mb-4">
				<div class="col-md-4">
					<div class="hms-stat-card stat-green">
						<div class="stat-icon">
							<i class="fas fa-user-md"></i>
						</div>
						<div class="stat-number"><%=dao.countDoctor()%></div>
						<div class="stat-label">Total Doctors</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="hms-stat-card stat-amber">
						<div class="stat-icon">
							<i class="fas fa-calendar-check"></i>
						</div>
						<div class="stat-number"><%=dao.countAppointmentByDocotrId(d.getId())%></div>
						<div class="stat-label">My Appointments</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="hms-stat-card stat-blue">
						<div class="stat-icon">
							<i class="fas fa-stethoscope"></i>
						</div>
						<div class="stat-number">${doctObj.specialist}</div>
						<div class="stat-label" style="font-size:0.8rem">Specialization</div>
					</div>
				</div>
			</div>

			<div class="row g-4">
				<div class="col-lg-6">
					<div class="hms-card">
						<div class="card-body">
							<h6 class="fw-bold mb-3"><i class="fas fa-lightbulb me-2 text-warning"></i> Quick Actions</h6>
							<div class="d-flex flex-wrap gap-2">
								<a href="patient.jsp" class="hms-btn hms-btn-primary hms-btn-sm">
									<i class="fas fa-procedures"></i> View Patients
								</a>
								<a href="edit_profile.jsp" class="hms-btn hms-btn-outline hms-btn-sm">
									<i class="fas fa-user-edit"></i> Edit Profile
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
