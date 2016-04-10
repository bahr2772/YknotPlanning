
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Wedding Checklist</title>
</head>
<body>
	<c:if test="${sessionScope.login != 'loggedIn' }">
		<c:redirect url="login.jsp" />
	</c:if>


	<%@include file="header.jsp"%>


	<!-- Page Content -->
	<div class="container-fluid">
		<h2 class="" id="join">Lets help you keep track of you Planning
			Progress</h2>
			<div class="row">

				<c:if test="${update == 'yes' }">
					<div class="alert alert-success" role="alert">
						<span class="glyphicon  glyphicon-ok"
							aria-hidden="true"></span> <span class="sr-only">Update Successful</span>
							Update Successful! 
						 <c:remove var="update" scope="session" />
					</div>
				</c:if>
			</div>
		<div class="col-lg-12 ">
		<form action="CheckListServlet" method="POST">
			<div class="row"></div>

			<div class="col-md-3 col-sm-5 col-xs-12 checklist">
				<h3>When you Just got engaged...</h3>
				<div class="checkbox">
					<label><input type="checkbox" value="1" name="c0" <c:if test="${c0 == '1' }" >checked</c:if> >Settle
						on a Budget...</label>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" value="1" name="c1" <c:if test="${c1 == '1' }" >checked</c:if> >Gather
						Guest Names & Addresses</label>
				</div>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c2" <c:if test="${c2 == '1' }" >checked</c:if> >Narrow Down
						Wedding Date, We suggest to pick 2 or 3</label>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" value="1" name="c3" <c:if test="${c3 == '1' }" >checked</c:if> >Search for
						Wedding Venue</label>
				</div>
				<hr>




				<h3>12 Months Before...</h3>
				<div class="checkbox">
						
				</div>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c5" <c:if test="${c5 == '1' }" >checked</c:if>  >Book Venue</label>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" value="1" name="c6" <c:if test="${c6 == '1' }" >checked</c:if> >Begin
						Shopping for the Dress</label>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" value="1" name="c7" <c:if test="${c7 == '1' }" >checked</c:if> >Choose
						Bridal Party</label>
				</div>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c8" <c:if test="${c8 == '1' }" >checked</c:if> >Hire
						Photographer</label>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" value="1" name="c9" <c:if test="${c9 == '1' }" >checked</c:if> >Hire DJ/Band</label>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" value="1" name="c10" <c:if test="${c10 == '1' }" >checked</c:if> >Hire
						Videoagrapher</label>
				</div>
				<hr>



				<h3>11 Months Before...</h3>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c11" <c:if test="${c11 == '1' }" >checked</c:if> >Plan Decor
						ideas</label>
				</div>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c12" <c:if test="${c12 == '1' }" >checked</c:if> >Set
						Appointment with Florist</label>
				</div>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c13" <c:if test="${c13 == '1' }">checked</c:if> >Book
						Caterer</label>
				</div>
				<hr>
			</div>




			<div class="col-md-3 col-sm-5 col-xs-12 checklist">
				<h3>10 Months Before...</h3>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c14" <c:if test="${c14 == '1' }" >checked</c:if> >Finalize
						Guest List</label>
				</div>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c15" <c:if test="${c15 == '1' }" >checked</c:if> >Send off
						Gift Registries</label>
				</div>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c16" <c:if test="${c16 == '1' }" >checked</c:if> >Search for
						Officiant</label>
				</div>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c17" <c:if test="${c17 == '1' }" >checked</c:if> >Choose
						Ceremony and Reception Music</label>
				</div>
				<hr>




				<h3>9 Months Before...</h3>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c18" <c:if test="${c18 == '1' }" >checked</c:if> >Order Dress
						and Have Alterations Done</label>
				</div>
				<hr>




				<h3>8 Months Before...</h3>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c19" <c:if test="${c19 == '1' }" >checked</c:if> >Choose
						Jewelry and Accessories</label>
				</div>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c20" <c:if test="${c20 == '1' }" >checked</c:if> >Plan and
						Book Honeymoon(International Excursions)</label>
				</div>
				<hr>




				<h3>6 Months Before...</h3>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c21" <c:if test="${c21 == '1' }" >checked</c:if> >Edit,
						Proof, and Print Wedding Invitations</label>
				</div>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c22" <c:if test="${c22 = '1' }" >checked</c:if> >Test Hair
						and Makeup Styles</label>
				</div>
				<hr>

			</div>



			<div class="col-md-3 col-sm-5 col-xs-12 checklist">
				<h3>5 Months Before...</h3>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c23" <c:if test="${c23 == '1' }" >checked</c:if> >Make any
						Rental Arrangements</label>
				</div>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c24" <c:if test="${c24 == '1' }" >checked</c:if> >Arrange for
						Additional Sound Equipment if Needed</label>
				</div>
				<hr>



				<h3>4 Months Before...</h3>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c25" <c:if test="${c25 == '1' }" >checked</c:if> >Choose
						Groom's Attire and Make Alterations if Needed</label>
				</div>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c26" <c:if test="${c26 == '1' }" >checked</c:if> >Purchase
						Other Bridal Items i.e shoes, garter, lingerie</label>
				</div>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c27" <c:if test="${c27 == '1' }" >checked</c:if> >Plan and
						Book Honeymoon (Local Excursions)</label>
				</div>
				<hr>



				<h3>3 Months Before...</h3>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c28" <c:if test="${c28 == '1' }" >checked</c:if> >Book
						Accommodations for Wedding Night</label>
				</div>
				<hr>



				<h3>2 Months Before...</h3>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c29" <c:if test="${c29 == '1' }" >checked</c:if> >Address,
						Stamp, and Mail Invitations</label>
				</div>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c30" <c:if test="${c30 == '1' }" >checked</c:if> >Finalize
						Menu with Caterer</label>
				</div>
				<hr>
			</div>

			<div class="col-md-3 col-sm-5 col-xs-12 checklist">
				<h3>6 Weeks Before...</h3>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c31" <c:if test="${c31 == '1' }" >checked</c:if> >Purchase
						Wedding Bands</label>
				</div>
				<div class="checkbox ">
					<label><input type="checkbox" value="1" name="c32" <c:if test="${c32 == '1' }" >checked</c:if> >Confirm
						Bouguets, Centerpieces, Boutonnieres with Florist </label>
				</div>
				<hr>
				
				
				
				<h3>4 Weeks Before...</h3>
					<div class="checkbox ">
				<label><input type="checkbox" value="1" name="c33" <c:if test="${c33 == '1' }" >checked</c:if> >Finalize DIY Projects</label>
			</div>
			<hr>
			
			
			
			<h3>2 Weeks Before</h3>
				<div class="checkbox ">
				<label><input type="checkbox" value="1" name="c34" <c:if test="${c34 == '1' }" >checked</c:if> >Get Local Marriage License</label>
			</div>
				<div class="checkbox ">
				<label><input type="checkbox" value="1" name="c35" <c:if test="${c35 == '1' }" >checked</c:if> >Create Wedding Date Schedule to Hand-out</label>
			</div>
				<div class="checkbox ">
				<label><input type="checkbox" value="1" name="c36" <c:if test="${c36 == '1' }" >checked</c:if> >Give Final Head Count to Caterer</label>
			</div>
				<div class="checkbox ">
				<label><input type="checkbox" value="1" name="c37" <c:if test="${c37 == '1' }" >checked</c:if> >Finalize Seat Chart</label>
			</div>
				<div class="checkbox ">
				<label><input type="checkbox" value="1" name="c38" <c:if test="${c38 == '1' }" >checked</c:if> >Confirm ALL Vendors' Arrival or Delivery Times</label>
			</div>
			<hr>
			
			
			<h3>WEDDING DAY!!!</h3>
				<div class="checkbox ">
				<label><input type="checkbox" value="1" name="c39" <c:if test="${c39 == '1' }" >checked</c:if> >Have Friend or Family Member be in charge of Vendors</label>
			</div>
				<div class="checkbox ">
				<label><input type="checkbox" value="1" name="c40" <c:if test="${c40 == '1' }" >checked</c:if> >GET MARRIED AND HAVE FUN!</label>
			</div>
<hr>

			</div>
			
			<div class="row">
			 <button type="submit" value="submit" class="btn btn-primary checklistBtn btn-block">Save Checklist</button>
			</div>
			
</form>
		</div>
	</div>
</body>
</html>