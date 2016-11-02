<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://unpkg.com/masonry-layout@4.0/dist/masonry.pkgd.js"></script>

<!-- Custom CSS -->
<link href='https://fonts.googleapis.com/css?family=Mate+SC'
	rel='stylesheet' type='text/css'>
<link href="css/style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>


	<!-- CLIENT LINKS -->
	<c:if test="${login != 'loggedIn' && vLogin != 'loggedIn'}">
		<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp"><img
					src="./images/logo.png" id="brandLogo"></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">

				<div class="nav navbar-nav navbar-right">
					<a href="signout.jsp" alt="Sign Out"><button type="submit"
							class="btn btn-default glyphicon glyphicon-log-out search">
							Login</button></a>
				</div>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid --> </nav>
	</c:if>



	<c:if test="${login == 'loggedIn'}">
		<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp"><img
					src="./images/logo.png" id="brandLogo"></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="budgetsurvey.jsp">Home <span
							class="sr-only">(current)</span></a></li>
					<li><a href="VendorMatchesServlet">Vendor Matches</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Categories <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="client.jsp">View All Vendors</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="Search?u=photographer">Photographer's</a></li>
							<li><a href="Search?u=videographer">Videoagrapher's</a></li>
							<li><a href="Search?u=photobooth">Photo Booths</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="Search?u=dj">DJ's</a></li>
							<li><a href="Search?u=band">Band's</a></li>
							<li><a href="Search?ceremonymusic">Ceremony Music</a></li>
							<li><a href="Search?u=entertainer">Entertainers</a></li>
							<li><a href="Search?u=lightanddecor">Lighting and Decor</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="Search?u=hairandmakeup">Hair and Make-up</a></li>
							<li><a href="Search?u=dressandattire">Dresses and Attire</a></li>
							<li><a href="Search?u=jewelry">Jewelry</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="Search?u=venues">Ceremony and Reception
									Venue</a></li>
							<li><a href="Search?u=officaant">Officiant's</a></li>
							<li><a href="Search?u=catering">Catering</a></li>
							<li><a href="Search?u=florist">Florist</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="Search?u=transportation">Transportation</a></li>
							<li><a href="Search?u=eventrentals">Event Rentals</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-left">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">My Account <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="editprofile.jsp">Edit Profile</a></li>
							<li><a href="budgetsurvey.jsp">Budget Survey</a></li>
							<li><a href="weddingchecklist.jsp">Wedding Checklist</a></li>
							<!-- 							<li><a href="favoritevendors.jsp">Favorite Vendors</a></li> -->
							<li role="separator" class="divider"></li>
						</ul></li>
				</ul>
				<form class="navbar-form navbar-right" action="Search" method="get"
					role="search">
					<div class="form-group">
						<input type="text" class="form-control" name="searchBar"
							id="search" placeholder="Search">
					</div>
					<button type="submit"
						class="btn btn-default glyphicon glyphicon-search"></button>
				</form>


				<!-- /.navbar-collapse -->
				<div id="logout">
					<a href="signout.jsp" alt="Sign Out"><button type="submit"
							class="btn btn-default glyphicon glyphicon-log-out search logOut">
							Log-Out</button></a>
				</div>
			</div>
		</div>
		<!-- /.container-fluid --> </nav>
	</c:if>

	<!-- VENDOR LINKS -->



	<c:if test="${vLogin == 'loggedIn'}">
		<!-- Navigation -->
		<c:set var="login" value="" />


		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container" id="joinHeader">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav" id="header">
					<li><a href="vendorprofile.jsp" id="headerLinks">Profile</a></li>
					<li><a href="signout.jsp" id="headerLinks">Sign-out</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container --> </nav>
	</c:if>

	<hr>


	<!-- 	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>