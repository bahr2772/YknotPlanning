package clientData;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Vendor;

/**
 * Servlet implementation class search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Search() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<Vendor> searchRs = new ArrayList<Vendor>();

		String search = request.getParameter("searchBar");
		String type = request.getParameter("u");

		if(type !=null)
			search = type;



		ArrayList<Vendor> vendors = (ArrayList<Vendor>) request.getSession().getAttribute("vendorList");

		for(int i = 0; i < vendors.size(); i++){
			Vendor ven = vendors.get(i);


			String searchParm = (ven.getBusinessEmail().toUpperCase() + " " + ven.getBusinessName().toUpperCase() + " " + ven.getBusinessWebsite().toUpperCase() + " " + ven.getCategory().toUpperCase() + " " + ven.getCity().toUpperCase()
					+ " " + ven.getFacebook().toUpperCase() + " " + ven.getInstagram().toUpperCase() + " " + ven.getMaxPackage().toUpperCase() + " " + ven.getPintrest().toUpperCase() + " " +ven.getStartingPackage().toUpperCase() + " " + 
					ven.getState().toUpperCase() + " " + ven.getTwitter().toUpperCase() + " " + ven.getYoutube().toUpperCase() + " " + ven.getZip().toUpperCase());
					
					
			if(searchParm.toUpperCase().contains(search.toUpperCase())){
				searchRs.add(vendors.get(i));														
			}

		}





		request.getSession().setAttribute("resultList", searchRs);
		response.sendRedirect("search.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
