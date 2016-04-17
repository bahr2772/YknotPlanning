package sql;
import java.sql.*;

public class MkVendor  {

	public  synchronized void writeSql(String password, String email, String businessName, String businessEmail, String city, 
			String state, String zip, String category, 	String businessWebsite, String businessFacebook, String businessInstagram,
			String businessPintrest,String businessYoutube, String businessTwitter, String businessProfile, String startingPackage, String topPackage, String about){

		try {
			// create a mysql database connection
			Class.forName(DbLogin.myDriver);
			Connection conn = DriverManager.getConnection(DbLogin.myUrl, DbLogin.SQLuser, DbLogin.SQLpass);
			// the mysql insert statement
			String query = " INSERT INTO Vendors (email, password) VALUES (?, ?)";

			// create the mysql insert prepared statement
			PreparedStatement st = conn.prepareStatement(query);
			
			st.setString(1, email);
			st.setNString(2, password);

			// execute the prepared statement
			st.execute();
			
			
			String query2 = " INSERT INTO vendorProfile (email, businessName, businessEmail, city, state, zip, category, businessWebsite,"
					+ "facebook, instagram, pintrest, youtube, twitter, profileImg, startingPackage, topPackage, about)"
					+ " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			
			// create the mysql insert prepared statement
			PreparedStatement preparedStmt2 = conn.prepareStatement(query2);
			
			preparedStmt2.setString (1, email);
			preparedStmt2.setString (2, businessName);
			preparedStmt2.setString (3, businessEmail);
			preparedStmt2.setString (4, city);
			preparedStmt2.setString (5, state);
			preparedStmt2.setString (6, zip);
			preparedStmt2.setString (7, category);
			preparedStmt2.setString (8, businessWebsite);
			preparedStmt2.setString (9, businessFacebook);
			preparedStmt2.setString (10, businessInstagram);
			preparedStmt2.setString (11, businessPintrest);
			preparedStmt2.setString (12, businessYoutube);
			preparedStmt2.setString (13, businessTwitter);
			preparedStmt2.setString (14, businessProfile);
			preparedStmt2.setString (15, startingPackage);
			preparedStmt2.setString (16, topPackage);
			preparedStmt2.setString (17, about);


			
			
			// execute the prepared statement
			preparedStmt2.execute();
			
			

			conn.close();
		}
		catch (Exception e)
		{
			System.err.println("Got an exception!");
			System.err.println(e.getMessage());
		}
	}
}


