package sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class UpdateChecklist {

	public void updateProfile(String email, String checklist, String budget){

		try {

			Class.forName(DbLogin.myDriver);
			Connection conn = DriverManager.getConnection(DbLogin.myUrl, DbLogin.SQLuser, DbLogin.SQLpass);

			

			// the mysql insert statement
			String query = "UPDATE checklist SET checklist = ?, budget = ? WHERE email = ?";
			PreparedStatement preparedStmt = conn.prepareStatement(query);

			preparedStmt.setString (1, checklist);
			preparedStmt.setString (2, budget);
			preparedStmt.setString (3, email);

			preparedStmt.executeUpdate();



			// create the mysql insert prepared statement
			conn.close();
		}catch (Exception e){

		}
	}


}
