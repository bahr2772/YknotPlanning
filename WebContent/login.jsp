<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Yknot Studios">

<title>Yknot Planning: Client Login</title>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->

<link href='https://fonts.googleapis.com/css?family=Mate+SC'
	rel='stylesheet' type='text/css'>
<link href="../css/style.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<c:forEach var="cookies" items="${cookie}">
		<c:if test="${cookies.key eq 'clientemail'}">
			<c:set var="clientemailCookie" value="${cookies.value.value}" />
		</c:if>
		<c:if test="${cookies.key eq 'clientpassword'}">
			<c:set var="clientpassCookie" value="${cookies.value.value}" />
		</c:if>
	</c:forEach>

	<c:if test="${sessionScope.login == 'loggedIn' }">
		<c:redirect url="client.jsp" />
	</c:if>
	<%@include file="header.jsp"%>



	<!-- Page Content -->
	<div class="container">

		<div class="row" id="LoginBody">
			<h1>Client Login</h1>


			<c:if test="${sessionScope.login == 'loggedIn'}">
				<c:redirect url="vendor.jsp" />
			</c:if>
			<c:if test="${sessionScope.login == 'noUser'}">
				<div class="alert alert-danger" role="alert" id="loginAlerts">
					<strong>Oh snap!</strong> Looks like your not registered.<a
						href="join.jsp">Wanna Register?</a>
				</div>
			</c:if>
			<c:if test="${sessionScope.login == 'passFail'}">
				<div class="alert alert-danger" role="alert" id="loginAlerts">
					<strong>Oh snap!</strong> Bad password<br> <a
						href="lostpassword.jsp">Want us help find it for you?</a>
				</div>
			</c:if>
			<div class="col-lg-12 ">
				<hr>
				<div class="col-xs-7" id="loginForm">



					<form class="form-horizontal" action="./LoginServlet" method="post">

						<div class="form-group">
							<label for="loginUsername" class="col-sm-5 control-label">Email</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="loginUsername"
									<c:if test="${clientemailCookie!=null}">value="<c:out value="${clientemailCookie}"/>"</c:if>
									<c:if test="${clientemailCookie==null}"> placeholder="Enter email here.." </c:if>
									name="email" required autofocus>
							</div>
						</div>
						<div class="form-group">
							<label for="loginPassword" class="col-sm-5 control-label">Password</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" id="loginPassword"
									<c:if test="${clientpassCookie!=null}">value="<c:out value="${clientpassCookie}"/>"</c:if>
									<c:if test="${clientpassCookie==null}"> placeholder="Enter password here.." </c:if>
									name="password" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-12">
								<div id="checkbox">
									<label> <input type="checkbox" name="box"
										value="remember"
										<c:if test="${clientemailCookie!=null}">checked</c:if>>
										Remember me<br> <a href="lostpassword.jsp?type=client"
										id="lostPass">lost password?</a>
										<div class="col-sm-offset-2 col-sm-10">
											<br>
											<button type="submit" class="btn btn-default">Sign
												in</button>
										</div>
									</label>
								</div>
							</div>
						</div>
						<br>
					</form>
				</div>
				<div class="col-xs-5" id="regArea">
					<div class="row">
						Not a Member?<br> <br>
					</div>
					<div class="row"></div>
					<a href="join.jsp">Register Here</a> <br> <br> <br>
					<a href="./vendorlogin.jsp" id="vendorLink">Vendor?</a>
				</div>
			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<%@include file="footer.jsp"%>

	<!-- jQuery -->
	w
	<script src="./js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="./js/bootstrap.min.js"></script>

</body>

</html>