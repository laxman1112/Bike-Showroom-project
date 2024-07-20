<style>
.submenu {
	display: none;
	position: absolute;
	background-color: #fff;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.submenu li {
	padding: 10px 20px;
}

.has-submenu:hover .submenu {
	display: block;
}
</style>

<%
	String u_type = session.getAttribute("u_type").toString();
	if (u_type.equals("Geust")) {
%>
<div class="col-3">
	<nav class="main-nav">
		<a href="index.jsp" class="logo"> <img src="img/l11.png" alt=""
			style="width: 100%;">
		</a>

		<!-- ***** Menu End ***** -->
	</nav>
</div>
<div class="col-9">
	<nav class="main-nav">
		<ul class="nav">
			<li class="scroll-to-section"><a href="index.jsp">Home</a></li>
			<li class="scroll-to-section"><a href="adminLogin.jsp">Admin</a></li>

			<li class="scroll-to-section has-submenu"><a href="#portfolio">Customer</a>
				<ul class="submenu">
					<li><a href="customerLogin.jsp">Login</a></li>
					<li><a href="customerRegistration.jsp">Registration</a></li>
					<li></li>
				</ul></li>
			<li class="scroll-to-section"><a href="employeeLogin.jsp">Employee
					Login</a></li>
			<!-- 			<li class="scroll-to-section"><a href="contactUs.jsp">ContactUS</a></li>
 -->
			<li></li>
		</ul>
		<a class='menu-trigger'> <span>Menu</span>
		</a>
	</nav>
</div>
<%
	} else if (u_type.equals("Admin")) {
%>
<div class="col-3">
	<nav class="main-nav">
		<a href="index.jsp" class="logo"> <img src="img/l11.png" alt=""
			style="width: 100%;">
		</a>

		<!-- ***** Menu End ***** -->
	</nav>
</div>
<div class="col-9">
	<nav class="main-nav">
		<ul class="nav">
			<li class="scroll-to-section"><a href="adminHome.jsp">Home</a></li>

			<li class="scroll-to-section has-submenu"><a href="#portfolio">Staff</a>
				<ul class="submenu">
					<li><a href="staffRegistration.jsp">Create Account</a></li>
					<li><a href="adminViewStaff.jsp">View Staff</a></li>
					<li></li>
				</ul></li>
			<li class="scroll-to-section has-submenu"><a href="#portfolio">Bikes</a>
				<ul class="submenu">
					<li><a href="adminAddBike.jsp">Add New Bike</a></li>
					<li><a href="adminViewBikes.jsp">View All Bikes</a></li>
					<li></li>
				</ul></li>

			<li class="scroll-to-section"><a href="viewEnquiry.jsp">New
					Enquiry</a></li>
			<li class="scroll-to-section"><a href="viewAllCustomers.jsp">Customers</a></li>
			<li class="scroll-to-section"><a href="Logout">Logout</a></li>
			<li></li>
		</ul>
		<a class='menu-trigger'> <span>Menu</span>
		</a>
	</nav>
</div>
<%
	} else if (u_type.equals("Customer")) {
%>
<div class="col-3">
	<nav class="main-nav">
		<a href="index.jsp" class="logo"> <img src="img/l11.png" alt=""
			style="width: 100%;">
		</a>

		<!-- ***** Menu End ***** -->
	</nav>
</div>
<div class="col-9">
	<nav class="main-nav">
		<ul class="nav">
			<li class="scroll-to-section"><a href="customerHome.jsp">Home</a></li>
			<li class="scroll-to-section"><a href="custViewBikes.jsp">View
					Bikes</a></li>
			<li class="scroll-to-section"><a href="custViewCartDetails.jsp">Cart
					Bikes</a></li>
			<li class="scroll-to-section"><a
				href="custViewTestRideReqDetails.jsp">Test Ride</a></li>

			<li class="scroll-to-section has-submenu"><a href="#portfolio">Servicing</a>
				<ul class="submenu">
					<li><a href="servicingRequest.jsp">Send Request</a></li>
					<li><a href="custServResponseDetails.jsp">View Response</a></li>
					<li></li>
				</ul></li>
			<li class="scroll-to-section"><a href="Logout">Logout</a></li>
			<li></li>
		</ul>
		<a class='menu-trigger'> <span>Menu</span>
		</a>
	</nav>
</div>
<%
	} else if (u_type.equals("Insurance")) {
%>
<div class="col-3">
	<nav class="main-nav">
		<a href="index.jsp" class="logo"> <img src="img/l11.png" alt=""
			style="width: 100%;">
		</a>

		<!-- ***** Menu End ***** -->
	</nav>
</div>
<div class="col-9">
	<nav class="main-nav">
		<ul class="nav">
			<li class="scroll-to-section"><a href="staffHome.jsp">Home</a></li>
			<li class="scroll-to-section"><a href="staffViewBikes.jsp">View
					Bikes</a></li>
			<li class="scroll-to-section"><a href="viewInsuranceDetails.jsp">View
					Insurance</a></li>
			<li class="scroll-to-section"><a href="viewAllCustomers.jsp">Customers</a></li>
			<li class="scroll-to-section"><a href="Logout">Logout</a></li>
			<li></li>
		</ul>
		<a class='menu-trigger'> <span>Menu</span>
		</a>
	</nav>
</div>
<%
	} else if (u_type.equals("Finance")) {
%>
<div class="col-3">
	<nav class="main-nav">
		<a href="index.jsp" class="logo"> <img src="img/l11.png" alt=""
			style="width: 100%;">
		</a>

		<!-- ***** Menu End ***** -->
	</nav>
</div>
<div class="col-9">
	<nav class="main-nav">
		<ul class="nav">
			<li class="scroll-to-section"><a href="staffHome.jsp">Home</a></li>
			<li class="scroll-to-section"><a href="staffViewBikes.jsp">View
					Bikes</a></li>
			<li class="scroll-to-section"><a href="viewFinanceDetails.jsp">View
					Finance</a></li>
			<li class="scroll-to-section"><a href="viewAllCustomers.jsp">Customers</a></li>
			<li class="scroll-to-section"><a href="Logout">Logout</a></li>
			<li></li>
		</ul>
		<a class='menu-trigger'> <span>Menu</span>
		</a>
	</nav>
</div>
<%
}
else if (u_type.equals("Sales"))
{
	%>
<div class="col-3">
	<nav class="main-nav">
		<a href="index.jsp" class="logo"> <img src="img/l11.png" alt=""
			style="width: 100%;">
		</a>

		<!-- ***** Menu End ***** -->
	</nav>
</div>
<div class="col-9">
	<nav class="main-nav">
		<ul class="nav">
			<li class="scroll-to-section"><a href="staffHome.jsp">Home</a></li>
			<li class="scroll-to-section"><a href="staffViewBikes.jsp">View
					Bikes</a></li>

			<li class="scroll-to-section"><a
				href="staffViewTestRideReqDetails.jsp">View Riding Request</a></li>
			<li class="scroll-to-section"><a href="viewAllCustomers.jsp">Customers</a></li>
			<li class="scroll-to-section"><a href="Logout">Logout</a></li>
			<li></li>
		</ul>
		<a class='menu-trigger'> <span>Menu</span>
		</a>
	</nav>
</div>
<%}
else if (u_type.equals("Technician"))
{
	%>
<div class="col-3">
	<nav class="main-nav">
		<a href="index.jsp" class="logo"> <img src="img/l11.png" alt=""
			style="width: 100%;">
		</a>
		<!-- ***** Menu End ***** -->
	</nav>
</div>
<div class="col-9">
	<nav class="main-nav">
		<ul class="nav">
			<li class="scroll-to-section"><a href="staffHome.jsp">Home</a></li>
			<li class="scroll-to-section"><a href="staffViewBikes.jsp">View
					Bikes</a></li>

			<li class="scroll-to-section"><a
				href="staffViewServicingReq.jsp">View Servicing Request</a></li>

			<li class="scroll-to-section"><a href="viewAllCustomers.jsp">Customers</a></li>
			<li class="scroll-to-section"><a href="Logout">Logout</a></li>
			<li></li>
		</ul>
		<a class='menu-trigger'> <span>Menu</span>
		</a>
	</nav>
</div>
<%}
	
%>