<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Healthcare - Hospital Management System</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<!-- Hero Carousel -->
	<section class="hms-hero">
		<div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/hero-1.jpg" class="d-block w-100" alt="Modern Hospital Building">
			</div>
			<div class="carousel-item">
				<img src="img/hero-2.jpg" class="d-block w-100" alt="Medical Professionals">
			</div>
			<div class="carousel-item">
				<img src="img/hero-3.jpg" class="d-block w-100" alt="Advanced Medical Technology">
			</div>
		</div>
			<div class="hms-hero-overlay">
				<h1>Your Health, Our Priority</h1>
				<p>Trusted healthcare services with experienced medical professionals</p>
				<a href="user_appointment.jsp" class="hms-btn hms-btn-primary hms-btn-lg">
					<i class="fas fa-calendar-check"></i> Book Appointment
				</a>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</section>

	<!-- Key Features -->
	<section class="py-5">
		<div class="container">
			<p class="hms-section-title">Key Features</p>
			<p class="text-center text-muted mb-5">Why patients trust us for their healthcare needs</p>
			<div class="row g-4">
				<div class="col-lg-8">
					<div class="row g-4">
						<div class="col-md-6">
							<div class="hms-feature-card">
								<div class="feature-icon">
									<i class="fas fa-shield-alt"></i>
								</div>
								<h5>100% Safety</h5>
								<p>Committed to the highest standards of patient and staff safety with strict protocols and modern equipment.</p>
							</div>
						</div>
						<div class="col-md-6">
							<div class="hms-feature-card">
								<div class="feature-icon">
									<i class="fas fa-leaf"></i>
								</div>
								<h5>Clean Environment</h5>
								<p>Maintain a hygienic and sanitized environment for optimal recovery and wellness of every patient.</p>
							</div>
						</div>
						<div class="col-md-6">
							<div class="hms-feature-card">
								<div class="feature-icon">
									<i class="fas fa-heart"></i>
								</div>
								<h5>Friendly Doctors</h5>
								<p>Our compassionate staff and specialists are dedicated to providing personalized patient care.</p>
							</div>
						</div>
						<div class="col-md-6">
							<div class="hms-feature-card">
								<div class="feature-icon">
									<i class="fas fa-microscope"></i>
								</div>
								<h5>Medical Research</h5>
								<p>Engaged in cutting-edge research to bring advanced treatments and innovative care solutions.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 d-flex">
					<img class="hms-img-doctor w-100" alt="Doctor" src="img/doct.jpg"
						style="object-fit:cover; min-height:100%; border-radius:var(--hms-radius-lg)">
				</div>
			</div>
		</div>
	</section>

	<!-- Our Team -->
	<section class="pb-5">
		<div class="container">
			<p class="hms-section-title">Our Team</p>
			<p class="text-center text-muted mb-5">Meet the experts behind our healthcare services</p>
			<div class="row g-4">
				<div class="col-lg-3 col-md-6">
					<div class="hms-team-card">
						<img src="img/doc1.jpg" class="team-avatar" alt="Samuel Shelema">
						<h6>Samuel Shelema</h6>
						<span class="team-role">CEO & Chairman</span>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="hms-team-card">
						<img src="img/doc2.jpg" class="team-avatar" alt="Dr. Hailmariyam Beka">
						<h6>Dr. Hailmariyam Beka</h6>
						<span class="team-role">Chief Doctor</span>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="hms-team-card">
						<img src="img/doc3.jpg" class="team-avatar" alt="Dr. Netsanet Pawlos">
						<h6>Dr. Netsanet Pawlos</h6>
						<span class="team-role">Chief Doctor</span>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="hms-team-card">
						<img src="img/doc4.jpg" class="team-avatar" alt="Dr. Fatiya Shemsu">
						<h6>Dr. Fatiya Shemsu</h6>
						<span class="team-role">Chief Doctor</span>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@include file="component/footer.jsp"%>
</body>
</html>
