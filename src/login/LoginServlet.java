package login;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import clientData.CreateBudget;
import clientData.FindVendorMatches;
import clientData.VendorMatchesServlet;
import model.Budget;
import model.User;
import model.Vendor;
import sql.GetInfo;
import sql.MakeClient;
import sql.MakeVendorList;
import sun.util.calendar.CalendarDate;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GetInfo check = new GetInfo();
		
		User user = new User();
		



		HttpSession session = request.getSession();

		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));

		String[] checkBox = request.getParameterValues("box");
		boolean useCookies = (checkBox!=null && checkBox[0].equals("remember"));

		session.removeAttribute("login");
		session.removeAttribute("passcheck");

		String email = user.getEmail();
		String password = user.getPassword();

		if(password == null || password == ""){
			session.setAttribute("login", "passFail");
			response.sendRedirect("login.jsp");
			return ;
		}


		int value = check.clientLogin(email, password, user);

		System.out.println(value);

		switch(value){

		// user name is in DB, password correct, login
		case 1:
			MakeVendorList mkList = new MakeVendorList();
			MakeClient mkClient = new MakeClient();
			
			User client = mkClient.clientInfo(email,user);
			
			session.setAttribute("matchedVendors", null);
			session.setAttribute("vendorList", mkList.makeList());
			session.setAttribute("client", client);

			for(int i = 0; i < user.getChecklist().length(); i++){
				String checkboxValue = user.getChecklist().charAt(i)+"";
				session.setAttribute("c"+Integer.toString(i), checkboxValue);
			}
			
			CreateBudget budget = new CreateBudget();
			Budget bud = budget.budget(Double.parseDouble(user.getBudget()));
			request.getSession().setAttribute("budget", bud);
			
			ArrayList<Vendor> vendor = (ArrayList<Vendor>) request.getSession().getAttribute("vendorList");

			FindVendorMatches find = new FindVendorMatches();
			request.getSession().setAttribute("matchedVendors", find.matchMaker(bud, user, vendor));
			
//			session.setAttribute("vendorList", mkList.makeList());

			if (useCookies){								// user has chosen to be remembered
				Cookie cookieE = new Cookie("clientemail",email);
				Cookie cookieP = new Cookie("clientpassword",password);
				cookieE.setMaxAge(60*60*24); 				// expires after 24 hours
				cookieP.setMaxAge(60*60*24); 				// expires after 24 hours
				response.addCookie(cookieE);
				response.addCookie(cookieP);
			}
		
			
			session.setAttribute("login", "loggedIn");
			response.sendRedirect("budgetsurvey.jsp");
			return ; 


			// user name is in DB, password incorrect
		case 2:
			session.setAttribute("login", "passFail");
			response.sendRedirect("login.jsp");
			return ;

			// user name not in DB
		case 3:
			session.setAttribute("login", "noUser");
			response.sendRedirect("login.jsp");
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
