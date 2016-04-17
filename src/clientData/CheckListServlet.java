package clientData;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import sql.UpdateChecklist;

/**
 * Servlet implementation class CheckListServlet
 */
@WebServlet("/CheckListServlet")
public class CheckListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		String checklist = "";
		User user = (User) request.getSession().getAttribute("client");
		String x;
		
		for(int i = 0; i < 41; i++){
		x =	request.getParameter("c"+(Integer.toString(i)));
		
		if(x == null)	
			checklist = checklist + "0";
		else
			checklist = checklist + x;
			
		}
		
//		String[] checks;
//		
//		checks = request.getParameterValues(arg0)
		
		String budget = user.getBudget();
		
		UpdateChecklist update = new UpdateChecklist();
		update.updateProfile(user.getEmail(), checklist, budget);
		
		
		user.setChecklist(checklist);
		
		
		java.util.Date result = new java.util.Date(user.getWeddingDate());
		java.sql.Date dataSql = new java.sql.Date(result.getTime());
		
		DateSetter set = new DateSetter();
		set.dates(user, dataSql);
		
		
		
		for(int i = 0; i < user.getChecklist().length(); i++){
			String checkboxValue = user.getChecklist().charAt(i)+"";
			session.setAttribute("c"+Integer.toString(i), checkboxValue);
		}
		
		
		session.setAttribute("update", "yes");
		response.sendRedirect("weddingchecklist.jsp");
		return ; 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
