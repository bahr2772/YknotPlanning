package login;

import mail.SendEmail;

public class LostPassThread extends Thread{
	
	private String msg;
	private String userEmail;
	
	public LostPassThread(String userEmail, String pass){
		this.userEmail = userEmail;
		
		 msg = "Hey, we told you that we would help. You password is:   " + pass;
		
	}
	
	public void run(){
		SendEmail email = new SendEmail();
		
		email.sendEmail(msg, userEmail);
		
		
	}
	
	

}
