package member.email;

import javax.mail.PasswordAuthentication;
import javax.mail.Authenticator;

public class SMTPAuthenticator extends Authenticator{
	public SMTPAuthenticator(){
		super();
	}
	
	public PasswordAuthentication getPasswordAuthentication(){
		String username = "gmail-id@gmail.com";
		String password = "gmail-password";
		return new PasswordAuthentication(username, password);
	}
}