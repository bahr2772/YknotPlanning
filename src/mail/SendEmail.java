package mail;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class SendEmail {

//MAIN METHOD 

public boolean sendEmail(String emailMessage, String clientEmail){

        try{
            final String fromEmail = "justin@yknotstudios.com"; //requires valid gmail id
            final String password = "506NAStreet"; // correct password for gmail id
            final String toEmail = clientEmail; // can be any email id 

            System.out.println("TLSEmail Start");
            Properties props = new Properties();
            props.put("mail.smtp.host", "mail.yknotstudios.com"); //SMTP Host
            props.put("mail.smtp.port", "587"); //TLS Port 587
            props.put("mail.smtp.auth", "true"); //enable authentication
            props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS

                //create Authenticator object to pass in Session.getInstance argument
            Authenticator auth = new Authenticator() {
                //override the getPasswordAuthentication method
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            };
            Session session = Session.getInstance(props, auth);

            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

            System.out.println("Mail Check 2");

            message.setSubject("Yknot Planning: Lost Password"); //this should be different
            message.setText(emailMessage);

            System.out.println("Mail Check 3");

            Transport.send(message);
            System.out.println("Mail Sent");
            return true;
        }catch(Exception ex){
            System.out.println("Mail fail");
            System.out.println(ex);
            return false;
        }
    }
}