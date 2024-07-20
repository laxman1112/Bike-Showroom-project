<%@page import="com.code.entity.Accesseries"%>
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
			<h2 align="center" style="color: purple;">View Available Bike
				Details</h2>
			<hr />

			<%
				Connection con=DbConnection.getConnection();
					PreparedStatement ps =con.prepareStatement("SELECT * FROM `bike_details` where status='Available'");
					ResultSet rs=ps.executeQuery();
					GlobalFunction gf=new GlobalFunction();
					int i=0;
					while(rs.next())
					{
					++i;
					String b_id=rs.getString("b_id");
					HashMap<String,String> bikeDetails=gf.getBikeDetails(b_id);
			%>
			<div class="col-lg-6">
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
								<td><h6 style="color: purple;">Accessories Details</h6></td>
								<%
									if(session.getAttribute("u_type").toString().equals("Sales"))
													{
								%>
								<td><marquee>
										<a href="staffAddAccessories.jsp?bid=<%=b_id%>">Add /
											Remove Accessories </a>
									</marquee></td>
								<%
									}
								%>
							</tr>

						</table>
						<table class="table">
							<tr>
								<th>Sr.No</th>
								<th>Accessories</th>
								<th>Amount</th>
								<th>Added Date</th>
							</tr>
							<%
							ArrayList<Accesseries> accessoriesDetails=gf.getListOfAccessoriesByBikeId(b_id,"Available");
							int i0=0;
							for(Accesseries accessories:accessoriesDetails)
							{
								++i0;
								String staff_id=accessories.getAdded_by();
								HashMap<String,String> staffDetails=gf.getStaffDetails(staff_id);
							%>
							<tr>
								<td><%=i0%></td>
								<td><%=accessories.getAccName()%></td>
								<td><%=accessories.getAmount()%></td>
								<td><%=accessories.getAdded_by()%></td>
							</tr>
							<%
								}
												if(i0<=0)
												{
							%>
							<tr>
								<td colspan="4" style="color: red;">No Accessories
									Available</td>
							</tr>
							<%
								}
							%>
						</table>



						<hr style="background-color: black;" />
						<table class="table">
							<tr>
								<td><h6 style="color: purple;">Insurance Details</h6></td>
								<%
									if(session.getAttribute("u_type").toString().equals("Insurance"))
													{
								%>
								<td><marquee>
										<a href="staffAddInsurance.jsp?bid=<%=b_id%>">Add / Remove
											Insurance </a>
									</marquee></td>
								<%
									}
								%>

							</tr>

						</table>
						<table class="table">
							<tr>
								<th>Sr.No</th>
								<th>Insurance Details</th>
								<th>Services</th>
								<th>Duration/Amount</th>
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
								<td><%=insurance.getInsuranceName()%><br /> <%=insurance.getInsProvider()%><br />
								</td>
								<td><%=insurance.getInsuranceIncluded()%></td>
								<td><%=insurance.getDuration()%><br /> <%=insurance.getAmount()%><br /></td>
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

						<hr style="background-color: black;" />


						<table class="table">
							<tr>
								<td><h6 style="color: purple;">Finance Details</h6></td>
								<%
									if(session.getAttribute("u_type").toString().equals("Finance"))
													{
								%>
								<td><marquee>
										<a href="staffAddFinance.jsp?bid=<%=b_id%>">Add / Remove
											Finance</a>
									</marquee></td>
								<%
									}
								%>

							</tr>

						</table>
						<table class="table">
							<tr>
								<th>Sr.No</th>
								<th>Finanace Duration</th>
								<th>Rate of Interest</th>
								<th>Contact Details</th>
							</tr>
							<%
								ArrayList<Finance> financeDetailsList=gf.getListOfFinanseByBikeId(b_id,"Available");
								int i1=0;
								for(Finance finance :financeDetailsList)
								{
									++i1;
									String fs_Id=finance.getAddedBy();
									HashMap<String,String> fSDetails=gf.getStaffDetails(fs_Id);
							%>
							<tr>
								<td><%=i1%></td>
								<td><%=finance.getFinanceDuration()%></td>
								<td><%=finance.getRateOfInterest()%></td>
								<td><%=fSDetails.get("staff_name")%><br /> Mb.<%=fSDetails.get("mobile")%><br />
								</td>
							</tr>
							<%
							}
							if(i1<=0)
							{
							%>
							<tr>
								<td colspan="4" style="color: red;">No Finnce Available</td>
							</tr>
							<%
								}
							%>
						</table>
					</div>
				</div>
			</div>
			<%
				}
			%>
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