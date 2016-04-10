package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mail.SendEmail;
import sql.DbLogin;

public class RetriveAndSend {

	
	public String retrivePass(String ClientEmail){
		
		try
		{
			Class.forName(DbLogin.myDriver);
			Connection conn = DriverManager.getConnection(DbLogin.myUrl, DbLogin.SQLuser, DbLogin.SQLpass);

			PreparedStatement st = conn.prepareStatement("SELECT * FROM Users WHERE email = ? ");
			st.setString(1, ClientEmail);
			ResultSet r1=st.executeQuery();
			
			PreparedStatement st2 = conn.prepareStatement("SELECT * FROM Vendors WHERE email = ? ");
			st2.setString(1, ClientEmail);
			ResultSet r2=st2.executeQuery();
			

			String dbEmail;
			String dbPass;
			
			while(r1.next() || r2.next()) 
			{
				dbEmail =  r1.getString("email");
				dbPass = r1.getString("password");
				
				if(ClientEmail.equalsIgnoreCase(dbEmail)) 
				{
					return dbPass;
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

		
		return "User not Found";
		
	}
	
}
