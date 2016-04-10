package sql;
import java.sql.*;

public class MkUser  {

	public  synchronized void writeSql(String password, String email, String firstName, String lastName, String city, String state, String zip, String role, String weddingDate){

		try {
			// create a mysql database connection
			Class.forName(DbLogin.myDriver);
			Connection conn = DriverManager.getConnection(DbLogin.myUrl, DbLogin.SQLuser, DbLogin.SQLpass);

			// the mysql insert statement
			String query = " INSERT INTO Users (email, password) VALUES (?,?)";

			// create the mysql insert prepared statement
			PreparedStatement st = conn.prepareStatement(query);
			
			st.setString(1, email);
//			st.setString(2, DbLogin.dbKey);
			st.setNString(2, password);
			// execute the prepared statement
			st.execute();
			
			
			
			String query2 = " INSERT INTO clientProfile (email, firstName, lastName, city, state, zip, role, weddingDate)"
					+ " values (?, ?,?,?,?,?,?,?)";
			
			java.util.Date result = new java.util.Date(weddingDate);
			java.sql.Date dataSql = new java.sql.Date(result.getTime());
			
			
			// create the mysql insert prepared statement
			PreparedStatement preparedStmt2 = conn.prepareStatement(query2);
			
			preparedStmt2.setString (1, email);
			preparedStmt2.setString (2, firstName);
			preparedStmt2.setString (3, lastName);
			preparedStmt2.setString (4, city);
			preparedStmt2.setString (5, state);
			preparedStmt2.setString (6, zip);
			preparedStmt2.setString (7, role);
			preparedStmt2.setDate (8, dataSql);
			
			// execute the prepared statement
			preparedStmt2.execute();
			
			String query3 = " INSERT INTO clientChecklist (id, email) VALUES (?,?)";

			// create the mysql insert prepared statement
			PreparedStatement st3 = conn.prepareStatement(query3);
			
			st3.setNString(1, null);
			st3.setString(2, email);
			
			st3.execute();
			
			

			conn.close();
		}
		catch (Exception e)
		{
			System.err.println("Got an exception!");
			System.err.println(e.getMessage());
		}
	}
}


