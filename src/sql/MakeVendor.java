package sql;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Vendor;


public class MakeVendor {





	public Vendor vendorInfo(String clientEmail, Vendor ven) {

		try
		{
			Class.forName(DbLogin.myDriver);
			Connection conn = DriverManager.getConnection(DbLogin.myUrl,  DbLogin.SQLuser, DbLogin.SQLpass);

			PreparedStatement st = conn.prepareStatement("SELECT * FROM vendorprofile P  WHERE P.email = ?");

			st.setString(1, clientEmail);

			ResultSet r1=st.executeQuery();


			while (r1.next()){


				ven.setEmail(r1.getString("email"));
				ven.setBusinessName(r1.getString("businessName"));
				ven.setBusinessEmail(r1.getString("businessEmail"));
				ven.setCity(r1.getString("city"));
				ven.setState(r1.getString("state"));
				ven.setZip(r1.getString("zip"));
				ven.setCategory(r1.getString("category"));
				ven.setBusinessWebsite(r1.getString("businessWebsite"));
				ven.setInstagram(r1.getString("instagram"));
				ven.setPintrest(r1.getString("pintrest"));
				ven.setYoutube(r1.getString("youtube"));
				ven.setTwitter(r1.getString("twitter"));
				ven.setProfileImg(r1.getString("profileImg"));		
				ven.setStartingPackage(r1.getString("startingPackage"));
				ven.setMaxPackage(r1.getString("topPackage"));
				ven.setAbout(r1.getString("about"));


			}

			r1.close();
			st.close();
			conn.close();
			return ven;
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


