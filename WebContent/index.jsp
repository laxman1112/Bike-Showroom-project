<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<title><jsp:include page="projectTitle.jsp" /></title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">



<!-- Additional CSS Files -->
<link rel="stylesheet" href="assets/css/fontawesome.css">
<link rel="stylesheet" href="assets/css/templatemo-digimedia-v2.css">
<link rel="stylesheet" href="assets/css/animated.css">
<link rel="stylesheet" href="assets/css/owl.css">

</head>
<%
session.setAttribute("u_type", "Geust");
%>
<body>

	<!-- ***** Preloader Start ***** -->
	<div id="js-preloader" class="js-preloader">
		<div class="preloader-inner">
			<span class="dot"></span>
			<div class="dots">
				<span></span> <span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- ***** Preloader End ***** -->

	<!-- Pre-header Starts -->
	<div class="pre-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-sm-8 col-7">
					<ul class="info">
						<li><a href="#"><i class="fa fa-envelope"></i>contact@bikeshowroom.com</a></li>
						<li><a href="#"><i class="fa fa-phone"></i>+91 8275329929</a></li>
					</ul>
				</div>
				<div class="col-lg-4 col-sm-4 col-5">
					<ul class="social-media">
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-behance"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- Pre-header End -->

	<!-- ***** Header Area Start ***** -->
	<header class="header-area header-sticky wow slideInDown"
		data-wow-duration="0.75s" data-wow-delay="0s">
	<div class="container">
		<div class="row">
			<jsp:include page="header/headerMenu.jsp" />
		</div>
	</div>
	</header>
	<!-- ***** Header Area End ***** -->

	<div class="main-banner wow fadeIn" id="top" data-wow-duration="1s"
		data-wow-delay="0.5s">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="row">
						<div class="col-lg-6 align-self-center">
							<div class="left-content show-up header-text wow fadeInLeft"
								data-wow-duration="1s" data-wow-delay="1s">
								<div class="row">
									<div class="col-lg-12">
										<h4>Bike Showroom Application</h4>
										<p>We Provide best serirvicing to our customer those want
											to buy new Bikes, we give first priority to our customer
											suppports. Thank you.</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="right-image wow fadeInRight" data-wow-duration="1s"
								data-wow-delay="0.5s">
								<img src="img/111.jpg" alt="">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="portfolio" class="our-portfolio section">
		<div class="container">
			<div class="row">
				<div class="col-lg-5">
					<div class="section-heading wow fadeInLeft" data-wow-duration="1s"
						data-wow-delay="0.3s">
						<h6>Our Portofolio</h6>
						<h4>
							See Our Recent <em>Projects</em>
						</h4>
						<div class="line-dec"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid wow fadeIn" data-wow-duration="1s"
			data-wow-delay="0.7s">
			<div class="row">
				<div class="col-lg-12">
					<div class="loop owl-carousel">
						<div class="item">
							<a href="#">
								<div class="portfolio-item">
									<div class="thumb">
										<img src="assets/images/portfolio-01.jpg" alt="">
									</div>
									<div class="down-content">
										<h4>Website Builder</h4>
										<span>Marketing</span>
									</div>
								</div>
							</a>
						</div>
						<div class="item">
							<a href="#">
								<div class="portfolio-item">
									<div class="thumb">
										<img src="assets/images/portfolio-01.jpg" alt="">
									</div>
									<div class="down-content">
										<h4>Website Builder</h4>
										<span>Marketing</span>
									</div>
								</div>
							</a>
						</div>
						<div class="item">
							<a href="#">
								<div class="portfolio-item">
									<div class="thumb">
										<img src="assets/images/portfolio-02.jpg" alt="">
									</div>
									<div class="down-content">
										<h4>Website Builder</h4>
										<span>Marketing</span>
									</div>
								</div>
							</a>
						</div>
						<div class="item">
							<a href="#">
								<div class="portfolio-item">
									<div class="thumb">
										<img src="assets/images/portfolio-03.jpg" alt="">
									</div>
									<div class="down-content">
										<h4>Website Builder</h4>
										<span>Marketing</span>
									</div>
								</div>
							</a>
						</div>
						<div class="item">
							<a href="#">
								<div class="portfolio-item">
									<div class="thumb">
										<img src="assets/images/portfolio-04.jpg" alt="">
									</div>
									<div class="down-content">
										<h4>Website Builder</h4>
										<span>Marketing</span>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="contact" class="contact-us section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="section-heading wow fadeIn" data-wow-duration="1s"
						data-wow-delay="0.5s">
						<h6>Contact Us</h6>
						<h4>
							Get In Touch With Us <em>Now</em>
						</h4>
						<div class="line-dec"></div>
					</div>
				</div>
				<div class="col-lg-12 wow fadeInUp" data-wow-duration="0.5s"
					data-wow-delay="0.25s">
					<form id="contact" action="" method="post">
						<div class="row">
							<div class="col-lg-12">
								<div class="contact-dec">
									<img src="assets/images/contact-dec-v2.png" alt="">
								</div>
							</div>
							<div class="col-lg-5">
								<div id="map">
									<iframe
										src="https://maps.google.com/maps?q=Av.+L%C3%BAcio+Costa,+Rio+de+Janeiro+-+RJ,+Brazil&t=&z=13&ie=UTF8&iwloc=&output=embed"
										width="100%" height="636px" frameborder="0" style="border: 0"
										allowfullscreen></iframe>
								</div>
							</div>
							<div class="col-lg-7">
								<div class="fill-form">
									<div class="row">
										<div class="col-lg-4">
											<div class="info-post">
												<div class="icon">
													<img src="assets/images/phone-icon.png" alt=""> <a
														href="#">010-020-0340</a>
												</div>
											</div>
										</div>
										<div class="col-lg-4">
											<div class="info-post">
												<div class="icon">
													<img src="assets/images/email-icon.png" alt=""> <a
														href="#">our@email.com</a>
												</div>
											</div>
										</div>
										<div class="col-lg-4">
											<div class="info-post">
												<div class="icon">
													<img src="assets/images/location-icon.png" alt=""> <a
														href="#">123 Rio de Janeiro</a>
												</div>
											</div>
										</div>
										<div class="col-lg-6">
											<fieldset>
												<input type="name" name="name" id="name" placeholder="Name"
													autocomplete="on" required>
											</fieldset>
											<fieldset>
												<input type="text" name="email" id="email"
													pattern="[^ @]*@[^ @]*" placeholder="Your Email"
													required="">
											</fieldset>
											<fieldset>
												<input type="subject" name="subject" id="subject"
													placeholder="Subject" autocomplete="on">
											</fieldset>
										</div>
										<div class="col-lg-6">
											<fieldset>
												<textarea name="message" type="text" class="form-control"
													id="message" placeholder="Message" required=""></textarea>
											</fieldset>
										</div>
										<div class="col-lg-12">
											<fieldset>
												<button type="submit" id="form-submit" class="main-button ">Send
													Message Now</button>
											</fieldset>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<footer>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<p>
					Copyright © 2024
					<jsp:include page="projectTitle.jsp" />. <br>Design: <a
						href="https://templatemo.com" target="_parent"
						title="free css templates">SGMS Infotech LLP (Mb. 8275329929)</a>
				</p>
			</div>
		</div>
	</div>
	</footer>


	<!-- Scripts -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/owl-carousel.js"></script>
	<script src="assets/js/animation.js"></script>
	<script src="assets/js/imagesloaded.js"></script>
	<script src="assets/js/custom.js"></script>

</body>
</html>