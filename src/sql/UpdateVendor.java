package sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class UpdateVendor {

	public void updateVendor(String email, String businessName, String businessEmail,
				String category,  String city, String state, String zip, String businessWebsite
				, String facebook, String instagram, String pintrest, String twitter, String youtube, 
				String startingPackage, String topPackage, String profileImg){

		try {
			
			Class.forName(DbLogin.myDriver);
			Connection conn = DriverManager.getConnection(DbLogin.myUrl, DbLogin.SQLuser, DbLogin.SQLpass);


			// the mysql insert statement
			String query = "UPDATE vendorProfile SET businessName = ?, businessEmail = ?, city = ?, state = ?, zip = ?, category = ?, "
					+ "facebook = ?, instagram = ?, pintrest = ?, twitter = ? youtube = ?, startingPackage = ?"
					+ ", topPackage = ?, profileImg = ? WHERE email = ?";

			

			// create the mysql insert prepared statement
			PreparedStatement preparedStmt = conn.prepareStatement(query);
			preparedStmt.setString (1, businessName);
			preparedStmt.setString (2, businessEmail);
			preparedStmt.setString (3, city);
			preparedStmt.setString (4, state);
			preparedStmt.setString (5, zip);
			preparedStmt.setString (6, category);
			preparedStmt.setString (7, facebook);
			preparedStmt.setString (8, instagram);
			preparedStmt.setString (9, pintrest);
			preparedStmt.setString (10, twitter);
			preparedStmt.setString (11, youtube);
			preparedStmt.setString (12, startingPackage);
			preparedStmt.setString (13, topPackage);
			preparedStmt.setString (14, profileImg);
			preparedStmt.setString (15, email);

			 preparedStmt.executeUpdate();
		       
		      conn.close();

		}catch (Exception e){
			
		}
	}
	
}
