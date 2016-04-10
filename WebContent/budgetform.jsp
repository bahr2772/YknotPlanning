<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Budget Survey: Results</title>
</head>
<body>
	<c:if test="${sessionScope.login != 'loggedIn' }">
		<c:redirect url="login.jsp" />
	</c:if>


	<%@include file="header.jsp"%>


	<!-- Page Content -->
	<div class="container-fluid">
		<h1 class="" id="join">Your Basic Budget Survey</h1>
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
				<form action="UpdateBudgetServlet" method="POST" id="clientRegister"
					data-toggle="validator">
					<div class="col-md-12">
						<div class="row">
							<div class="col-sm-6 col-md-4  col-xs-12 form-group">
								<label>Reception</label> <input type="text"
									placeholder="Enter Your Reception budget..."
									class="form-control" name="recep"
									value='<c:if test="${budget.recepAvg != null}"><fmt:formatNumber value="${budget.recepAvg}" type="currency" /></c:if>'
									readonly>
							</div>
							<div class="col-sm-6 col-md-4  col-xs-12 form-group">
								<label>Photographer and Videographer</label> <input type="text"
									placeholder="Enter Your photo and video budget..."
									class="form-control" name="photo"
									value='<c:if test="${budget.photoAvg != null}"><fmt:formatNumber value="${budget.photoAvg}" type="currency" /></c:if>'
									readonly>
							</div>
							<div class="col-sm-6 col-md-4  col-xs-12 form-group">
								<label>Wedding Ceremony</label> <input type="text"
									placeholder="Enter You ceremony budget..." class="form-control"
									name="venu"
									value='<c:if test="${budget.ceremonyAvg != null}"><fmt:formatNumber value="${budget.ceremonyAvg}" type="currency" /></c:if>'
									readonly>
							</div>
							<div class="col-sm-6 col-md-4  col-xs-12 form-group">
								<label>Flowers</label> <input type="text"
									placeholder="Enter Your flower budget..." class="form-control"
									name="flowers"
									value='<c:if test="${budget.flowersAvg != null}"><fmt:formatNumber value="${budget.flowersAvg}" type="currency" /></c:if>'
									readonly>
							</div>
							<div class="col-sm-6 col-md-4  col-xs-12 form-group">
								<label>Rings</label> <input type="text"
									placeholder="Enter Your Rings budget..." class="form-control"
									name="rings"
									value='<c:if test="${budget.ringAvg != null}"><fmt:formatNumber value="${budget.ringAvg}" type="currency" /></c:if>'
									readonly>
							</div>
							<div class="col-sm-6 col-md-4  col-xs-12 form-group">
								<label>Entertainment</label> <input type="text"
									placeholder="Enter Your Entertainment budget..."
									class="form-control" name="enter"
									value='<c:if test="${budget.enterAvg != null}"><fmt:formatNumber value="${budget.enterAvg}" type="currency" /></c:if>'
									readonly>
							</div>
							<div class="col-sm-6 col-md-4  col-xs-12 form-group">
								<label>Dress and Attire</label> <input type="text"
									placeholder="Enter Your Attire budget..." class="form-control"
									name="attire"
									value='<c:if test="${budget.attireAvg != null}"><fmt:formatNumber value="${budget.attireAvg}" type="currency" /></c:if>'
									readonly>
							</div>
							<div class="col-sm-6 col-md-4  col-xs-12 form-group">
								<label>Transportation</label> <input type="text"
									placeholder="Enter Your Transportaion budget..."
									class="form-control" name="trans"
									value='<c:if test="${budget.transAvg != null}"><fmt:formatNumber value="${budget.transAvg}" type="currency" /></c:if>'
									readonly>
							</div>
							<div class="col-sm-6 col-md-4  col-xs-12 form-group">
								<label>Gifts</label> <input type="text"
									placeholder="Enter Your Gifts budget..." class="form-control"
									name="gifts"
									value='<c:if test="${budget.giftsAvg != null}"><fmt:formatNumber value="${budget.giftsAvg}" type="currency" /></c:if>'
									readonly>
							</div>
							<div
								class="col-sm-offset-2 col-sm-6 col-md-4  col-xs-12 form-group">
								<label>Stationary</label> <input type="text"
									placeholder="Enter Your Stationary budget..."
									class="form-control" name="station"
									value='<c:if test="${budget.stationAvg != null}"><fmt:formatNumber value="${budget.stationAvg}" type="currency" /></c:if>'
									readonly>
							</div>
							<div class="col-sm-6 col-md-4  col-xs-12 form-group">
								<label>Misc</label> <input type="text"
									placeholder="Enter Your Misc. budget..." class="form-control"
									name="misc"
									value='<c:if test="${budget.miscAvg != null}"><fmt:formatNumber value="${budget.miscAvg}" type="currency" /></c:if>'
									readonly>
							</div>

							<div class="col-sm-offset-0 col-sm-3">
							<a href="VendorMatchesServlet"><button type="button" class="btn btn-lg btn-info">View Vendors in your Budget</button></a>
							</div>
							<div class="col-sm-offset-5 col-sm-3">
								<a class="btn btn-primary btn-lg"
									href="./files/planningguide.pdf"> Download Planning Guide </a>
							</div>
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
</html>