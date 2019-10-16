package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator {

	 protected PasswordAuthentication getPasswordAuthentication() {
	  String username = "testsemi1112@gmail.com"; // gmail 사용자;
	  String password = "semitest1@";  // 패스워드;
	  return new PasswordAuthentication(username, password);
	 }

	}