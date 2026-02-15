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
<title>Edit Profile - Healthcare HMS</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<c:if test="${empty doctObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>

	<div class="hms-content">
		<div class="container">
			<div class="row g-4">
				<!-- Change Password Card -->
				<div class="col-lg-5">
					<div class="hms-form-card">
						<div class="card-body">
							<p class="hms-form-title"><i class="fas fa-key me-2"></i> Change Password</p>

							<c:if test="${not empty succMsg}">
								<div class="hms-alert hms-alert-success">${succMsg}</div>
								<c:remove var="succMsg" scope="session" />
							</c:if>
							<c:if test="${not empty errorMsg}">
								<div class="hms-alert hms-alert-danger">${errorMsg}</div>
								<c:remove var="errorMsg" scope="session" />
							</c:if>

							<form action="../doctChangePassword" method="post">
								<div class="mb-3">
									<label class="hms-label">New Password</label>
									<input type="password" name="newPassword" class="form-control hms-input"
										required placeholder="Enter new password">
								</div>
								<div class="mb-3">
									<label class="hms-label">Current Password</label>
									<input type="password" name="oldPassword" class="form-control hms-input"
										required placeholder="Enter current password">
								</div>
								<input type="hidden" value="${doctObj.id}" name="uid">
								<button class="hms-btn hms-btn-primary hms-btn-block">
									<i class="fas fa-save"></i> Update Password
								</button>
							</form>
						</div>
					</div>
				</div>

				<!-- Edit Profile Card -->
				<div class="col-lg-7">
					<div class="hms-form-card">
						<div class="card-body">
							<p class="hms-form-title"><i class="fas fa-user-edit me-2"></i> Edit Profile</p>

							<c:if test="${not empty succMsgd}">
								<div class="hms-alert hms-alert-success">${succMsgd}</div>
								<c:remove var="succMsgd" scope="session" />
							</c:if>
							<c:if test="${not empty errorMsgd}">
								<div class="hms-alert hms-alert-danger">${errorMsgd}</div>
								<c:remove var="errorMsgd" scope="session" />
							</c:if>

							<form action="../doctorUpdateProfile" method="post">
								<div class="row g-3">
									<div class="col-md-6">
										<label class="hms-label">Full Name</label>
										<input type="text" required name="fullname" class="form-control hms-input"
											value="${doctObj.fullName}">
									</div>
									<div class="col-md-6">
										<label class="hms-label">Date of Birth</label>
										<input type="date" required name="dob" class="form-control hms-input"
											value="${doctObj.dob}">
									</div>
									<div class="col-md-6">
										<label class="hms-label">Qualification</label>
										<input required name="qualification" type="text" class="form-control hms-input"
											value="${doctObj.qualification}">
									</div>
									<div class="col-md-6">
										<label class="hms-label">Specialist</label>
										<select name="spec" required class="form-control hms-input">
											<option>${doctObj.specialist}</option>
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
										<input type="email" readonly required name="email" class="form-control hms-input"
											value="${doctObj.email}" style="opacity:0.7">
									</div>
									<div class="col-md-6">
										<label class="hms-label">Mobile Number</label>
										<input type="text" required name="mobno" class="form-control hms-input"
											value="${doctObj.mobNo}">
									</div>
									<input type="hidden" name="id" value="${doctObj.id}">
									<div class="col-12 text-center mt-2">
										<button type="submit" class="hms-btn hms-btn-primary hms-btn-lg">
											<i class="fas fa-save"></i> Update Profile
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
