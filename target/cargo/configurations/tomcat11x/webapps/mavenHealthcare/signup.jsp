<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign Up - Healthcare HMS</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<div class="hms-auth-page">
		<div class="hms-auth-brand">
			<div class="brand-icon">
				<i class="fas fa-user-plus"></i>
			</div>
			<h2>Join Us Today</h2>
			<p>Hospital Management System</p>
		</div>
		<div class="hms-auth-form">
			<div class="hms-auth-form-inner">
				<h3 class="auth-title">Create Account</h3>
				<p class="auth-subtitle">Register to book appointments and access healthcare services</p>

				<c:if test="${not empty sucMsg}">
					<div class="hms-alert hms-alert-success">${sucMsg}</div>
					<c:remove var="sucMsg" scope="session" />
				</c:if>
				<c:if test="${not empty errorMsg}">
					<div class="hms-alert hms-alert-danger">${errorMsg}</div>
					<c:remove var="errorMsg" scope="session" />
				</c:if>

				<form action="user_register" method="post">
					<div class="form-group">
						<label class="hms-label">Full Name</label>
						<input required name="fullname" type="text" class="form-control hms-input"
							placeholder="Enter your full name">
					</div>
					<div class="form-group">
						<label class="hms-label">Email Address</label>
						<input required name="email" type="email" class="form-control hms-input"
							placeholder="Enter your email">
					</div>
					<div class="form-group">
						<label class="hms-label">Password</label>
						<input required name="password" type="password" class="form-control hms-input"
							placeholder="Create a password">
					</div>
					<button type="submit" class="hms-btn hms-btn-primary hms-btn-block hms-btn-lg mt-2">
						<i class="fas fa-user-plus"></i> Register
					</button>
				</form>

				<div class="auth-footer">
					Already have an account? <a href="user_login.jsp">Sign In</a>
					<br><br>
					<a href="index.jsp"><i class="fas fa-arrow-left me-1"></i> Back to Home</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
