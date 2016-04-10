package sql;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import model.User;
import model.Vendor;

public class MakeClient {

	
	
	
	public User clientInfo(String clientEmail, User user) {

//		ArrayList<User> client = new ArrayList<User>();


		try
		{
			Class.forName(DbLogin.myDriver);
			Connection conn = DriverManager.getConnection(DbLogin.myUrl,  DbLogin.SQLuser, DbLogin.SQLpass);

			PreparedStatement st = conn.prepareStatement("SELECT * FROM clientProfile P, checklist L  WHERE P.email = ? AND L.email = ?");
			
			st.setString(1, clientEmail);
			st.setString(2, clientEmail);

			ResultSet r1=st.executeQuery();


			while (r1.next()){


				user.setEmail(r1.getString("email"));
				user.setFirstName(r1.getString("firstName"));
				user.setLastName(r1.getString("lastName"));
				user.setCity(r1.getString("city"));
				user.setState(r1.getString("state"));
				user.setZip(r1.getString("zip"));
				user.setRole(r1.getString("role"));
				user.setChecklist(r1.getString("checklist"));
				user.setBudget(r1.getString("budget"));
				Date date = r1.getDate("weddingDate"); 
				DateFormat df = new SimpleDateFormat("EEEE MMMM dd, yyyy");
				String text = df.format(date);
				
				user.setWeddingDate(text);

//				client.add(user);
				
				


			}

			r1.close();
			st.close();
			conn.close();
			return user;
		}

		catch (SQLException e) 
		{
			System.out.println("SQL Exception: "+ e.toString());
		} 
		catch (ClassNotFoundException cE) 
		{
			System.out.println("Class Not Found Exception: "+ cE.toString());
		}

		return null;
	}

}
