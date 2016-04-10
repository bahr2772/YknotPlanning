package login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Vendor;
import sql.GetInfo;

/**
 * Servlet implementation class VendorLogin
 */
@WebServlet("/VendorLogin")
public class VendorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VendorLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("Vendor login");
		
		GetInfo check = new GetInfo();
		
		Vendor vendor = new Vendor();
		



		HttpSession session = request.getSession();

		vendor.setEmail(request.getParameter("email"));
		vendor.setPassword(request.getParameter("password"));

		String[] checkBox = request.getParameterValues("box");
		boolean useCookies = (checkBox!=null && checkBox[0].equals("remember"));

		session.removeAttribute("login");
		session.removeAttribute("vLogin");
		session.removeAttribute("passcheck");

		String email = vendor.getEmail();
		String password = vendor.getPassword();

		
		if(password == null || password == ""){
			session.setAttribute("login", "passFail");
			response.sendRedirect("login.jsp");
			return ;
		}


		int value = check.vendorLogin(email, password, vendor);

		System.out.println(value);

		switch(value){

		// user name is in DB, password correct, login
		case 1:
			if (useCookies){								// user has chosen to be remembered
				Cookie cookieE = new Cookie("vendoremail",email);
				Cookie cookieP = new Cookie("vendorpassword",password);
				cookieE.setMaxAge(60*60*24); 				// expires after 24 hours
				cookieP.setMaxAge(60*60*24); 				// expires after 24 hours
				response.addCookie(cookieE);
				response.addCookie(cookieP);
			}
			
			session.setAttribute("vLogin", "loggedIn");
			session.setAttribute("login", "");
			response.sendRedirect("vendors.jsp");
			return ; 


			// user name is in DB, password incorrect
		case 2:
			session.setAttribute("vLogin", "passFail");
			response.sendRedirect("vendorlogin.jsp");
			return ;

			// user name not in DB
		case 3:
			session.setAttribute("vLogin", "noUser");
			response.sendRedirect("vendorlogin.jsp");
			return ;


		}

		response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
