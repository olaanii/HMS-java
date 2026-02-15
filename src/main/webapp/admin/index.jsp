<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard - Healthcare HMS</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${empty adminObj}">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<div class="hms-dashboard">
		<div class="container-fluid px-4">
			<div class="hms-dashboard-header">
				<h4 class="hms-page-title">Admin Dashboard</h4>
				<p class="text-muted mb-0">Overview of your hospital management system</p>
			</div>

			<c:if test="${not empty errorMsg}">
				<div class="hms-alert hms-alert-danger">${errorMsg}</div>
				<c:remove var="errorMsg" scope="session" />
			</c:if>
			<c:if test="${not empty succMsg}">
				<div class="hms-alert hms-alert-success">${succMsg}</div>
				<c:remove var="succMsg" scope="session" />
			</c:if>

			<%
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			%>

			<!-- Stat Cards -->
			<div class="row g-4 mb-4">
				<div class="col-xl-3 col-md-6">
					<div class="hms-stat-card stat-green">
						<div class="stat-icon">
							<i class="fas fa-user-md"></i>
						</div>
						<div class="stat-number"><%=dao.countDoctor()%></div>
						<div class="stat-label">Doctors</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="hms-stat-card stat-blue">
						<div class="stat-icon">
							<i class="fas fa-users"></i>
						</div>
						<div class="stat-number"><%=dao.countUSer()%></div>
						<div class="stat-label">Users</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="hms-stat-card stat-amber">
						<div class="stat-icon">
							<i class="fas fa-calendar-check"></i>
						</div>
						<div class="stat-number"><%=dao.countAppointment()%></div>
						<div class="stat-label">Appointments</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="hms-stat-card stat-purple" style="cursor:pointer"
						data-bs-toggle="modal" data-bs-target="#specialistModal">
						<div class="stat-icon">
							<i class="fas fa-stethoscope"></i>
						</div>
						<div class="stat-number"><%=dao.countSpecialist()%></div>
						<div class="stat-label">Specialists <small class="text-muted">(click to add)</small></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Add Specialist Modal -->
	<div class="modal fade" id="specialistModal" tabindex="-1" aria-labelledby="specialistModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="specialistModalLabel">
						<i class="fas fa-plus-circle me-2 text-primary"></i> Add Specialist
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../addSpecialist" method="post">
						<div class="mb-3">
							<label class="hms-label">Specialist Name</label>
							<input type="text" name="specName" class="form-control hms-input"
								placeholder="e.g. Cardiologist, Neurologist..." required>
						</div>
						<div class="text-center">
							<button type="submit" class="hms-btn hms-btn-primary">
								<i class="fas fa-plus"></i> Add Specialist
							</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
