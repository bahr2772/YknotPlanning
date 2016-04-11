package login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Vendor;
import sql.UpdateVendor;

/**
 * Servlet implementation class VendorUpdateServlet
 */
@WebServlet("/VendorUpdateServlet")
public class VendorUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VendorUpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		String email = request.getParameter("email");
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

		boolean nullChecker = false;

		if (email == null || email.isEmpty() || !email.contains("@") || email.contains("\",.<>?/;:'[]{}|=&%$^")) {
			session.setAttribute("email", "Email");
			nullChecker = true;
		}

		if (businessName == null || businessName.isEmpty() ){
			session.setAttribute("businessName", "Business Name");
			nullChecker = true;
		}
		if (businessEmail == null || businessEmail.isEmpty() || !businessEmail.contains("@") || businessEmail.contains("\",.<>?/;:'[]{}|=&%$^")) {
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
		if (zip == null || zip.isEmpty() || zip.length() < 5) {
			session.setAttribute("zip", "Zip");
			nullChecker = true;
		}
		if (category == null || category.isEmpty()) {
			session.setAttribute("category", "Vendor Category");
			nullChecker = true;
		}


		Vendor vendor = new Vendor();

			vendor.setEmail(email);
			vendor.setBusinessName(businessName);
			vendor.setBusinessEmail(businessEmail);
			vendor.setCity(city);
			vendor.setState(state);
			vendor.setZip(zip);
			vendor.setCategory(category);
			vendor.setBusinessWebsite(businessWebsite);
			vendor.setFacebook(businessFacebook);
			vendor.setInstagram(businessInstagram);
			vendor.setPintrest(businessPintrest);
			vendor.setTwitter(businessTwitter);
			vendor.setYoutube(businessYoutube);
			vendor.setProfileImg(businessProfile);
			vendor.setStartingPackage(startingPackage);
			vendor.setMaxPackage(topPackage);

		if (nullChecker) {
			response.sendRedirect("vendorprofile.jsp");
			session.setAttribute("vpro", "error");
			return;
		}
		
		UpdateVendor update = new UpdateVendor();
		update.updateVendor(email, businessName, businessEmail, category, city, state, zip, businessWebsite, businessFacebook, businessInstagram, businessPintrest, businessTwitter, businessYoutube, startingPackage, topPackage, businessProfile);
		
		session.setAttribute("vendor", vendor);
		
		session.setAttribute("vpro", "success");
		response.sendRedirect("vendorprofile.jsp");




	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
