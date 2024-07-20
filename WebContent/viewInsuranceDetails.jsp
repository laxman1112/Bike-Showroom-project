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

	<div class="row" style="margin-right: 5%; margin-top: 10%;">
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
			<h1 style="color: purple;" align="center">View Insurance Details</h1>
			<div class="col-lg-12">
				<hr />
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Sr.No</th>
								<th>Vehicle Details</th>
								<th>Insurance Details</th>
								<th>Services</th>
								<th>Duration/Amount</th>
								<th>Status</th>
								<th>Update</th>
							</tr>
						</thead>
						<%
							Connection con=DbConnection.getConnection();
							PreparedStatement ps =con.prepareStatement("SELECT * FROM `insurance_details`");
							ResultSet rs=ps.executeQuery();
							int i=0;
							GlobalFunction gf=new GlobalFunction();
							while(rs.next())
							{
							++i;
							String i_id=rs.getString("i_id");
							String bike_id=rs.getString("bike_id");
							HashMap<String,String> bikeDetails=gf.getBikeDetails(bike_id);
							HashMap<String,String> insuranceDetails=gf.getInsutanceDetails(i_id);
						%>

						<tbody>
							<tr>
								<td><%=i%></td>
								<td>Bike Name: <%=bikeDetails.get("bike_name")%><br />
									Bike Company: <%=bikeDetails.get("bike_company")%><br />
									Model-Year: <%=bikeDetails.get("model")%>-<%=bikeDetails.get("b_year")%><br />
									Bike Price: <%=bikeDetails.get("bike_price")%>/-<br /></td>


								<td><%=insuranceDetails.get("insurance_name")%><br />[<%=insuranceDetails.get("ins_provider")%>]
								</td>
								<td><%=insuranceDetails.get("insurance_included")%></td>
								<td>Duration: <%=insuranceDetails.get("duration")%><br />
									Rs. <%=insuranceDetails.get("amount")%>/-
								</td>
								<td><%=insuranceDetails.get("status")%><br /></td>

								<td>
									<%
										if(insuranceDetails.get("status").equals("Available"))
																					{
									%> <a style="color: red;" href="UpdateInsurance?id=<%=i_id%>">Remove</a>
									<%
										}
									%>
								</td>

							</tr>
						</tbody>
						<%
							}
						%>

					</table>
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