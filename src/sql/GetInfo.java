package sql;


import java.sql.*;

import model.User;
import model.Vendor;

public class GetInfo {


	

	// lost pass get from email or user name
	public String getLostPass(String username, String email){

		try
		{
			Class.forName(DbLogin.myDriver);
			Connection conn = DriverManager.getConnection(DbLogin.myUrl,  DbLogin.SQLuser, DbLogin.SQLpass);

			PreparedStatement st = conn.prepareStatement("SELECT * FROM Customers WHERE username = ? or email = ?");
			st.setString(1, username);
			st.setString(2, email);
			ResultSet r1=st.executeQuery();


			while(r1.next()) 
			{
				String user =  r1.getString("username");
				String dbEmail = r1.getString("email");
				String password = r1.getString("password");


				if(username.equalsIgnoreCase(user) || email.equals(dbEmail) ) 
				{

					String foundUser = "User found. \n Your password is: " + password;
					return foundUser;
				}

			}
		}

		catch (SQLException e) 
		{
			System.out.println("SQL Exception: "+ e.toString());
		} 
		catch (ClassNotFoundException cE) 
		{
			System.out.println("Class Not Found Exception: "+ cE.toString());
		}

		return "User not found";
	}


	// login checker  \\
	public int clientLogin (String Email, String password, User userModel){
		
		try
		{

			Class.forName(DbLogin.myDriver);
			Connection conn = DriverManager.getConnection(DbLogin.myUrl,  DbLogin.SQLuser, DbLogin.SQLpass);

			PreparedStatement st = conn.prepareStatement("SELECT * FROM Users WHERE email = ? AND password = ?");
			st.setString(1, Email);
			st.setString(2, password);

			ResultSet r1=st.executeQuery();
			
				String client = "client";
				String vendor = "vendor";

				if(r1.next()) 
				{	
					userModel.setEmail(Email);
					return 1;
				}
		}
		catch (SQLException e) 
		{
			System.out.println("SQL Exception: "+ e.toString());
		} 
		catch (ClassNotFoundException cE) 
		{
			System.out.println("Class Not Found Exception: "+ cE.toString());
		}
		return 3;

	}

public int vendorLogin (String Email, String password, Vendor vendorModel){
		
		try
		{

			Class.forName(DbLogin.myDriver);
			Connection conn = DriverManager.getConnection(DbLogin.myUrl,  DbLogin.SQLuser, DbLogin.SQLpass);

			PreparedStatement st = conn.prepareStatement("SELECT * FROM Vendors WHERE email = ? AND password = ?");
			st.setString(1, Email);
			st.setString(2, password);

			ResultSet r1=st.executeQuery();
			
				String client = "client";
				String vendor = "vendor";

				if(r1.next()) 
				{	
					vendorModel.setEmail(Email);
					return 1;
				}
		}
		catch (SQLException e) 
		{
			System.out.println("SQL Exception: "+ e.toString());
		} 
		catch (ClassNotFoundException cE) 
		{
			System.out.println("Class Not Found Exception: "+ cE.toString());
		}
		return 3;

	}

	
	

	// check user name exist for register \\
	public boolean VendorCredChecker(String email, String table ){

		boolean usernameExists = false;

		try
		{
			Class.forName(DbLogin.myDriver);
			Connection conn = DriverManager.getConnection(DbLogin.myUrl, DbLogin.SQLuser, DbLogin.SQLpass);

			PreparedStatement st = conn.prepareStatement("SELECT * FROM Vendors WHERE email = ? ");
//			st.setString(1, table);
			st.setString(1, email);
			ResultSet r1=st.executeQuery();

			String dbEmail;

			while(r1.next()) 
			{
				dbEmail =  r1.getString("email");
				if(email.equalsIgnoreCase(dbEmail)) 
					usernameExists = true;
			}
		}

		catch (SQLException e) 
		{
			System.out.println("SQL Exception: "+ e.toString());
		} 
		catch (ClassNotFoundException cE) 
		{
			System.out.println("Class Not Found Exception: "+ cE.toString());
		}

		return usernameExists;
	}
	public boolean ClientCredChecker(String email, String table ){

		boolean usernameExists = false;

		try
		{
			Class.forName(DbLogin.myDriver);
			Connection conn = DriverManager.getConnection(DbLogin.myUrl, DbLogin.SQLuser, DbLogin.SQLpass);

			PreparedStatement st = conn.prepareStatement("SELECT * FROM Users WHERE email = ? ");
//			st.setString(1, table);
			st.setString(1, email);
			ResultSet r1=st.executeQuery();

			String dbEmail;

			while(r1.next()) 
			{
				dbEmail =  r1.getString("email");
				if(email.equalsIgnoreCase(dbEmail)) 
					usernameExists = true;
			}
		}

		catch (SQLException e) 
		{
			System.out.println("SQL Exception: "+ e.toString());
		} 
		catch (ClassNotFoundException cE) 
		{
			System.out.println("Class Not Found Exception: "+ cE.toString());
		}

		return usernameExists;
	}

	public int newClient(String password1, String password2, String email, String firstName, String lastName, String city, 
			String state, String zip, String role, String weddingDate){

		
		
		boolean check = ClientCredChecker(email,"Users");


		// user name found (true)
		if(check) 
			return 1;

		// check user name is smaller then 4
		if(email.length() < 4 ){
			System.out.println("email to small");
			return 2;
			//password to short
		}else if(password1.length() < 2){
			System.out.println("password too short");
			return 3;
			
		}else if(!password1.equals(password2)){
			System.out.println("password not match");
			return 4;
			// check passwords match
		}else if(!email.contains("@") || email.contains(" ,\\/()=|}]{[\"\';:<>`~")){
			System.out.println("Invalid Email");
			return 5;
		}else {
			System.out.println("user sent");
			
			MkUser newUser = new MkUser();
			
			newUser.writeSql( password1, email,  firstName, 
					lastName,  city,  state,  zip,  role,  weddingDate);

			System.out.println("User created");
			return 6;
		}


	}
	
	
	public void updateProfile(String username, String password, String email, String firstName, String lastName, String phoneNum, String address, String city, String state, String zip){

		try {
			
			Class.forName(DbLogin.myDriver);
			Connection conn = DriverManager.getConnection(DbLogin.myUrl, DbLogin.SQLuser, DbLogin.SQLpass);


			// the mysql insert statement
			String query = " UPDATE Customers SET password = ?, email = ?, first_name = ?, "
					+ "last_name = ?, phone = ?, address = ?, state = ?, city = ?, zip = ? WHERE Customers.username = ?";



			// create the mysql insert prepared statement
			PreparedStatement preparedStmt = conn.prepareStatement(query);
			preparedStmt.setString (1, password);
			preparedStmt.setString (2, email);
			preparedStmt.setString (3, firstName);
			preparedStmt.setString (4, lastName);
			preparedStmt.setString (5, phoneNum);
			preparedStmt.setString (6, address);
			preparedStmt.setString (7, state);
			preparedStmt.setString (8, city);
			preparedStmt.setString (9, zip);
			preparedStmt.setString (10, username);

			preparedStmt.execute();




			PreparedStatement st = conn.prepareStatement("SELECT * FROM Customers WHERE username = ?");
			st.setString (1, username);
			
			ResultSet r1=st.executeQuery();


			
			String user;
			String pass;

			
			while(r1.next()) 
			{

				user =  r1.getString("username");
				pass = r1.getString("password");

				email =  r1.getString("email");
				firstName =  r1.getString("first_name");
				lastName = r1.getString("last_name");
				address = r1.getString("address");
				city =  r1.getString("city");
				state = r1.getString("state");
				zip = r1.getString("zip");
				phoneNum =  r1.getString("phone");

			}
			conn.close();
		}
		catch (Exception e)
		{
			System.err.println("Got an exception!");
			System.err.println(e.getMessage());
		}
	}


	public int newVendor(String password1, String password2, String email, String businessName, String businessEmail,
			String city, String state, String zip, String category, String businessWebsite, String businessFacebook, String businessInstagram, 
			String businessPintrest, String businessYoutube, String businessTwitter, String businessProfile, String startingPackage, String maxPackage, String about) {

		boolean check = VendorCredChecker(email,"Vendors");


		// user name found (true)
		if(check) 
			return 1;

		// check user name is smaller then 4
		if(email.length() < 4 ){
			System.out.println("email to small");
			return 2;
			//password to short
		}else if(password1.length() < 2){
			System.out.println("password too short");
			return 3;
			
		}else if(!password1.equals(password2)){
			System.out.println("password not match");
			return 4;
			// check passwords match
		}else if(!email.contains("@") || email.contains(" ,\\/()=|}]{[\"\';:<>`~")){
			System.out.println("Invalid Email");
			return 5;
		}else {
			System.out.println("user sent");
			
			MkVendor newVendor = new MkVendor();
			
			newVendor.writeSql( password1, email,  businessName, 
					businessEmail,  city,  state,  zip,  category,  businessWebsite, businessFacebook, businessInstagram, businessPintrest
					,businessYoutube, businessTwitter, businessProfile, startingPackage, maxPackage, about);

			return 6;
		}
	}


		


}//close class





