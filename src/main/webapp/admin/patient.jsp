<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Patients - Healthcare HMS</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${empty adminObj}">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<div class="hms-content">
		<div class="container-fluid px-4">
			<div class="hms-dashboard-header">
				<h4 class="hms-page-title"><i class="fas fa-procedures me-2"></i> Patient Records</h4>
				<p class="text-muted mb-0">View all patient appointments and records</p>
			</div>

			<div class="hms-table-wrapper">
				<div class="table-header">
					<h5><i class="fas fa-clipboard-list me-2"></i> All Patient Details</h5>
				</div>
				<div class="table-responsive">
					<table class="table hms-table">
						<thead>
							<tr>
								<th>Full Name</th>
								<th>Gender</th>
								<th>Age</th>
								<th>Appointment</th>
								<th>Email</th>
								<th>Mobile</th>
								<th>Diseases</th>
								<th>Doctor</th>
								<th>Address</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<%
							AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
							DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
							List<Appointment> list = dao.getAllAppointment();
							for (Appointment ap : list) {
								Doctor d = dao2.getDoctorById(ap.getDoctorId());
							%>
							<tr>
								<td><strong><%=ap.getFullName()%></strong></td>
								<td><%=ap.getGender()%></td>
								<td><%=ap.getAge()%></td>
								<td><%=ap.getAppoinDate()%></td>
								<td><%=ap.getEmail()%></td>
								<td><%=ap.getPhNo()%></td>
								<td><%=ap.getDiseases()%></td>
								<td><%=d != null ? d.getFullName() : "N/A"%></td>
								<td><%=ap.getAddress()%></td>
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
