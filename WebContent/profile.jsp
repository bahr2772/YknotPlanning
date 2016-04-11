<!DOCTYPE html>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Yknot Studios">

<title>Yknot Planning:</title>

<!-- Bootstrap Core CSS -->
<link href="./css/bootstrap.min.css" rel="stylesheet">

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

</head>

<body>
	<c:if test="${sessionScope.login != 'loggedIn' }">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="header.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>


	<!-- Page Content -->
	<div class="container">
		<div class="container">
			<div class="row">


				<c:if test="${not empty ven }">
					<div
						class="col-sm-offset-4 col-xs-offset-6  col-xs-6  col-sm-6 col-md-6">
						<img src="${ven.profileImg}" alt="${ven.businessName}"
							id="profileImgProfile">
					</div>

					<div class="row">
						<div class="col-xs-12  col-sm-12 col-md-12">
							<div class="businessNameProfile">${ven.businessName}</div>
							<div id="address">${ven.city}, ${ven.state}    ${ven.zip}</div>

							<div class="businessTypeProfile">${ven.category}</div>
							<hr>
						</div>
					</div>

					<div class="row">
						<div class="col-xs-12  col-sm-6 col-md-4 packageInfo" >
							Starting Cost:<br> $${ven.startingPackage}<br> Top Package Cost:<br>
							$${ven.maxPackage}<br>



							<div class="businessNameProfile"></div>
						</div>




						<div class="row">
						<div class="col-xs-12  col-sm-12 col-md-12">
							<hr>
							</div>
						</div>
						<div class="col-sm-offset-6 col-xs-6 col-sm-6 col-md-6">

							<c:if test="${ven.facebook != ' ' }">
								<a href="http://www.facebook.com/${ven.facebook}"><img
									alt="Facebook" src="./images/facebook.png" id="socialIcons"></a>
							</c:if>
							<c:if test="${ven.instagram != ' '}">
								<a href="http://www.Instagram.com/${ven.instagram}"><img
									alt="Instagram" src="./images/instagram.png" id="socialIcons"></a>
							</c:if>
							<c:if test="${ven.pintrest != ' '}">
								<a href="http://www.pinterest.com/${ven.pintrest}"><img
									alt="Pinterest" src="./images/pinterest.png" id="socialIcons"></a>
							</c:if>
							<c:if test="${ven.twitter != ' '}">
								<a href="http://www.twitter.com/${ven.twitter}"><img
									alt="Twitter" src="./images/twitter.png" id="socialIcons"></a>
							</c:if>
							<c:if test="${ven.youtube != ' '}">
								<a href="http://www.youtube.com/${ven.youtube}"><img
									alt="Youtube" src="./images/youtube.png" id="socialIcons"></a>
							</c:if>
							<c:if test="${ven.email != ' '}">
								<a href="mailto:${ven.businessEmail}"><img
									src="./images/email.png" alt="Email" id="socialIcons"></a>
							</c:if>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<%@include file="footer.jsp"%>


</body>

</html>