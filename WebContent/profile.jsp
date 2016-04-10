<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<%@include file="header.jsp"%>


	<!-- Image Background Page Header -->
	<!-- Note: The background image is set within the business-casual.css file. -->
	<header class="business-header">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<a href="./index.jsp"> <img alt="Yknot Planning"
					src="./images/logo.png" id="loginLogo"></a>
					<hr>
			</div>
		</div>
	</div>
	</header>



	<br />
	<br>


	<!-- Page Content -->
	<div class="container">
		<div class="row">








			<div class="col-sm-12 col-md-12 col-lg-12">
				<div class="thumbnail">
					
					<img src="./images/yknotstudios.png" alt="..." id="profileImg">
					<div class="row">
					<div class="caption">
						<div class="businessName"> Yknot Studios <br>
						<div id="address">Farmginton, Mo 63640</div><br></div><br>
						
						<div class="businessType">Photographer </div>
						<div class="businessContent">Specialize in Weddings. Indoor or Out.</div>
					</div>
				
					
						
					


						<div class="socialIcons">
							<a href="http://www.facebook.com"><img alt="Facebook"
								src="./images/facebook.png" id="socialIcons"></a> <a
								href="http://www.Instagram.com"><img alt="Instagram"
								src="./images/instagram.png" id="socialIcons"></a> <a
								href="http://www.pinterest.com"><img alt="Pinterest"
								src="./images/pinterest.png" id="socialIcons"></a> <a
								href="http://www.twitter.com"><img alt="Twitter"
								src="./images/twitter.png" id="socialIcons"></a> <a
								href="http://www.youtube.com"><img alt="Youtube"
								src="./images/youtube.png" id="socialIcons"></a>
								<a href="mailto:"><img alt="Email"
								src="./images/email.png" id="socialIcons"></a>
						</div>
					</div>

				</div>
			</div>
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