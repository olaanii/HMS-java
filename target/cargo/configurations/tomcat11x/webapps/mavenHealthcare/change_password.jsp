<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Change Password - Healthcare HMS</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<c:if test="${empty userObj}">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>

	<div class="hms-content">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-5">
					<div class="text-center mb-4">
						<div style="width:70px;height:70px;border-radius:50%;background:linear-gradient(135deg,var(--hms-accent),var(--hms-primary));display:inline-flex;align-items:center;justify-content:center;margin-bottom:1rem;">
							<i class="fas fa-key" style="font-size:1.75rem;color:#fff"></i>
						</div>
						<h4 class="fw-bold">Change Password</h4>
						<p class="text-muted">Update your account password</p>
					</div>

					<div class="hms-form-card">
						<div class="card-body">
							<c:if test="${not empty succMsg}">
								<div class="hms-alert hms-alert-success">${succMsg}</div>
								<c:remove var="succMsg" scope="session" />
							</c:if>
							<c:if test="${not empty errorMsg}">
								<div class="hms-alert hms-alert-danger">${errorMsg}</div>
								<c:remove var="errorMsg" scope="session" />
							</c:if>

							<form action="userChangePassword" method="post">
								<div class="mb-3">
									<label class="hms-label">New Password</label>
									<input type="password" name="newPassword" class="form-control hms-input"
										required placeholder="Enter new password">
								</div>
								<div class="mb-3">
									<label class="hms-label">Old Password</label>
									<input type="password" name="oldPassword" class="form-control hms-input"
										required placeholder="Enter current password">
								</div>
								<input type="hidden" value="${userObj.id}" name="uid">
								<button class="hms-btn hms-btn-primary hms-btn-block hms-btn-lg">
									<i class="fas fa-save"></i> Update Password
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="component/footer.jsp"%>
</body>
</html>
