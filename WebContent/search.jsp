<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>

<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Yknot Studios">

<title>Yknot Planning: Search</title>

<!-- Bootstrap Core CSS -->
<link href="./css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="font-awesome-4.1.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<link href='https://fonts.googleapis.com/css?family=Mate+SC'
	rel='stylesheet' type='text/css'>
<link href="./css/style.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<c:if test="${sessionScope.login != 'loggedIn' }">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="header.jsp"%>


	<!-- Image Background Page Header -->
	<!-- Note: The background image is set within the business-casual.css file. -->



	<br />



	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<c:set var="colcount" value="0" scope="page" />
			<c:if test="${empty resultList}">
				<h3 class="noSearch">Sorry we're not able to find anything at
					this time.</h3>
			</c:if>

			<c:if test="${resultList != null}">
				<c:forEach items="${resultList}" var="vendors">
					<c:set var="colcount" value="${colcount + 1}" scope="page" />
					<c:if test="${colcount == '3'}">

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

					<c:if test="${colcount == '3'}">
						<c:set var="colcount" value="0" scope="page" />

					</c:if>


				</c:forEach>

			</c:if>
			
			</div>
<!-- 			<div class="row pageNumber"> -->
<!-- 				<nav> -->
<!-- 					<ul class="pagination"> -->
<!-- 						<li><a href="#" aria-label="Previous"> <span -->
<!-- 								aria-hidden="true">&laquo;</span> -->
<!-- 						</a></li> -->
<!-- 						<li><a href="#">1</a></li> -->
<!-- 						<li><a href="#">2</a></li> -->
<!-- 						<li><a href="#">3</a></li> -->
<!-- 						<li><a href="#">4</a></li> -->
<!-- 						<li><a href="#">5</a></li> -->
<!-- 						<li><a href="#" aria-label="Next"> <span -->
<!-- 								aria-hidden="true">&raquo;</span> -->
<!-- 						</a></li> -->
<!-- 					</ul> -->
<!-- 				</nav> -->
<!-- 			</div> -->
		

	</div>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<%@include file="footer.jsp"%>



</body>

</html>