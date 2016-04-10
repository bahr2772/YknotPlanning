<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<footer>


	<c:if test="${login != 'loggedIn' && vLogin != 'loggedIn' }">
		<div class="footer" id="MainFooter">
			<p>
				&copy; Yknot Planning 2016 <a href="vendorlogin.jsp"
					id="vendorLinkFoot">Vendor Login </a>
			</p>
		</div>
	</c:if>


	<c:if test="${login == 'loggedIn' }">
		<div class="footer" id="MainFooter">
			<p>&copy; Yknot Planning 2016</p>
		</div>
	</c:if>
	
	<c:if test="${vLogin == 'loggedIn' }">
		<div class="footer" id="MainFooter">
			<p>&copy; Yknot Planning 2016</p>
		</div>
	</c:if>





</footer>