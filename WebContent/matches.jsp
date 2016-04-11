<!DOCTYPE html>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

<head>
<script src="js/bootstrap.js"></script>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Yknot Studios">

<title>Your Matches</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href='https://fonts.googleapis.com/css?family=Mate+SC'
	rel='stylesheet' type='text/css'>
<link href="css/style.css" rel="stylesheet">




</head>

<body>
	<c:if test="${sessionScope.login != 'loggedIn' }">
		<c:redirect url="login.jsp" />
	</c:if>


	<%@include file="header.jsp"%>


	<c:if test="${empty matchedVendors}">

		<!-- Page Content -->
		<div class="container-fluid">
			<h1 class="" id="join">Your Matches based on your budget.</h1>
			<h5>
				We are sorry. We currently do not have any vendors that match your
				budget come back later or <a href="budgetsurvey.jsp"> try
					raising your budget a little if possible. </a>
			</h5>
			<div class="col-lg-12 ">
				<div class="row">


					<div class="row"></div>
				</div>
			</div>
		</div>
	</c:if>


	<c:if test="${matchedVendors != null}">

		<div class="container">
			<div class="row">
				<c:set var="colcount" value="0" scope="page" />



				<c:forEach items="${matchedVendors}" var="vendors">

					<c:if test="${colcount == '2'}">
						<div class="row">
					</c:if>
					<div class="col-xs-10  col-sm-6 col-md-4 vendorFeed">

						<div class="thumbnail">
							<a href="profile?vendor=${vendors.businessName}"> <img
								src="${vendors.profileImg }" alt="${vendors.businessName }"
								id="">
							</a>
							<div class="caption">
								<h3 class="businessName">${vendors.businessName}</h3>
								<h4>${vendors.category}</h4>
								<div id="zipCode">
									<h6>City: ${vendors.city}, ${vendors.state}</h6>
									<h6>Starting Package: $${vendors.startingPackage}</h6>
								</div>
								<p>
									<a href=" ${vendors.businessWebsite}"
										class="btn btn-default glyphicon glyphicon-globe"
										role="button" alt="Website"></a> <a
										href="mailto:${vendors.businessEmail}"
										class="btn btn-default glyphicon glyphicon-envelope"
										role="button" alt="Email"></a> <a href="#"
										class="btn btn-default glyphicon glyphicon-heart-empty"
										role="button"></a>
								</p>
							</div>
						</div>
					</div>
					<c:if test="${colcount == '2'}">
			</div>
	</c:if>
	<c:set var="colcount" value="${colcount + 1}" scope="page" />

	</c:forEach>
	</div>
	</div>
	<div class="row pageNumber">
		<nav>
			<ul class="pagination">
				<li><a href="#" aria-label="Previous"> <span
						aria-hidden="true">&laquo;</span>
				</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>
	</c:if>

	<!-- /.container -->

	<!-- Footer -->
	<%@include file="footer.jsp"%>



</body>

</html>