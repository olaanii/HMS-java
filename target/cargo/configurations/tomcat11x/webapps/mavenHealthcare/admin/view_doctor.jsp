<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Doctors - Healthcare HMS</title>
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
				<h4 class="hms-page-title"><i class="fas fa-users me-2"></i> Doctor Directory</h4>
				<p class="text-muted mb-0">Manage all registered doctors</p>
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
				<div class="table-header d-flex justify-content-between align-items-center">
					<h5><i class="fas fa-user-md me-2"></i> All Doctors</h5>
					<a href="doctor.jsp" class="hms-btn hms-btn-primary hms-btn-sm">
						<i class="fas fa-plus"></i> Add New
					</a>
				</div>
				<div class="table-responsive">
					<table class="table hms-table">
						<thead>
							<tr>
								<th>Full Name</th>
								<th>DOB</th>
								<th>Qualification</th>
								<th>Specialist</th>
								<th>Email</th>
								<th>Mobile</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<%
							DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
							List<Doctor> list2 = dao2.getAllDoctor();
							for (Doctor d : list2) {
							%>
							<tr>
								<td><strong><%=d.getFullName()%></strong></td>
								<td><%=d.getDob()%></td>
								<td><%=d.getQualification()%></td>
								<td><span class="hms-badge hms-badge-completed"><%=d.getSpecialist()%></span></td>
								<td><%=d.getEmail()%></td>
								<td><%=d.getMobNo()%></td>
								<td>
									<a href="edit_doctor.jsp?id=<%=d.getId()%>" class="hms-action-btn hms-action-edit">
										<i class="fas fa-edit"></i> Edit
									</a>
									<a href="../deleteDoctor?id=<%=d.getId()%>" class="hms-action-btn hms-action-delete">
										<i class="fas fa-trash"></i> Delete
									</a>
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
