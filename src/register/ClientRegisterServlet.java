package register;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import sql.GetInfo;

/**
 * Servlet implementation class ClientRegisterServlet
 */
@WebServlet("/ClientRegisterServlet")
public class ClientRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		String email = request.getParameter("email");
		String password1 = request.getParameter("password");
		String password2 = request.getParameter("confirmPassword");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zip = request.getParameter("zip");
		String role = request.getParameter("role");
		String weddingDate = request.getParameter("weddingDate");

		User user = new User();
		
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setCity(city);
		user.setState(state);
		user.setZip(zip);
		user.setRole(role);
		user.setWeddingDate(weddingDate);
		user.setPassword(password1);
		user.setEmail(email);

		request.getSession().setAttribute("client", user);


		GetInfo info = new GetInfo();
		int value = info.newClient(password1, password2, email, firstName, lastName, city, state, zip, role, weddingDate);

		switch(value){

		// user name is in DB,
		case 1  :
			session.setAttribute("login", "userInDb");
			response.sendRedirect("join.jsp");
			return;

			// user name not in DB, user name less then 4 characters
		case 2:
			session.setAttribute("login", "userTooSmall");
			response.sendRedirect("join.jsp");
			return;

			// user password to small
		case 3:
			session.setAttribute("login", "passTooSmall");
			response.sendRedirect("join.jsp");
			return;

			// user name not in DB, longer then 4, passwords match
		case 4:
			session.setAttribute("login", "passfail");
			response.sendRedirect("join.jsp");
			return;


			// email not valid or blank
		case 5:
			session.setAttribute("login", "emailFail");
			response.sendRedirect("join.jsp");
			return;

			// all good, user registered
		case 6:
			session.setAttribute("login", "loggedIn");
			session.setAttribute("email", email);
			response.sendRedirect("client.jsp");
			return;

		default:
			session.setAttribute("login", "error");
			response.sendRedirect("join.jsp");
			return;
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
