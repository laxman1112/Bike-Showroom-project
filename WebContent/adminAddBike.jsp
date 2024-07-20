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

	<div class="container" style="margin-top: 8%;">
		<div class="row">

			<div class="col-lg-6">
				<h2 align="center" style="color: purple;">Add New Bike Details</h2>
				<hr />
				<div class="table-responsive">
					<form action="AddBikeDetails" method="post"
						enctype="multipart/form-data">
						<table class="table">
							<tr>
								<th>Bike Name</th>
								<td><input type="text" class="form-control"
									name="bike_name" placeholder="Enter Bike Name"></td>
							</tr>
							<tr>
								<th>Bike Company</th>
								<td><input type="text" class="form-control"
									name="bike_company" placeholder="Enter Bike Company"></td>
							</tr>
							<tr>
								<th>About Bike</th>
								<td><textarea class="form-control" name="about_bike"
										rows="3" placeholder="Enter About Bike"></textarea></td>
							</tr>
							<tr>
								<th>Model</th>
								<td><input type="text" class="form-control" name="model"
									placeholder="Enter Model"></td>
							</tr>
							<tr>
								<th>Bike Price</th>
								<td><input type="text" class="form-control"
									name="bike_price" placeholder="Enter Bike Price"></td>
							</tr>
							<tr>
								<th>Year</th>
								<td><input type="text" class="form-control" name="b_year"
									placeholder="Enter Year"></td>
							</tr>
							<tr>
								<th>Colors</th>
								<td><input type="text" class="form-control" name="colors"
									placeholder="Enter Colors"></td>
							</tr>
							<tr>
								<th>Fuel Type</th>
								<td><select class="form-control" name="fuel_type">
										<option value="Petrol">Petrol</option>
										<option value="Diesel">Diesel</option>
										<option value="Electric">Electric</option>
								</select></td>
							</tr>
							<tr>
								<th>Bike Photo</th>
								<td><input type="file" name="bike_photo"
									class="form-control" required></td>
							</tr>
							<tr>
								<th></th>
								<td><button type="submit" class="btn btn-success">Add
										New Bike</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="col-lg-6">
				<img alt="" src="img/123r.png">
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