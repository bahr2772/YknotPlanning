package clientData;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Budget;
import model.User;
import model.Vendor;

/**
 * Servlet implementation class VendorMatchesServlet
 */
@WebServlet("/VendorMatchesServlet")
public class VendorMatchesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VendorMatchesServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Vendor> matchedVendors = new ArrayList<Vendor>();



		Budget bud = (Budget)request.getSession().getAttribute("budget");
		if(bud != null){

			User user = (User)request.getSession().getAttribute("client");
			ArrayList<Vendor> vendor = (ArrayList<Vendor>) request.getSession().getAttribute("vendorList");

			FindVendorMatches find = new FindVendorMatches();
			request.getSession().setAttribute("matchedVendors", find.matchMaker(bud, user, vendor));
		}
		else
			request.getSession().setAttribute("matchedVendors", null);


		response.sendRedirect("matches.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
