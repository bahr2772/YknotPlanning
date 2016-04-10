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

<title>Yknot Planning: Lost Password</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href='https://fonts.googleapis.com/css?family=Mate+SC'
	rel='stylesheet' type='text/css'>
<link href="css/style.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<%@include file="header.jsp"%>



	<!-- Page Content -->
	<div class="container">
		<div class="well">
			<h2>Lost Your Password?</h2>
			<h6>Sorry to hear that.</h6>
			<h5>Yknot let us help get it for you</h5>
		</div>
		<div class="col-lg-12 well">

			<form action="LostPass" method="POST">
				<div class="row">
					<c:if test="${sessionScope.lostPass == 'notFound'}">
						<div class="alert alert-danger" role="alert">
							<span class="glyphicon glyphicon-exclamation-sign"
								aria-hidden="true"></span> <span class="sr-only">Error:</span>
							Sorry Email not found. Would you like to <a href="join.jsp">
								Register?</a>
							<c:set var="lostPass" value="" />
						</div>
					</c:if>
				</div>
				<c:if test="${sessionScope.lostPass == 'found' }">
					<div class="alert alert-success" role="alert">
						<span class="glyphicon glyphicon-ok" aria-hidden="true"></span> <span
							class="sr-only">Error:</span> Check you Email, we were pretty
						successful in finding your password.
						<c:set var="lostPass" value="" />
					</div>
				</c:if>


				<div class="row">
					<div class="col-sm-offset-2 col-sm-8 form-group">
						<label>Email</label> <input type="email"
							placeholder="Enter Email Here.." class="form-control"
							name="email">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-offset-5 col-sm-10">
						<button type="submit" class="btn btn-lg btn-info">Submit</button>
					</div>
				</div>
			</form>
		</div>
	</div>


	<!-- /.container -->

	<!-- Footer -->
	<%@include file="footer.jsp"%>

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>

</html>