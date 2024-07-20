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
				<%=session.getAttribute("c_name").toString()%>&nbsp;[<%=session.getAttribute("u_type").toString()%>]
			</h6>
		</div>
	</div>
	<hr />


	<div class="container" style="margin-top: 0%;">
		<div class="row">
			<h1 style="color: purple;" align="center">Customer Servicing
				Request Response</h1>
			<div class="col-lg-12">
				<hr />
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Sr.No</th>
								<th>Appointment Date</th>
								<th>Bike Number</th>
								<th>Vehicle Issue</th>
								<th>Technician Details</th>
								<th>Request Date</th>
								<th>Status</th>
							</tr>
						</thead>
						<%
							String c_id = session.getAttribute("c_id").toString();

							Connection con = DbConnection.getConnection();
							PreparedStatement ps = con.prepareStatement("SELECT * FROM `servicing_request` where cust_id='"+ c_id + "'");
							GlobalFunction gf=new GlobalFunction();
							ResultSet rs = ps.executeQuery();
							int i = 0;
							while (rs.next())
							{
								++i;
								String staff_id= rs.getString("staff_id");
								HashMap<String,String> staffDetails=gf.getStaffDetails(staff_id);
								
						%>

						<tbody>
							<tr>
								<td><%=i %></td>
								<td><%=rs.getString("app_date") %></td>
								<td><%=rs.getString("bike_number") %></td>
								<td><%=rs.getString("vehicle_issue") %></td>
								<td>
									<%
								if(!staff_id.equals("NA"))
								{
								%> Name: <%=staffDetails.get("staff_name") %><br /> Mb.<%=staffDetails.get("mobile") %><br />
									<%} %>
								</td>
								<td><%=rs.getString("req_cdate") %></td>
								<td><%=rs.getString("status") %></td>

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