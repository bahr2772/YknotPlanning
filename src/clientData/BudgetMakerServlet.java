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
import sql.UpdateChecklist;

/**
 * Servlet implementation class BudgetMakerServlet
 */
@WebServlet("/BudgetMakerServlet")
public class BudgetMakerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BudgetMakerServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String max = request.getParameter("maxbudget");
		User user = (User) request.getSession().getAttribute("client");

		user.setBudget(max);

		CreateBudget budget = new CreateBudget();
		Budget bud = budget.budget(Double.parseDouble(user.getBudget()));
		request.getSession().setAttribute("budget", bud);

		UpdateChecklist update = new UpdateChecklist();
		update.updateProfile(user.getEmail(), user.getChecklist(), user.getBudget());

		response.sendRedirect("budgetform.jsp");


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
