<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg hms-navbar hms-navbar-admin">
	<div class="container-fluid px-4">
		<a class="navbar-brand" href="index.jsp">
			<i class="fas fa-clinic-medical"></i> HMS Admin
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#adminNav" aria-controls="adminNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="adminNav">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<a class="nav-link" href="index.jsp"><i class="fas fa-home me-1"></i> Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="doctor.jsp"><i class="fas fa-user-md me-1"></i> Add Doctor</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="view_doctor.jsp"><i class="fas fa-users me-1"></i> View Doctors</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="patient.jsp"><i class="fas fa-procedures me-1"></i> Patients</a>
				</li>
			</ul>
			<div class="dropdown">
				<button class="btn btn-nav-user dropdown-toggle" type="button"
					id="adminDropdown" data-bs-toggle="dropdown" aria-expanded="false">
					<i class="fas fa-user-shield"></i> Admin
				</button>
				<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="adminDropdown">
					<li><a class="dropdown-item text-danger" href="../adminLogout">
						<i class="fas fa-sign-out-alt me-2"></i> Logout</a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>
