package register;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Vendor;
import sql.GetInfo;

/**
 * Servlet implementation class VendorRegisterServlet
 */
@WebServlet("/VendorRegisterServlet")
public class VendorRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VendorRegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		String email = request.getParameter("email");
		String password1 = request.getParameter("password");
		String password2 = request.getParameter("confirmPassword");
		String businessName = request.getParameter("businessName");
		String businessEmail = request.getParameter("businessEmail");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zip = request.getParameter("zip");
		String category = request.getParameter("vendors");
		String businessWebsite = request.getParameter("businessWebsite");
		String businessFacebook = request.getParameter("facebook");
		String businessInstagram = request.getParameter("instagram");
		String businessPintrest = request.getParameter("pintrest");
		String businessTwitter = request.getParameter("twitter");
		String businessYoutube = request.getParameter("youtube");
		String businessProfile = request.getParameter("profileImg");
		String startingPackage = request.getParameter("startingPackage");
		String topPackage = request.getParameter("topPackage");
		
		
		session.setAttribute("email", null);
		session.setAttribute("password1", null);
		session.setAttribute("password2", null);
		session.setAttribute("businessName", null);
		session.setAttribute("businessEmail", null);
		session.setAttribute("city", null);
		session.setAttribute("state", null);
		session.setAttribute("zip", null);
		session.setAttribute("category", null);
		session.setAttribute("businessWebsite", null);
		session.setAttribute("businessFacebook", null);
		
		boolean nullChecker = false;

		if (email == null || email.isEmpty()) {
			session.setAttribute("email", "Email");
			nullChecker = true;
		}
		if (password1 == null || password1.isEmpty()) {
			session.setAttribute("password1", "Password");
			nullChecker = true;
		}
		if (password2 == null || password2.isEmpty()) {
			session.setAttribute("password2", "Confirm Password");
			nullChecker = true;
		}
		if (businessName == null || businessName.isEmpty()) {
			session.setAttribute("businessName", "Business Name");
			nullChecker = true;
		}
		if (businessEmail == null || businessEmail.isEmpty()) {
			session.setAttribute("businessEmail", "Business Email");
			nullChecker = true;
		}
		if (city == null || city.isEmpty()) {
			session.setAttribute("city", "City");
			nullChecker = true;
		}
		if (state == null || state.isEmpty()) {
			session.setAttribute("state", "State");
			nullChecker = true;
		}
		if (zip == null || zip.isEmpty()) {
			session.setAttribute("zip", "Zip");
			nullChecker = true;
		}
		if (category == null || category.isEmpty()) {
			session.setAttribute("category", "Vendor Category");
			nullChecker = true;
		}
//		if (businessWebsite == null || businessWebsite.isEmpty()) {
//			session.setAttribute("businessWebsite", "Business Website");
//			nullChecker = true;
//		}

		
		Vendor vendor = new Vendor();
		
		if (email.length() > 1) {
			vendor.setEmail(email);
		}
		if (password1.length() > 1) {
			vendor.setPassword(password1);
		}
		if (businessName.length() > 1) {
			vendor.setBusinessName(businessName);
		}
		if (businessEmail.length() > 1) {
			vendor.setBusinessEmail(businessEmail);
		}
		if (city.length() > 1) {
			vendor.setCity(city);
		}
		if (state.length() > 1) {
			vendor.setState(state);
		}
		if (zip.length() > 1) {
			vendor.setZip(zip);
		}
		if (category.length() > 1) {
			vendor.setCategory(category);
		}
		if (businessWebsite.length() > 1) {
			vendor.setBusinessWebsite(businessWebsite);
		}
		if (businessFacebook.length() > 1) {
			vendor.setFacebook(businessFacebook);
		}
		if (businessInstagram.length() > 1) {
			vendor.setInstagram(businessInstagram);
		}
		if (businessPintrest.length() > 1) {
			vendor.setPintrest(businessPintrest);
		}
		if (businessTwitter.length() > 1) {
			vendor.setTwitter(businessTwitter);
		}
		if (businessYoutube.length() > 1) {
			vendor.setYoutube(businessYoutube);
		}
		if (businessProfile.length() > 1) {
			vendor.setProfileImg(businessProfile);
		}
		if (businessProfile.length() > 1) {
			vendor.setStartingPackage(startingPackage);
		}
		if (businessProfile.length() > 1) {
			vendor.setMaxPackage(topPackage);
		}
		
		request.getSession().setAttribute("vendor", vendor);


		if (nullChecker) {
			response.sendRedirect("vendorjoin.jsp");
			session.setAttribute("vLogin", "error");
			return;
		}

		
		
		GetInfo info = new GetInfo();
		int value = info.newVendor(password1, password2, email, businessName, businessEmail, city, state, zip, category,
				businessWebsite, businessFacebook, businessInstagram, businessPintrest, businessYoutube, businessTwitter, businessProfile,
				startingPackage, topPackage);

		switch (value) {

		// user name is in DB,
		case 1:
			session.setAttribute("vLogin", "userInDb");
			response.sendRedirect("join.jsp");
			return;

		// user name not in DB, user name less then 4 characters
		case 2:
			session.setAttribute("vLogin", "userTooSmall");
			response.sendRedirect("join.jsp");
			return;

		// user password to small
		case 3:
			session.setAttribute("vLogin", "passTooSmall");
			response.sendRedirect("join.jsp");
			return;

		// user name not in DB, longer then 4, passwords match
		case 4:
			session.setAttribute("vLogin", "passfail");
			response.sendRedirect("join.jsp");
			return;

		// email not valid or blank
		case 5:
			session.setAttribute("vLogin", "emailFail");
			response.sendRedirect("join.jsp");
			return;

		// all good, user registered
		case 6:
			session.setAttribute("vLogin", "loggedIn");
			response.sendRedirect("vendors.jsp");
			return;

		default:
			session.setAttribute("vLogin", "error");
			session.setAttribute("login", "null");
			response.sendRedirect("join.jsp");
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
