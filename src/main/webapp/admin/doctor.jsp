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
<title>Add Doctor - Healthcare HMS</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${empty adminObj}">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<div class="hms-content">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="hms-form-card">
						<div class="card-body">
							<p class="hms-form-title"><i class="fas fa-user-md me-2"></i> Add New Doctor</p>

							<c:if test="${not empty errorMsg}">
								<div class="hms-alert hms-alert-danger">${errorMsg}</div>
								<c:remove var="errorMsg" scope="session" />
							</c:if>
							<c:if test="${not empty succMsg}">
								<div class="hms-alert hms-alert-success">${succMsg}</div>
								<c:remove var="succMsg" scope="session" />
							</c:if>

							<form action="../addDoctor" method="post">
								<div class="row g-3">
									<div class="col-md-6">
										<label class="hms-label">Full Name</label>
										<input type="text" required name="fullname" class="form-control hms-input"
											placeholder="Doctor's full name">
									</div>
									<div class="col-md-6">
										<label class="hms-label">Date of Birth</label>
										<input type="date" required name="dob" class="form-control hms-input">
									</div>
									<div class="col-md-6">
										<label class="hms-label">Qualification</label>
										<input required name="qualification" type="text" class="form-control hms-input"
											placeholder="e.g. MBBS, MD">
									</div>
									<div class="col-md-6">
										<label class="hms-label">Specialist</label>
										<select name="spec" required class="form-control hms-input">
											<option value="">-- Select --</option>
											<%
											SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
											List<Specalist> list = dao.getAllSpecialist();
											for (Specalist s : list) {
											%>
											<option><%=s.getSpecialistName()%></option>
											<%
											}
											%>
										</select>
									</div>
									<div class="col-md-6">
										<label class="hms-label">Email</label>
										<input type="email" required name="email" class="form-control hms-input"
											placeholder="doctor@example.com">
									</div>
									<div class="col-md-6">
										<label class="hms-label">Mobile Number</label>
										<input type="text" required name="mobno" class="form-control hms-input"
											placeholder="Phone number">
									</div>
									<div class="col-md-12">
										<label class="hms-label">Password</label>
										<input required name="password" type="password" class="form-control hms-input"
											placeholder="Set a password for the doctor">
									</div>
									<div class="col-12 text-center mt-3">
										<button type="submit" class="hms-btn hms-btn-primary hms-btn-lg">
											<i class="fas fa-plus"></i> Add Doctor
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
