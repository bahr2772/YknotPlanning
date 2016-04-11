package sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Vendor;

public class MakeVendorList {

	
	Vendor vendors;
	ArrayList<Vendor> vendorList;
	
	public ArrayList<Vendor> makeList(){
		
		vendorList = new ArrayList<Vendor>();
		
		try
		{
			Class.forName(DbLogin.myDriver);
			Connection conn = DriverManager.getConnection(DbLogin.myUrl,  DbLogin.SQLuser, DbLogin.SQLpass);

			PreparedStatement st = conn.prepareStatement("SELECT * FROM vendorProfile");
			ResultSet r1=st.executeQuery();


			if (!r1.next() ) {
			    System.out.println("no data");
			} else {

			    do {
			    	vendors = new Vendor();
					
					vendors.setBusinessEmail(r1.getString("businessEmail"));
					vendors.setBusinessName(r1.getString("businessName"));
					vendors.setBusinessWebsite(r1.getString("businessWebsite"));
					vendors.setCategory(r1.getString("category"));
					vendors.setCity(r1.getString("city"));
					vendors.setState(r1.getString("state"));
					vendors.setZip(r1.getString("zip"));
					vendors.setProfileImg(r1.getString("profileImg"));
					vendors.setStartingPackage(r1.getString("startingPackage"));
					vendors.setMaxPackage(r1.getString("topPackage"));
					
					vendors.setFacebook(r1.getString("facebook"));
					vendors.setTwitter(r1.getString("twitter"));
					vendors.setPintrest(r1.getString("pintrest"));
					vendors.setInstagram(r1.getString("instagram"));
					vendors.setYoutube(r1.getString("youtube"));

					vendorList.add(vendors);
			    } while (r1.next());
			}
			r1.close();
			st.close();
			conn.close();
			return vendorList;
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
