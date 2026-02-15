<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login - Healthcare HMS</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<div class="hms-auth-page">
		<div class="hms-auth-brand">
			<div class="brand-icon">
				<i class="fas fa-user-shield"></i>
			</div>
			<h2>Welcome Back</h2>
			<p>Hospital Management System - Admin Portal</p>
		</div>
		<div class="hms-auth-form">
			<div class="hms-auth-form-inner">
				<h3 class="auth-title">Admin Login</h3>
				<p class="auth-subtitle">Enter your credentials to access the admin dashboard</p>

				<c:if test="${not empty succMsg}">
					<div class="hms-alert hms-alert-success">${succMsg}</div>
					<c:remove var="succMsg" scope="session" />
				</c:if>
				<c:if test="${not empty errorMsg}">
					<div class="hms-alert hms-alert-danger">${errorMsg}</div>
					<c:remove var="errorMsg" scope="session" />
				</c:if>

				<form action="adminLogin" method="post">
					<div class="form-group">
						<label class="hms-label">Email Address</label>
						<input required name="email" type="email" class="form-control hms-input"
							placeholder="Enter your email">
					</div>
					<div class="form-group">
						<label class="hms-label">Password</label>
						<input required name="password" type="password" class="form-control hms-input"
							placeholder="Enter your password">
					</div>
					<button type="submit" class="hms-btn hms-btn-primary hms-btn-block hms-btn-lg mt-2">
						<i class="fas fa-sign-in-alt"></i> Sign In
					</button>
				</form>

				<div class="auth-footer">
					<a href="index.jsp"><i class="fas fa-arrow-left me-1"></i> Back to Home</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
