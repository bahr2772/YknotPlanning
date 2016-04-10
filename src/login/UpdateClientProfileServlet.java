package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import sql.UpdateProfile;

/**
 * Servlet implementation class UpdateClientProfileServlet
 */
@WebServlet("/UpdateClientProfileServlet")
public class UpdateClientProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateClientProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zip = request.getParameter("zip");
		String role = request.getParameter("role");
		String weddingDate = request.getParameter("weddingDate");

		UpdateProfile update = new UpdateProfile();
		
		update.updateProfile(email, firstName, lastName, role, weddingDate, city, state, zip);
		

		 User user = (User) request.getSession().getAttribute("client");
		
		user.setEmail(email);
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setCity(city);
		user.setState(state);
		user.setZip(zip);
		user.setRole(role);
		user.setWeddingDate(weddingDate);
		
		request.getSession().setAttribute("client", user);
		
		
		request.getSession().setAttribute("update", "yes");
		
		
		response.sendRedirect("editprofile.jsp");
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
