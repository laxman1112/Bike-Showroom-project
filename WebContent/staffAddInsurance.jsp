<%@page import="com.code.entity.Finance"%>
<%@page import="com.code.entity.Insurance"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.code.utils.GlobalFunction"%>
<%@page import="jdk.nashorn.internal.objects.Global"%>
<%@page import="com.code.conn.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
<style>
/* CSS style for adding border to a div */
.bordered-div {
	border: 2px solid black;
	/* You can adjust the width and color of the border */
	padding: 10px; /* Optional: Add padding to the div */
}
</style>

<script type="text/javascript">
	var col = new String();
	var x = 1;
	var y;

	function blink() {
		if (x % 2) {
			col = "rgb(0,0,255)";
		} else {
			col = "rgb(255,255,255)";
		}

		aF.style.color = col;
		x++;
		if (x > 2) {
			x = 1
		}
		;
		setTimeout("blink()", 500);
	}
</script>

<body onload="blink()">

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
	<div class="row" style="margin-right: 5%; margin-top: 8%;">
		<div class="col-lg-12" align="right">
			<h6>
				Welcome:
				<%=session.getAttribute("staff_name").toString()%>&nbsp;[<%=session.getAttribute("u_type").toString()%>]
			</h6>
		</div>
	</div>
	<hr />
	<div class="container" style="margin-top: 0%;">
		<div class="row">
			<h2 align="center" style="color: purple;">Add /Remove Insurance
				Details</h2>
			<hr />

			<%
				/* 	Connection con=DbConnection.getConnection();
								PreparedStatement ps =con.prepareStatement("SELECT * FROM `bike_details` where status='Available'");
								ResultSet rs=ps.executeQuery();
								
								int i=0;
								while(rs.next())
								{
								++i; */
						//		String b_id=rs.getString("b_id");
					GlobalFunction gf=new GlobalFunction();
					String b_id=request.getParameter("bid");
					HashMap<String,String> bikeDetails=gf.getBikeDetails(b_id);
			%>
			<div class="col-lg-7">
				<div class="bordered-div">
					<div class="row">
						<div class="col-4">
							<img alt="" src="bike_photos/<%=bikeDetails.get("bike_photo")%>"><br />
						</div>
						<div class="col-8">
							<img alt="" src="bike_photos/<%=bikeDetails.get("bike_photo")%>"><br />
						</div>
						<h6>
							<u>Comapany:</u>
							<%=bikeDetails.get("bike_company")%></h6>
						<h6 style="text-align: justify;">
							<u>About Bike:</u>
							<%=bikeDetails.get("about_bike")%></h6>
						<h6>
							<u>Model:</u>
							<%=bikeDetails.get("model")%>-<%=bikeDetails.get("b_year")%></h6>
						<h6>
							<u>Colors:</u>
							<%=bikeDetails.get("colors")%></h6>
						<h6>
							<u>Status:</u>
							<%=bikeDetails.get("status")%></h6>
						<h6 style="color: red;">
							<u>Price:</u>
							<%=bikeDetails.get("bike_price")%></h6>
						<hr style="background-color: black;" />
						<table class="table">
							<tr>
								<td><h6 style="color: purple;">Insurance Details</h6></td>
							</tr>
						</table>
						<table class="table">
							<tr>
								<th>Sr.No</th>
								<th>Insurance Details</th>
								<th>Services</th>
								<th>Duration/Amount</th>
								<th></th>
							</tr>
							<%
								ArrayList<Insurance> insuranceDetailsList=gf.getListOfInsuranceByBikeId(b_id,"Available");
								int ii=0;
								for(Insurance insurance :insuranceDetailsList)
								{
									++ii;
							%>
							<tr>
								<td><%=ii%></td>
								<td><%=insurance.getInsuranceName()%><br /> [<%=insurance.getInsProvider()%>]<br />
								</td>
								<td><%=insurance.getInsuranceIncluded()%></td>
								<td><%=insurance.getDuration()%><br />Rs.<%=insurance.getAmount()%>/-<br /></td>
								<td><a
									href="AddInsurancePlan?id=<%=insurance.getiId()%>&bid=<%=insurance.getBikeId()%>">Remove</a></td>
							</tr>
							<%
								}
																						if(ii<=0)
																						{
							%>
							<tr>
								<td colspan="4" style="color: red;">No Insurance Plan
									Available</td>
							</tr>
							<%
								}
							%>
						</table>
					</div>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="bordered-div">
					<h2 align="center">Insurance Details</h2>
					<hr />
					<div class="table-responsive">
						<form action="AddInsurancePlan" method="post">
							<table class="table">
								<tr>
									<th>Insurance Name</th>
									<td><input type="hidden" name="bike_id"
										value="<%=request.getParameter("bid")%>"> <input
										type="text" class="form-control" id="insurance_name"
										name="insurance_name" placeholder="Enter Insurance Name">
								</tr>
								<tr>
									<th>Insurance Included</th>
									<td><textarea name="insurance_included" required rows=""
											cols="" class="form-control"
											placeholder="Enter Insurance Included"></textarea>
								</tr>
								<tr>
									<th>Insurance Provider</th>
									<td><input type="text" class="form-control"
										id="ins_provider" name="ins_provider"
										placeholder="Company Name Or Third Party Name">
								</tr>
								<tr>
									<th>Duration</th>
									<td><input type="text" class="form-control" id="duration"
										name="duration" placeholder="Enter Duration">
								</tr>
								<tr>
									<th>Amount</th>
									<td><input type="text" class="form-control" id="amount"
										name="amount" placeholder="Enter Amount">
								</tr>
								<tr>
									<th></th>
									<td><button type="submit" class="btn btn-success">Add
											New Insurance</button></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
			<%-- <%
				}
			%> --%>
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