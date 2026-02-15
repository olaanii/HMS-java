<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg hms-navbar hms-navbar-doctor">
	<div class="container-fluid px-4">
		<a class="navbar-brand" href="index.jsp">
			<i class="fas fa-heartbeat"></i> HMS Doctor
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#doctorNav" aria-controls="doctorNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="doctorNav">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<a class="nav-link" href="index.jsp"><i class="fas fa-home me-1"></i> Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="patient.jsp"><i class="fas fa-procedures me-1"></i> Patients</a>
				</li>
			</ul>
			<div class="dropdown">
				<button class="btn btn-nav-user dropdown-toggle" type="button"
					id="doctorDropdown" data-bs-toggle="dropdown" aria-expanded="false">
					<i class="fas fa-user-md"></i> ${doctObj.fullName}
				</button>
				<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="doctorDropdown">
					<li><a class="dropdown-item" href="edit_profile.jsp">
						<i class="fas fa-user-edit me-2"></i> Edit Profile</a></li>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item text-danger" href="../doctorLogout">
						<i class="fas fa-sign-out-alt me-2"></i> Logout</a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>
