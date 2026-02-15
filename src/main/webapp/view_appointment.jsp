<%@page import="com.entity.User"%>
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
<title>My Appointments - Healthcare HMS</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<c:if test="${empty userObj}">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>
	<%@include file="component/navbar.jsp"%>

	<!-- Page Banner -->
	<div class="hms-page-banner">
		<div class="container">
			<h2><i class="fas fa-list-alt me-2"></i> My Appointments</h2>
			<span class="breadcrumb-text"><a href="index.jsp">Home</a> &gt; My Appointments</span>
		</div>
	</div>

	<div class="container py-5">
		<div class="row g-4">
			<div class="col-lg-9">
				<div class="hms-table-wrapper">
					<div class="table-header d-flex justify-content-between align-items-center">
						<h5><i class="fas fa-calendar-check me-2 text-primary"></i> Appointment List</h5>
					</div>
					<div class="table-responsive">
						<table class="table hms-table">
							<thead>
								<tr>
									<th>Full Name</th>
									<th>Gender</th>
									<th>Age</th>
									<th>Appoint Date</th>
									<th>Diseases</th>
									<th>Doctor Name</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userObj");
								if (u != null) {
									AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
									DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
									List<Appointment> list = dao.getAllAppointmentByLoginUser(u.getId());
									for (Appointment ap : list) {
										Doctor d = dao2.getDoctorById(ap.getDoctorId());
								%>
								<tr>
									<td><strong><%=ap.getFullName()%></strong></td>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppoinDate()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=d != null ? d.getFullName() : "N/A"%></td>
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
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<img class="hms-img-doctor w-100" alt="Doctor" src="img/doct.jpg"
					style="border-radius:var(--hms-radius-lg); object-fit:cover;">
			</div>
		</div>
	</div>

	<%@include file="component/footer.jsp"%>
</body>
</html>
