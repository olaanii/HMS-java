<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg hms-navbar">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
			<i class="fas fa-heartbeat"></i> HEALTHCARE
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarMain" aria-controls="navbarMain"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarMain">

			<c:if test="${empty userObj}">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0 align-items-lg-center">
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">
							<i class="fas fa-home me-1"></i> Home
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/admin_login.jsp">
							<i class="fas fa-user-shield me-1"></i> Admin
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/doctor_login.jsp">
							<i class="fas fa-user-md me-1"></i> Doctor
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/user_appointment.jsp">
							<i class="fas fa-calendar-check me-1"></i> Appointment
						</a>
					</li>
					<li class="nav-item ms-lg-2">
						<a class="hms-btn hms-btn-primary hms-btn-sm" href="${pageContext.request.contextPath}/user_login.jsp">
							<i class="fas fa-sign-in-alt"></i> Login
						</a>
					</li>
				</ul>
			</c:if>

			<c:if test="${not empty userObj}">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0 align-items-lg-center">
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/user_appointment.jsp">
							<i class="fas fa-calendar-plus me-1"></i> Appointment
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/view_appointment.jsp">
							<i class="fas fa-list-alt me-1"></i> My Appointments
						</a>
					</li>
					<li class="nav-item dropdown ms-lg-2">
						<button class="btn btn-nav-user dropdown-toggle" type="button"
							id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fa-solid fa-circle-user"></i> ${userObj.fullName}
						</button>
						<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/change_password.jsp">
								<i class="fas fa-key me-2"></i> Change Password</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/userLogout">
								<i class="fas fa-sign-out-alt me-2"></i> Logout</a></li>
						</ul>
					</li>
				</ul>
			</c:if>

		</div>
	</div>
</nav>
