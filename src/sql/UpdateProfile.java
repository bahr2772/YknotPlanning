package sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class UpdateProfile {

	public void updateProfile(String email, String firstName, String lastName,
				String role, String weddingDate, String city, String state, String zip){

		try {
			
			Class.forName(DbLogin.myDriver);
			Connection conn = DriverManager.getConnection(DbLogin.myUrl, DbLogin.SQLuser, DbLogin.SQLpass);


			// the mysql insert statement
			String query = "UPDATE clientProfile SET firstName = ?, lastName = ?, city = ?, state = ?, zip = ?, role = ?, weddingDate = ? WHERE email = ?";

			

			// create the mysql insert prepared statement
			PreparedStatement preparedStmt = conn.prepareStatement(query);
			preparedStmt.setString (1, firstName);
			preparedStmt.setString (2, lastName);
			preparedStmt.setString (3, city);
			preparedStmt.setString (4, state);
			preparedStmt.setString (5, zip);
			preparedStmt.setString (6, role);

			
			java.util.Date result = new java.util.Date(weddingDate);
			java.sql.Date dataSql = new java.sql.Date(result.getTime());
			
			
			preparedStmt.setDate (7, dataSql);

			preparedStmt.setString (8, email);

			 preparedStmt.executeUpdate();
		       
		      conn.close();

		}catch (Exception e){
			
		}
	}
	
}
