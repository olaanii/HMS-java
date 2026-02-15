<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Book Appointment - Healthcare HMS</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<!-- Page Banner -->
	<div class="hms-page-banner">
		<div class="container">
			<h2><i class="fas fa-calendar-check me-2"></i> Book Appointment</h2>
			<span class="breadcrumb-text"><a href="index.jsp">Home</a> &gt; Book Appointment</span>
		</div>
	</div>

	<div class="container py-5">
		<div class="row g-4">
			<div class="col-lg-4">
				<img class="hms-img-doctor w-100" alt="Doctor" src="img/doct.jpg"
					style="border-radius:var(--hms-radius-lg); object-fit:cover; height:350px;">
				<div class="hms-card mt-3">
					<div class="card-body">
						<h6 class="fw-bold mb-3"><i class="fas fa-info-circle me-2 text-primary"></i> Contact & Hours</h6>
						<div class="d-flex align-items-center gap-2 mb-2">
							<i class="fas fa-phone text-muted" style="width:18px"></i>
							<small class="text-muted">+1 (555) 123-4567</small>
						</div>
						<div class="d-flex align-items-center gap-2 mb-2">
							<i class="fas fa-envelope text-muted" style="width:18px"></i>
							<small class="text-muted">info@healthcare.com</small>
						</div>
						<div class="d-flex align-items-center gap-2">
							<i class="fas fa-clock text-muted" style="width:18px"></i>
							<small class="text-muted">Mon-Sat: 8AM - 8PM</small>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-8">
				<div class="hms-form-card">
					<div class="card-body">
						<p class="hms-form-title"><i class="fas fa-calendar-plus me-2"></i> Book Your Appointment</p>

						<c:if test="${not empty errorMsg}">
							<div class="hms-alert hms-alert-danger">${errorMsg}</div>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="hms-alert hms-alert-success">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form class="row g-3" action="appAppointment" method="post">
							<input type="hidden" name="userid" value="${userObj.id}">

							<div class="col-md-6">
								<label class="hms-label">Full Name</label>
								<input required type="text" class="form-control hms-input" name="fullname"
									placeholder="Enter your full name">
							</div>
							<div class="col-md-6">
								<label class="hms-label">Gender</label>
								<select class="form-control hms-input" name="gender" required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>
							<div class="col-md-6">
								<label class="hms-label">Age</label>
								<input required type="number" class="form-control hms-input" name="age"
									placeholder="Enter your age">
							</div>
							<div class="col-md-6">
								<label class="hms-label">Appointment Date</label>
								<input type="date" class="form-control hms-input" required name="appoint_date">
							</div>
							<div class="col-md-6">
								<label class="hms-label">Email</label>
								<input required type="email" class="form-control hms-input" name="email"
									placeholder="Enter your email">
							</div>
							<div class="col-md-6">
								<label class="hms-label">Phone Number</label>
								<input maxlength="10" required type="number" class="form-control hms-input"
									name="phno" placeholder="Enter phone number">
							</div>
							<div class="col-md-6">
								<label class="hms-label">Diseases</label>
								<input required type="text" class="form-control hms-input" name="diseases"
									placeholder="Describe your condition">
							</div>
							<div class="col-md-6">
								<label class="hms-label">Select Doctor</label>
								<select required class="form-control hms-input" name="doct">
									<option value="">-- Select Doctor --</option>
									<%
									DoctorDao dao = new DoctorDao(DBConnect.getConn());
									List<Doctor> list = dao.getAllDoctor();
									for (Doctor d : list) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)</option>
									<%
									}
									%>
								</select>
							</div>
							<div class="col-md-12">
								<label class="hms-label">Full Address</label>
								<textarea required name="address" class="form-control hms-input" rows="3"
									placeholder="Enter your full address"></textarea>
							</div>

							<div class="col-12 text-center mt-3">
								<c:if test="${empty userObj}">
									<a href="user_login.jsp" class="hms-btn hms-btn-primary hms-btn-lg">
										<i class="fas fa-sign-in-alt"></i> Login to Submit
									</a>
								</c:if>
								<c:if test="${not empty userObj}">
									<button class="hms-btn hms-btn-primary hms-btn-lg">
										<i class="fas fa-paper-plane"></i> Submit Appointment
									</button>
								</c:if>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="component/footer.jsp"%>
</body>
</html>
