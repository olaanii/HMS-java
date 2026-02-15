<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Patients - Healthcare HMS</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<c:if test="${empty doctObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>

	<div class="hms-content">
		<div class="container-fluid px-4">
			<div class="hms-dashboard-header">
				<h4 class="hms-page-title"><i class="fas fa-procedures me-2"></i> My Patients</h4>
				<p class="text-muted mb-0">View and manage your patient appointments</p>
			</div>

			<c:if test="${not empty errorMsg}">
				<div class="hms-alert hms-alert-danger">${errorMsg}</div>
				<c:remove var="errorMsg" scope="session" />
			</c:if>
			<c:if test="${not empty succMsg}">
				<div class="hms-alert hms-alert-success">${succMsg}</div>
				<c:remove var="succMsg" scope="session" />
			</c:if>

			<div class="hms-table-wrapper">
				<div class="table-header">
					<h5><i class="fas fa-clipboard-list me-2"></i> Patient Details</h5>
				</div>
				<div class="table-responsive">
					<table class="table hms-table">
						<thead>
							<tr>
								<th>Full Name</th>
								<th>Gender</th>
								<th>Age</th>
								<th>Appointment Date</th>
								<th>Email</th>
								<th>Mobile</th>
								<th>Diseases</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							Doctor d = (Doctor) session.getAttribute("doctObj");
							AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
							List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
							for (Appointment ap : list) {
							%>
							<tr>
								<td><strong><%=ap.getFullName()%></strong></td>
								<td><%=ap.getGender()%></td>
								<td><%=ap.getAge()%></td>
								<td><%=ap.getAppoinDate()%></td>
								<td><%=ap.getEmail()%></td>
								<td><%=ap.getPhNo()%></td>
								<td><%=ap.getDiseases()%></td>
								<td>
									<%
									if ("Pending".equals(ap.getStatus())) {
									%>
									<span class="hms-badge hms-badge-pending"><i class="fas fa-clock me-1"></i> Pending</span>
									<%
									} else {
									%>
									<span class="hms-badge hms-badge-completed"><i class="fas fa-check me-1"></i> <%=ap.getStatus()%></span>
									<%
									}
									%>
								</td>
								<td>
									<%
									if ("Pending".equals(ap.getStatus())) {
									%>
									<a href="comment.jsp?id=<%=ap.getId()%>" class="hms-action-btn hms-action-comment">
										<i class="fas fa-comment-medical"></i> Comment
									</a>
									<%
									} else {
									%>
									<span class="hms-action-btn" style="opacity:0.4;cursor:default;background:#f3f4f6;color:#9ca3af;border:1px solid #e5e7eb">
										<i class="fas fa-check-circle"></i> Done
									</span>
									<%
									}
									%>
								</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
