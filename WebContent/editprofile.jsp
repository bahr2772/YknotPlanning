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

<title>Yknot Planning: Client Register</title>

<!-- Bootstrap Core CSS -->
<!-- <link href="css/bootstrap.css" rel="stylesheet"> -->

<!-- Custom CSS -->
<link href='https://fonts.googleapis.com/css?family=Mate+SC'
	rel='stylesheet' type='text/css'>
<link href="css/style.css" rel="stylesheet">



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
	<c:if test="${sessionScope.login != 'loggedIn' }">
		<c:redirect url="login.jsp" />
	</c:if>


	<%@include file="header.jsp"%>


	<!-- Page Content -->
	<div class="container-fluid">
		<h1 class="" id="join">Update Your Profile</h1>
		<div class="col-lg-12 ">
			<div class="row">

				<c:if test="${update == 'yes' }">
					<div class="alert alert-success" role="alert">
						<span class="glyphicon  glyphicon-ok" aria-hidden="true"></span> <span
							class="sr-only">Update Successful</span> Your Profile has
						Successfully been updated!
						<c:remove var="update" scope="session" />
					</div>
				</c:if>
			</div>

			<div class="row">
				<form action="UpdateClientProfileServlet" method="POST"
					id="clientRegister" data-toggle="validator">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-12  form-group">
								<label>Email*</label> <input type="email"
									placeholder="Enter Email Here.." class="form-control"
									name="email"
									value='<c:if test="${client.email != null}"><c:out value="${client.email}"></c:out></c:if>'
									readonly>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-6 form-group">
								<label>First Name</label> <input type="text"
									placeholder="Enter First Name Here.." class="form-control"
									name="firstName"
									value='<c:if test="${client.getFirstName() != null}"><c:out value="${client.getFirstName() }"></c:out></c:if>'>
							</div>
							<div class="col-sm-6 form-group">
								<label>Last Name</label> <input type="text"
									placeholder="Enter Last Name Here.." class="form-control"
									name="lastName"
									value='<c:if test="${client.getLastName() != null}"><c:out value="${client.getLastName() }"></c:out></c:if>'>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-4 form-group">
								<label>City</label> <input type="text"
									placeholder="Enter City Name Here.." class="form-control"
									name="city"
									value='<c:if test="${client.getCity() != null}"><c:out value="${client.getCity() }"></c:out></c:if>'>
							</div>
							<div class="col-sm-4 form-group">
								<label>State</label> <input type="text"
									placeholder="Enter State Name Here.." class="form-control"
									name="state"
									value='<c:if test="${client.getState() != null}"><c:out value="${client.getState() }"></c:out></c:if>'>
							</div>
							<div class="col-sm-4 form-group">
								<label>Zip*</label> <input type="text"
									placeholder="Enter Zip Code Here.." name="zip"
									class="form-control" name="Zip"
									value='<c:if test="${client.getZip() != null}"><c:out value="${client.getZip() }"></c:out></c:if>'>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Role*</label>

								<div class="input-group">
									<input type="TextBox" ID="role" name="role"
										Class="form-control"
										value=<c:if test="${client.getRole() != null}"><c:out value="${client.getRole() }"></c:out></c:if>>
									<div class="input-group-btn">
										<button type="button" class="btn btn-primary dropdown-toggle"
											data-toggle="dropdown">
											<span class="caret"></span>
										</button>
										<ul id=roleList class="dropdown-menu dropdown-menu-right">
											<li>Bride</li>
											<li>Groom</li>
											<li>Bridesmaid</li>
											<li>Grooms man</li>
											<li>Mother of the Bride</li>
											<li>Father of the Bride</li>
											<li>Mother of the Groom</li>
											<li>Father of the Groom</li>
											<li>Other</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-sm-6 form-group">
								<label>Wedding Date</label>
								<div class="form-group ">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-calendar"> </i>
										</div>
										<input class="form-control" id="date" name="weddingDate"
											placeholder="MM/DD/YYYY" type="text"
											value='<c:if test="${client.getWeddingDate() != null}"><c:out value="${client.getWeddingDate() }"></c:out></c:if>'>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-offset-4 col-sm-10">
							<button type="submit" class="btn btn-lg btn-info">Update
								Profile</button>
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
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<!--  jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />

<script>
$('#roleList li').on('click', function(){
    $('#role').val($(this).text());
});
</script>

<script>
	var weddingDate_input = $('input[name="weddingDate"]'); //our date input has the name "date"
	var container = $('.bootstrap-iso form').length > 0 ? $(
			'.bootstrap-iso form').parent() : "body";
	var options = {
		format : 'DD MM dd, yyyy',
		container : container,
		todayHighlight : true,
		autoclose : true,
	};
	weddingDate_input.datepicker(options);
</script>

<!-- jQuery -->
<script src="js/jquery.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
</html>