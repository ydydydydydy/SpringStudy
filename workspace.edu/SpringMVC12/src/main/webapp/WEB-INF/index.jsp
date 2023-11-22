<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!-- Spring Security 관련 태그라이브러리 -->
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- 로그인한 계정정보 -->
<c:set var="user"
	value="${SPRING_SECURITY_CONTEXT.authentication.principal}" />
<!-- 권한정보 -->
<c:set var="auth"
	value="${SPRING_SECURITY_CONTEXT.authentication.authorities}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Bridge To Be</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="resources/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Jost:wght@500;600;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="resources/lib/lightbox/css/lightbox.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="resources/css/style.css" rel="stylesheet">

<link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet">
</head>
<body>
	<div class="container-xxl bg-white p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-grow text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->

<%@include file="/WEB-INF/header.jsp"%>
	

			<div class="container-xxl bg-primary hero-header">
				<div class="container px-lg-5">
					<div class="row g-5 align-items-end">
						<div class="col-lg-6 text-center text-lg-start">
							<h1 class="text-white mb-4 animated slideInDown">A Digital
								Agency Of Inteligents & Creative People</h1>
							<p class="text-white pb-3 animated slideInDown">Tempor rebum
								no at dolore lorem clita rebum rebum ipsum rebum stet dolor sed
								justo kasd. Ut dolor sed magna dolor sea diam. Sit diam sit
								justo amet ipsum vero ipsum clita lorem</p>
							<a href=""
								class="btn btn-secondary py-sm-3 px-sm-5 rounded-pill me-3 animated slideInLeft">Read
								More</a> <a href=""
								class="btn btn-light py-sm-3 px-sm-5 rounded-pill animated slideInRight">Contact
								Us</a>
						</div>
						<div class="col-lg-6 text-center text-lg-start">
							<img class="img-fluid animated zoomIn"
								src="resources/img/hero.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Navbar & Hero End -->


		<!-- Feature Start -->
		<div class="container-xxl py-5">
			<div class="container py-5 px-lg-5">
				<div class="row g-4">
					<div class="col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
						<div class="feature-item bg-light rounded text-center p-4">
							<i class="fa fa-3x fa-mail-bulk text-primary mb-4"></i>
							<h5 class="mb-3">Digital Marketing</h5>
							<p class="m-0">Erat ipsum justo amet duo et elitr dolor, est
								duo duo eos lorem sed diam stet diam sed stet lorem.</p>
						</div>
					</div>
					<div class="col-lg-4 wow fadeInUp" data-wow-delay="0.3s">
						<div class="feature-item bg-light rounded text-center p-4">
							<i class="fa fa-3x fa-search text-primary mb-4"></i>
							<h5 class="mb-3">SEO & Backlinks</h5>
							<p class="m-0">Erat ipsum justo amet duo et elitr dolor, est
								duo duo eos lorem sed diam stet diam sed stet lorem.</p>
						</div>
					</div>
					<div class="col-lg-4 wow fadeInUp" data-wow-delay="0.5s">
						<div class="feature-item bg-light rounded text-center p-4">
							<i class="fa fa-3x fa-laptop-code text-primary mb-4"></i>
							<h5 class="mb-3">Design & Development</h5>
							<p class="m-0">Erat ipsum justo amet duo et elitr dolor, est
								duo duo eos lorem sed diam stet diam sed stet lorem.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Feature End -->


		<!-- About Start -->
		<div class="container-xxl py-5">
			<div class="container py-5 px-lg-5">
				<div class="row g-5 align-items-center">
					<div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
						<p class="section-title text-secondary">
							About Us<span></span>
						</p>
						<h1 class="mb-5">#1 Digital solution with 10 years of
							experience</h1>
						<p class="mb-4">Diam dolor diam ipsum et tempor sit. Aliqu
							diam amet diam et eos labore. Clita erat ipsum et lorem et sit,
							sed stet no labore lorem sit clita duo justo eirmod magna dolore
							erat amet</p>
						<div class="skill mb-4">
							<div class="d-flex justify-content-between">
								<p class="mb-2">Digital Marketing</p>
								<p class="mb-2">85%</p>
							</div>
							<div class="progress">
								<div class="progress-bar bg-primary" role="progressbar"
									aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
						<div class="skill mb-4">
							<div class="d-flex justify-content-between">
								<p class="mb-2">SEO & Backlinks</p>
								<p class="mb-2">90%</p>
							</div>
							<div class="progress">
								<div class="progress-bar bg-secondary" role="progressbar"
									aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
						<div class="skill mb-4">
							<div class="d-flex justify-content-between">
								<p class="mb-2">Design & Development</p>
								<p class="mb-2">95%</p>
							</div>
							<div class="progress">
								<div class="progress-bar bg-dark" role="progressbar"
									aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
						<a href=""
							class="btn btn-primary py-sm-3 px-sm-5 rounded-pill mt-3">Read
							More</a>
					</div>
					<div class="col-lg-6">
						<img class="img-fluid wow zoomIn" data-wow-delay="0.5s"
							src="resources/img/about.png">
					</div>
				</div>
			</div>
		</div>
		<!-- About End -->


		<!-- Facts Start -->
		<div class="container-xxl bg-primary fact py-5 wow fadeInUp"
			data-wow-delay="0.1s">
			<div class="container py-5 px-lg-5">
				<div class="row g-4">
					<div class="col-md-6 col-lg-3 text-center wow fadeIn"
						data-wow-delay="0.1s">
						<i class="fa fa-certificate fa-3x text-secondary mb-3"></i>
						<h1 class="text-white mb-2" data-toggle="counter-up">1234</h1>
						<p class="text-white mb-0">Years Experience</p>
					</div>
					<div class="col-md-6 col-lg-3 text-center wow fadeIn"
						data-wow-delay="0.3s">
						<i class="fa fa-users-cog fa-3x text-secondary mb-3"></i>
						<h1 class="text-white mb-2" data-toggle="counter-up">1234</h1>
						<p class="text-white mb-0">Team Members</p>
					</div>
					<div class="col-md-6 col-lg-3 text-center wow fadeIn"
						data-wow-delay="0.5s">
						<i class="fa fa-users fa-3x text-secondary mb-3"></i>
						<h1 class="text-white mb-2" data-toggle="counter-up">1234</h1>
						<p class="text-white mb-0">Satisfied Clients</p>
					</div>
					<div class="col-md-6 col-lg-3 text-center wow fadeIn"
						data-wow-delay="0.7s">
						<i class="fa fa-check fa-3x text-secondary mb-3"></i>
						<h1 class="text-white mb-2" data-toggle="counter-up">1234</h1>
						<p class="text-white mb-0">Compleate Projects</p>
					</div>
				</div>
			</div>
		</div>
		<!-- Facts End -->


		<!-- Service Start -->
		<div class="container-xxl py-5">
			<div class="container py-5 px-lg-5">
				<div class="wow fadeInUp" data-wow-delay="0.1s">
					<p class="section-title text-secondary justify-content-center">
						<span></span>Our Services<span></span>
					</p>
					<h1 class="text-center mb-5">What Solutions We Provide</h1>
				</div>
				<div class="row g-4">
					<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
						<div class="service-item d-flex flex-column text-center rounded">
							<div class="service-icon flex-shrink-0">
								<i class="fa fa-search fa-2x"></i>
							</div>
							<h5 class="mb-3">SEO Optimization</h5>
							<p class="m-0">Erat ipsum justo amet duo et elitr dolor, est
								duo duo eos lorem sed diam stet diam sed stet lorem.</p>
							<a class="btn btn-square" href=""><i
								class="fa fa-arrow-right"></i></a>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
						<div class="service-item d-flex flex-column text-center rounded">
							<div class="service-icon flex-shrink-0">
								<i class="fa fa-laptop-code fa-2x"></i>
							</div>
							<h5 class="mb-3">Web Design</h5>
							<p class="m-0">Erat ipsum justo amet duo et elitr dolor, est
								duo duo eos lorem sed diam stet diam sed stet lorem.</p>
							<a class="btn btn-square" href=""><i
								class="fa fa-arrow-right"></i></a>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
						<div class="service-item d-flex flex-column text-center rounded">
							<div class="service-icon flex-shrink-0">
								<i class="fab fa-facebook-f fa-2x"></i>
							</div>
							<h5 class="mb-3">Social Media Marketing</h5>
							<p class="m-0">Erat ipsum justo amet duo et elitr dolor, est
								duo duo eos lorem sed diam stet diam sed stet lorem.</p>
							<a class="btn btn-square" href=""><i
								class="fa fa-arrow-right"></i></a>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
						<div class="service-item d-flex flex-column text-center rounded">
							<div class="service-icon flex-shrink-0">
								<i class="fa fa-mail-bulk fa-2x"></i>
							</div>
							<h5 class="mb-3">Email Marketing</h5>
							<p class="m-0">Erat ipsum justo amet duo et elitr dolor, est
								duo duo eos lorem sed diam stet diam sed stet lorem.</p>
							<a class="btn btn-square" href=""><i
								class="fa fa-arrow-right"></i></a>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
						<div class="service-item d-flex flex-column text-center rounded">
							<div class="service-icon flex-shrink-0">
								<i class="fa fa-thumbs-up fa-2x"></i>
							</div>
							<h5 class="mb-3">PPC Advertising</h5>
							<p class="m-0">Erat ipsum justo amet duo et elitr dolor, est
								duo duo eos lorem sed diam stet diam sed stet lorem.</p>
							<a class="btn btn-square" href=""><i
								class="fa fa-arrow-right"></i></a>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
						<div class="service-item d-flex flex-column text-center rounded">
							<div class="service-icon flex-shrink-0">
								<i class="fab fa-android fa-2x"></i>
							</div>
							<h5 class="mb-3">App Development</h5>
							<p class="m-0">Erat ipsum justo amet duo et elitr dolor, est
								duo duo eos lorem sed diam stet diam sed stet lorem.</p>
							<a class="btn btn-square" href=""><i
								class="fa fa-arrow-right"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Service End -->


		<!-- Newsletter Start -->
		<div class="container-xxl bg-primary newsletter py-5 wow fadeInUp"
			data-wow-delay="0.1s">
			<div class="container py-5 px-lg-5">
				<div class="row justify-content-center">
					<div class="col-lg-7 text-center">
						<p class="section-title text-white justify-content-center">
							<span></span>Newsletter<span></span>
						</p>
						<h1 class="text-center text-white mb-4">Stay Always In Touch</h1>
						<p class="text-white mb-4">Diam dolor diam ipsum et tempor
							sit. Aliqu diam amet diam et eos labore. Clita erat ipsum et
							lorem et sit sed stet lorem sit clita duo justo</p>
						<div class="position-relative w-100 mt-3">
							<input class="form-control border-0 rounded-pill w-100 ps-4 pe-5"
								type="text" placeholder="Enter Your Email" style="height: 48px;">
							<button type="button"
								class="btn shadow-none position-absolute top-0 end-0 mt-1 me-2">
								<i class="fa fa-paper-plane text-primary fs-4"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Newsletter End -->


		<!-- Projects Start -->
		<div class="container-xxl py-5">
			<div class="container py-5 px-lg-5">
				<div class="wow fadeInUp" data-wow-delay="0.1s">
					<p class="section-title text-secondary justify-content-center">
						<span></span>Our Projects<span></span>
					</p>
					<h1 class="text-center mb-5">Recently Completed Projects</h1>
				</div>
				<div class="row mt-n2 wow fadeInUp" data-wow-delay="0.3s">
					<div class="col-12 text-center">
						<ul class="list-inline mb-5" id="portfolio-flters">
							<li class="mx-2 active" data-filter="*">All</li>
							<li class="mx-2" data-filter=".first">Web Design</li>
							<li class="mx-2" data-filter=".second">Graphic Design</li>
						</ul>
					</div>
				</div>
				<div class="row g-4 portfolio-container">
					<div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp"
						data-wow-delay="0.1s">
						<div class="rounded overflow-hidden">
							<div class="position-relative overflow-hidden">
								<img class="img-fluid w-100" src="resources/img/portfolio-1.jpg"
									alt="">
								<div class="portfolio-overlay">
									<a class="btn btn-square btn-outline-light mx-1"
										href="img/portfolio-1.jpg" data-lightbox="portfolio"><i
										class="fa fa-eye"></i></a> <a
										class="btn btn-square btn-outline-light mx-1" href=""><i
										class="fa fa-link"></i></a>
								</div>
							</div>
							<div class="bg-light p-4">
								<p class="text-primary fw-medium mb-2">UI / UX Design</p>
								<h5 class="lh-base mb-0">
									Digital Agency Website Design And Development</a>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 portfolio-item second wow fadeInUp"
						data-wow-delay="0.3s">
						<div class="rounded overflow-hidden">
							<div class="position-relative overflow-hidden">
								<img class="img-fluid w-100" src="resources/img/portfolio-2.jpg"
									alt="">
								<div class="portfolio-overlay">
									<a class="btn btn-square btn-outline-light mx-1"
										href="img/portfolio-2.jpg" data-lightbox="portfolio"><i
										class="fa fa-eye"></i></a> <a
										class="btn btn-square btn-outline-light mx-1" href=""><i
										class="fa fa-link"></i></a>
								</div>
							</div>
							<div class="bg-light p-4">
								<p class="text-primary fw-medium mb-2">UI / UX Design</p>
								<h5 class="lh-base mb-0">
									Digital Agency Website Design And Development</a>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp"
						data-wow-delay="0.5s">
						<div class="rounded overflow-hidden">
							<div class="position-relative overflow-hidden">
								<img class="img-fluid w-100" src="resources/img/portfolio-3.jpg"
									alt="">
								<div class="portfolio-overlay">
									<a class="btn btn-square btn-outline-light mx-1"
										href="img/portfolio-3.jpg" data-lightbox="portfolio"><i
										class="fa fa-eye"></i></a> <a
										class="btn btn-square btn-outline-light mx-1" href=""><i
										class="fa fa-link"></i></a>
								</div>
							</div>
							<div class="bg-light p-4">
								<p class="text-primary fw-medium mb-2">UI / UX Design</p>
								<h5 class="lh-base mb-0">
									Digital Agency Website Design And Development</a>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 portfolio-item second wow fadeInUp"
						data-wow-delay="0.1s">
						<div class="rounded overflow-hidden">
							<div class="position-relative overflow-hidden">
								<img class="img-fluid w-100" src="resources/img/portfolio-4.jpg"
									alt="">
								<div class="portfolio-overlay">
									<a class="btn btn-square btn-outline-light mx-1"
										href="img/portfolio-4.jpg" data-lightbox="portfolio"><i
										class="fa fa-eye"></i></a> <a
										class="btn btn-square btn-outline-light mx-1" href=""><i
										class="fa fa-link"></i></a>
								</div>
							</div>
							<div class="bg-light p-4">
								<p class="text-primary fw-medium mb-2">UI / UX Design</p>
								<h5 class="lh-base mb-0">
									Digital Agency Website Design And Development</a>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp"
						data-wow-delay="0.3s">
						<div class="rounded overflow-hidden">
							<div class="position-relative overflow-hidden">
								<img class="img-fluid w-100" src="resources/img/portfolio-5.jpg"
									alt="">
								<div class="portfolio-overlay">
									<a class="btn btn-square btn-outline-light mx-1"
										href="img/portfolio-5.jpg" data-lightbox="portfolio"><i
										class="fa fa-eye"></i></a> <a
										class="btn btn-square btn-outline-light mx-1" href=""><i
										class="fa fa-link"></i></a>
								</div>
							</div>
							<div class="bg-light p-4">
								<p class="text-primary fw-medium mb-2">UI / UX Design</p>
								<h5 class="lh-base mb-0">
									Digital Agency Website Design And Development</a>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 portfolio-item second wow fadeInUp"
						data-wow-delay="0.5s">
						<div class="rounded overflow-hidden">
							<div class="position-relative overflow-hidden">
								<img class="img-fluid w-100" src="resources/img/portfolio-6.jpg"
									alt="">
								<div class="portfolio-overlay">
									<a class="btn btn-square btn-outline-light mx-1"
										href="img/portfolio-6.jpg" data-lightbox="portfolio"><i
										class="fa fa-eye"></i></a> <a
										class="btn btn-square btn-outline-light mx-1" href=""><i
										class="fa fa-link"></i></a>
								</div>
							</div>
							<div class="bg-light p-4">
								<p class="text-primary fw-medium mb-2">UI / UX Design</p>
								<h5 class="lh-base mb-0">
									Digital Agency Website Design And Development</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Projects End -->


		<!-- Testimonial Start -->
		<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
			<div class="container py-5 px-lg-5">
				<p class="section-title text-secondary justify-content-center">
					<span></span>Testimonial<span></span>
				</p>
				<h1 class="text-center mb-5">What Say Our Clients!</h1>
				<div class="owl-carousel testimonial-carousel">
					<div class="testimonial-item bg-light rounded my-4">
						<p class="fs-5">
							<i class="fa fa-quote-left fa-4x text-primary mt-n4 me-3"></i>Diam
							dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat
							ipsum et lorem et sit sed stet lorem sit clita duo justo.
						</p>
						<div class="d-flex align-items-center">
							<img class="img-fluid flex-shrink-0 rounded-circle"
								src="resources/img/testimonial-1.jpg"
								style="width: 65px; height: 65px;">
							<div class="ps-4">
								<h5 class="mb-1">Client Name</h5>
								<span>Profession</span>
							</div>
						</div>
					</div>
					<div class="testimonial-item bg-light rounded my-4">
						<p class="fs-5">
							<i class="fa fa-quote-left fa-4x text-primary mt-n4 me-3"></i>Diam
							dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat
							ipsum et lorem et sit sed stet lorem sit clita duo justo.
						</p>
						<div class="d-flex align-items-center">
							<img class="img-fluid flex-shrink-0 rounded-circle"
								src="resources/img/testimonial-2.jpg"
								style="width: 65px; height: 65px;">
							<div class="ps-4">
								<h5 class="mb-1">Client Name</h5>
								<span>Profession</span>
							</div>
						</div>
					</div>
					<div class="testimonial-item bg-light rounded my-4">
						<p class="fs-5">
							<i class="fa fa-quote-left fa-4x text-primary mt-n4 me-3"></i>Diam
							dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat
							ipsum et lorem et sit sed stet lorem sit clita duo justo.
						</p>
						<div class="d-flex align-items-center">
							<img class="img-fluid flex-shrink-0 rounded-circle"
								src="resources/img/testimonial-3.jpg"
								style="width: 65px; height: 65px;">
							<div class="ps-4">
								<h5 class="mb-1">Client Name</h5>
								<span>Profession</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Testimonial End -->


		<!-- Team Start -->
		<div class="container-xxl py-5">
			<div class="container py-5 px-lg-5">
				<div class="wow fadeInUp" data-wow-delay="0.1s">
					<p class="section-title text-secondary justify-content-center">
						<span></span>Our Team<span></span>
					</p>
					<h1 class="text-center mb-5">Our Team Members</h1>
				</div>
				<div class="row g-4">
					<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
						<div class="team-item bg-light rounded">
							<div class="text-center border-bottom p-4">
								<img class="img-fluid rounded-circle mb-4"
									src="resources/img/team-1.jpg" alt="">
								<h5>John Doe</h5>
								<span>CEO & Founder</span>
							</div>
							<div class="d-flex justify-content-center p-4">
								<a class="btn btn-square mx-1" href=""><i
									class="fab fa-facebook-f"></i></a> <a class="btn btn-square mx-1"
									href=""><i class="fab fa-twitter"></i></a> <a
									class="btn btn-square mx-1" href=""><i
									class="fab fa-instagram"></i></a> <a class="btn btn-square mx-1"
									href=""><i class="fab fa-linkedin-in"></i></a>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
						<div class="team-item bg-light rounded">
							<div class="text-center border-bottom p-4">
								<img class="img-fluid rounded-circle mb-4"
									src="resources/img/team-2.jpg" alt="">
								<h5>Jessica Brown</h5>
								<span>Web Designer</span>
							</div>
							<div class="d-flex justify-content-center p-4">
								<a class="btn btn-square mx-1" href=""><i
									class="fab fa-facebook-f"></i></a> <a class="btn btn-square mx-1"
									href=""><i class="fab fa-twitter"></i></a> <a
									class="btn btn-square mx-1" href=""><i
									class="fab fa-instagram"></i></a> <a class="btn btn-square mx-1"
									href=""><i class="fab fa-linkedin-in"></i></a>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
						<div class="team-item bg-light rounded">
							<div class="text-center border-bottom p-4">
								<img class="img-fluid rounded-circle mb-4"
									src="resources/img/team-3.jpg" alt="">
								<h5>Tony Johnson</h5>
								<span>SEO Expert</span>
							</div>
							<div class="d-flex justify-content-center p-4">
								<a class="btn btn-square mx-1" href=""><i
									class="fab fa-facebook-f"></i></a> <a class="btn btn-square mx-1"
									href=""><i class="fab fa-twitter"></i></a> <a
									class="btn btn-square mx-1" href=""><i
									class="fab fa-instagram"></i></a> <a class="btn btn-square mx-1"
									href=""><i class="fab fa-linkedin-in"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Team End -->


		<!-- Footer Start -->
		<div class="container-fluid bg-primary text-light footer wow fadeIn"
			data-wow-delay="0.1s">
			<div class="container py-5 px-lg-5">
				<div class="row g-5">
					<div class="col-md-6 col-lg-3">
						<p class="section-title text-white h5 mb-4">
							Address<span></span>
						</p>
						<p>
							<i class="fa fa-map-marker-alt me-3"></i>123 Street, New York,
							USA
						</p>
						<p>
							<i class="fa fa-phone-alt me-3"></i>+012 345 67890
						</p>
						<p>
							<i class="fa fa-envelope me-3"></i>info@example.com
						</p>
						<div class="d-flex pt-2">
							<a class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-instagram"></i></a> <a
								class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-linkedin-in"></i></a>
						</div>
					</div>
					<div class="col-md-6 col-lg-3">
						<p class="section-title text-white h5 mb-4">
							Quick Link<span></span>
						</p>
						<a class="btn btn-link" href="">About Us</a> <a
							class="btn btn-link" href="">Contact Us</a> <a
							class="btn btn-link" href="">Privacy Policy</a> <a
							class="btn btn-link" href="">Terms & Condition</a> <a
							class="btn btn-link" href="">Career</a>
					</div>
					<div class="col-md-6 col-lg-3">
						<p class="section-title text-white h5 mb-4">
							Gallery<span></span>
						</p>
						<div class="row g-2">
							<div class="col-4">
								<img class="img-fluid" src="resources/img/portfolio-1.jpg"
									alt="Image">
							</div>
							<div class="col-4">
								<img class="img-fluid" src="resources/img/portfolio-2.jpg"
									alt="Image">
							</div>
							<div class="col-4">
								<img class="img-fluid" src="resources/img/portfolio-3.jpg"
									alt="Image">
							</div>
							<div class="col-4">
								<img class="img-fluid" src="resources/img/portfolio-4.jpg"
									alt="Image">
							</div>
							<div class="col-4">
								<img class="img-fluid" src="resources/img/portfolio-5.jpg"
									alt="Image">
							</div>
							<div class="col-4">
								<img class="img-fluid" src="resources/img/portfolio-6.jpg"
									alt="Image">
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3">
						<p class="section-title text-white h5 mb-4">
							Newsletter<span></span>
						</p>
						<p>Lorem ipsum dolor sit amet elit. Phasellus nec pretium mi.
							Curabitur facilisis ornare velit non vulpu</p>
						<div class="position-relative w-100 mt-3">
							<input class="form-control border-0 rounded-pill w-100 ps-4 pe-5"
								type="text" placeholder="Your Email" style="height: 48px;">
							<button type="button"
								class="btn shadow-none position-absolute top-0 end-0 mt-1 me-2">
								<i class="fa fa-paper-plane text-primary fs-4"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="container px-lg-5">
				<div class="copyright">
					<div class="row">
						<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
							&copy; <a class="border-bottom" href="#">Your Site Name</a>, All
							Right Reserved.

							<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
							Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML
								Codex</a><br>
							<br> Distributed By a <a class="border-bottom"
								href="https://themewagon.com" target="_blank">ThemeWagon</a>
						</div>
						<div class="col-md-6 text-center text-md-end">
							<div class="footer-menu">
								<a href="">Home</a> <a href="">Cookies</a> <a href="">Help</a> <a
									href="">FQAs</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer End -->


		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
	</div>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="resources/lib/wow/wow.min.js"></script>
	<script src="resources/lib/easing/easing.min.js"></script>
	<script src="resources/lib/waypoints/waypoints.min.js"></script>
	<script src="resources/lib/counterup/counterup.min.js"></script>
	<script src="resources/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="resources/lib/isotope/isotope.pkgd.min.js"></script>
	<script src="resources/lib/lightbox/js/lightbox.min.js"></script>

	<!-- Template Javascript -->
	<script src="resources/js/main.js"></script>
</body>
</html>