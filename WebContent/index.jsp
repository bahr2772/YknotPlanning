<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Yknot Studios">

<title>Yknot Planning</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

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


	<!-- Image Background Page Header -->
	<!-- Note: The background image is set within the business-casual.css file. -->
	<header class="business-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
				</div>
				<div class="col-lg-4">
					<a href="index.jsp"> <img alt="Yknot Planning"
						src="./images/logo.png" id="logoMain"></a>
				</div>
				<div class="col-lg-4"></div>
			</div>
		</div>
	</header>

	<!-- Page Content -->
	<div class="container">



		<div class="row" id="IndexBody">
			<div class="col-lg-2"></div>
			<div class="col-lg-9">
				<h2>We all could use a Little help in planning our Special Day</h2>
				<hr>
				<p>Yknot let us Give you a Hand</p>
				<c:if test="${sessionScope.login == null }">
					<a class="btn btn-default btn-lg" href="join.jsp">Join Us
						&raquo;</a>
				</c:if>
			</div>
			<div class="col-lg-2"></div>
		</div>
		<!-- /.row -->



	</div>
	<!-- /.container -->

	<!-- Footer -->
	<%@include file="footer.jsp"%>


</body>

</html>