<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Budget Survey</title>
</head>
<body>
	<c:if test="${sessionScope.login != 'loggedIn' }">
		<c:redirect url="login.jsp" />
	</c:if>


	<%@include file="header.jsp"%>


	<!-- Page Content -->
	<div class="container-fluid">
		<h1 class="" id="join">Budget Survey</h1>
		<blockquote>
			What is a budget survey? <br>Well...just what you think it would
			be, a guide to help you with your wedding. <br>How does it help
			me here? Well, we will take it and find vendors that match the style
			you select, the budget you set, and coming soon...matched only to
			those vendors that are available on your wedding day... <br> <br>


		</blockquote>
		<div class="col-lg-12 ">
			<div class="row">
				<div class="col-md-4 budget">
					<h3>
						* Have 5 - 10 minutes? Take it now, and we will walk with you. <br>
					</h3>
					<a href="budgetsurveystart.jsp"><button type="button"
							class="btn btn-lg btn-info">Start Budget Survey</button></a>
				</div>
				<div class="col-md-4"></div>

				<c:if test="${client.budget == '0' }">
					<div class="col-md-4 budget">
						<h3>
							* Short on time?<br>Give us your max budget and we will get
							vendors that are just in your budget...<br>
						</h3>
						<form action="BudgetMakerServlet" method="POST">
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="Enter your Max Budget.." name="maxbudget">
								<span class="input-group-btn">
									<button class="btn btn-default budget" type="submit">Go!</button>
								</span>
							</div>
						</form>

						<!-- /input-group -->
					</div>
				</c:if>

				<c:if test="${client.budget != '0' }">
					<div class="col-md-4 budget">
						<h3>
							<br>Update your budget or just hit go.<br>
						</h3>
						<form action="BudgetMakerServlet" method="POST">
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="Enter your Max Budget.." value="${client.budget}"
									name="maxbudget"> <span class="input-group-btn">
									<button class="btn btn-default budget" type="submit">Go!</button>
								</span>
							</div>
						</form>

						<!-- /input-group -->
					</div>
				</c:if>

				<!-- /.col-lg-6 -->

				<div class="row"></div>
			</div>
		</div>
	</div>

	<!-- /.container -->

	<!-- Footer -->
	<%@include file="footer.jsp"%>




</body>
</html>