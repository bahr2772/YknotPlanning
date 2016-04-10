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

<title>Yknot Planning: Vendor Register</title>

<!-- Bootstrap Core CSS -->
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href='https://fonts.googleapis.com/css?family=Mate+SC'
	rel='stylesheet' type='text/css'>
<link href="./css/style.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->



<!--formden.js communicates with FormDen server to validate fields and submit via AJAX -->
<script type="text/javascript"
	src="https://formden.com/static/cdn/formden.js"></script>

<!-- Special version of Bootstrap that is isolated to content wrapped in .bootstrap-iso -->
<link rel="stylesheet"
	href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!--Font Awesome (added because you use icons in your prepend/append)-->
<link rel="stylesheet"
	href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />





</head>

<body>
	<c:if test="${sessionScope.vLogin == 'loggedIn' }">
		<c:redirect url="vendor.jsp" />
	</c:if>
	<%@include file="header.jsp"%>


	<!-- Page Content -->
	<div class="container">
		<h1 class="" id="join">Register Your Business</h1>
		<div class="col-lg-12 ">
			<div class="row">

				<c:if test="${sessionScope.vLogin == 'error' }">
					<div class="alert alert-danger" role="alert">
						<span class="glyphicon glyphicon-exclamation-sign"
							aria-hidden="true"></span> <span class="sr-only">Error:</span>
						Please fill in the following:
						<c:if test="${email != null}">
							<c:out value="${email}," />
						</c:if>
						<c:if test="${password1 != null}">
							<c:out value="${password1}," />
						</c:if>
						<c:if test="${password2 != null}">
							<c:out value="${password2}," />
						</c:if>
						<c:if test="${businessName != null}">
							<c:out value="${businessName}," />
						</c:if>
						<c:if test="${businessEmail != null}">
							<c:out value="${businessEmail}," />
						</c:if>
						<c:if test="${city != null}">
							<c:out value="${city}," />
						</c:if>
						<c:if test="${state != null}">
							<c:out value="${state}," />
						</c:if>
						<c:if test="${zip != null}">
							<c:out value="${zip}," />
						</c:if>
						<c:if test="${category != null}">
							<c:out value="${category}," />
						</c:if>
						<c:if test="${businessWebsite != null}">
							<c:out value="${businessWebsite}" />
						</c:if>
						<c:set var="vLogin" value="" />
					</div>
				</c:if>
				<c:if test="${sessionScope.vLogin == 'userInDb' }">
					<div class="alert alert-danger" role="alert">
						<span class="glyphicon glyphicon-exclamation-sign"
							aria-hidden="true"></span> <span class="sr-only">Error:</span>
						Email address is already used. <a href="./lostpassword.jsp">Get
							lost Password</a>
					</div>
				</c:if>
				<c:if test="${sessionScope.vLogin == 'passTooSmall'}">
					<div class="alert alert-danger" role="alert">
						<span class="glyphicon glyphicon-exclamation-sign"
							aria-hidden="true"></span> <span class="sr-only">Error:</span>
						Password Invaild. Must be longer then 8, not contain
						\",/\\}]{{+=|~`'\"
					</div>
				</c:if>
				<c:if
					test="${sessionScope.vLogin == 'emailFail' || sessionScope.vLogin == 'userTooSmall'}">
					<div class="alert alert-danger" role="alert">
						<span class="glyphicon glyphicon-exclamation-sign"
							aria-hidden="true"></span> <span class="sr-only">Error:</span>
						Email Invaild. Can not contain \",/\\}]{{+=|~`'\"
					</div>
				</c:if>
				<c:if test="${sessionScope.vLogin == 'passfail'}">
					<div class="alert alert-danger" role="alert">
						<span class="glyphicon glyphicon-exclamation-sign"
							aria-hidden="true"></span> <span class="sr-only">Error:</span>
						Passwords don't match, Try again.
					</div>
				</c:if>
			</div>
			<div class="row">
				<form action="VendorRegisterServlet" method="POST"
					id="VendorRegister" data-toggle="validator">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-12 form-group">
								<label>Email*</label> <input type="email"
									placeholder="Enter Email Here.." class="form-control"
									name="email"
									value='<c:if test="${vendor.getEmail() != null}"><c:out value="${vendor.getEmail()}"></c:out></c:if>'>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Password*</label> <input type="password"
									placeholder="Enter Password Here.." class="form-control"
									name="password">
							</div>
							<div class="col-sm-6 form-group">
								<label>Confirm Password*</label> <input type="password"
									placeholder="Confirm your Password Here.." class="form-control"
									name="confirmPassword">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Business Name*</label> <input type="text"
									placeholder="Enter Business Name Here.." class="form-control"
									name="businessName"
									value='<c:if test="${vendor.getBusinessName() != null}"><c:out value="${vendor.getBusinessName()}"></c:out></c:if>'>
							</div>
							<div class="col-sm-6 form-group">
								<label>Business Email*</label> <input type="email"
									placeholder="Enter Business Email Here.." class="form-control"
									name="businessEmail"
									value='<c:if test="${vendor.getBusinessEmail() != null}"><c:out value="${vendor.getBusinessEmail()}"></c:out></c:if>'>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-4 form-group">
								<label>City*</label> <input type="text"
									placeholder="Enter City Name Here.." class="form-control"
									name="city"
									value='<c:if test="${vendor.getCity() != null}"><c:out value="${vendor.getCity()}"></c:out></c:if>'>
							</div>
							<div class="col-sm-4 form-group">
								<label>State*</label> <input type="text"
									placeholder="Enter State Name Here.." class="form-control"
									name="state"
									value='<c:if test="${vendor.getState() != null}"><c:out value="${vendor.getState()}"></c:out></c:if>'>
							</div>
							<div class="col-sm-4 form-group">
								<label>Zip*</label> <input type="text"
									placeholder="Enter Zip Code Here.." name="zip"
									class="form-control" name="Zip"
									value='<c:if test="${vendor.getZip() != null}"><c:out value="${vendor.getZip()}"></c:out></c:if>'>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Vendor Category*</label>
								<div class="input-group">
									<input type="TextBox" ID="vendors" name="vendors"
										Class="form-control"
										placeholder="Select the Category of your Business.."
										value=<c:if test="${vendor.getCategory() != null}"><c:out value="${vendor.getCategory()}"></c:out></c:if>>
									<div class="input-group-btn">
										<button type="button" class="btn btn-primary "
											data-toggle="dropdown" id="dropList">
											<span class="caret"></span>
										</button>
										<ul id="vendorList" class="dropdown-menu dropdown-menu-right">
											<li>Photographer</li>
											<li>Band</li>
											<li>Dj</li>
											<li>Entertainer</li>
											<li>Event Rentals</li>
											<li>Photo Booths</li>
											<li>Lighting and Decor</li>
											<li>Jewelry</li>
											<li>Transportation</li>
											<li>Beauty</li>
											<li>Catering</li>
											<li>Ceremony & Reception Venue</li>
											<li>Ceremony Music</li>
											<li>Florist</li>
											<li>Videography</li>
											<li>Officiant</li>
											<li>Dresses and Attire</li>

										</ul>
									</div>
								</div>
							</div>
							<div class="col-sm-6 form-group">
								<label>Business Website</label>
								<div class="form-group ">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="glyphicon glyphicon-globe"> </i>
										</div>
										<input type="text" placeholder="Enter Website address Here.."
											name="businessWebsite" class="form-control"
											value='<c:if test="${vendor.getBusinessWebsite() != null}"><c:out value="${vendor.getBusinessWebsite()}"></c:out></c:if>' />
									</div>
								</div>
							</div>
							<div class="col-sm-6 form-group">
								<label>Facebook Page</label> <input type="text"
									placeholder="Enter info after ...facebook.com/" name="facebook"
									class="form-control"
									value='<c:if test="${vendor.getFacebook() != null}"><c:out value="${vendor.getFacebook()}"></c:out></c:if>'>
							</div>
							<div class="col-sm-6 form-group">
								<label>Pintrest</label> <input type="text"
									placeholder="Enter Pintrest Username" name="pintrest"
									class="form-control"
									value='<c:if test="${vendor.getPintrest() != null}"><c:out value="${vendor.getPintrest()}"></c:out></c:if>'>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Twitter</label> <input type="text"
									placeholder="Enter Twitter Username" name="twitter"
									class="form-control"
									value='<c:if test="${vendor.getTwitter() != null}"><c:out value="${vendor.getTwitter()}"></c:out></c:if>'>
							</div>
							<div class="col-sm-6 form-group">
								<label>YouTube</label> <input type="text"
									placeholder="Enter YouTube Username" name="youtube"
									class="form-control"
									value='<c:if test="${vendor.getYoutube() != null}"><c:out value="${vendor.getYoutube()}"></c:out></c:if>'>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Instagram</label> <input type="text"
									placeholder="Enter Instagram Username" name="instagram"
									class="form-control"
									value='<c:if test="${vendor.getInstagram() != null}"><c:out value="${vendor.getInstagram()}"></c:out></c:if>'>
							</div>

							<div class="col-sm-6 form-group">
								<label>Profile Image Url</label> <input type="text"
									placeholder="Enter Link to your Profile Image"
									name="profileImg" class="form-control"
									value='<c:if test="${vendor.getProfileImg() != null}"><c:out value="${vendor.getProfileImg()}"></c:out></c:if>'>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Starting Package*</label> <input type="text"
									placeholder="Enter your Starting Pacakge" name="startingPackage"
									class="form-control"
									value='<c:if test="${vendor.getStartingPackage() != null}"><c:out value="${vendor.getStartingPackage()}"></c:out></c:if>'>
							</div>

							<div class="col-sm-6 form-group">
								<label>Top Package*</label> <input type="text"
									placeholder="Enter your Highest Package amount"
									name="topPackage" class="form-control"
									value='<c:if test="${vendor.getMaxPackage() != null}"><c:out value="${vendor.getMaxPackage()}"></c:out></c:if>'>
							</div>
						</div>
					</div>
			</div>
			<div class="col-sm-offset-5 col-sm-10">
				<button type="submit" class="btn btn-lg btn-info">Submit</button>
			</div>
		</div>
		</form>
	</div>
	</div>
	</div>


	<!-- /.container -->

	<!-- Footer -->
	<%@include file="footer.jsp"%>


</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<!--  jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />

<!-- DROPDOWN LIST SCRIPT -->
<script>
	$('#vendorList li').on('click', function() {
		$('#vendors').val($(this).text());
	});
</script>


<!-- jQuery -->
<script src="./js/jquery.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="./js/bootstrap.min.js"></script>
</html>