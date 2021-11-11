package a.b.c.com.cgi.mail;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSend {

	public void mailSend() {
		Properties prop = System.getProperties();
		/*
			Properties prop = System.getProperties();
			Properties 클래스는 시스템 속성을 객체로 생성하는 클래스
			Hashtable을 상속받는 클래스로 속성과 값은 1:1로 저장됨
		*/
		
		// Mail 처리환경
		// 로그인시 TLS를 사용할 것인지 설정
		prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS
		
		Authenticator auth = new MailAuth();
		Session session = Session.getDefaultInstance(prop, auth);
		/*
		 	MailAuth.java에서 Authenticator를 상속받아 생성한
		 	MailAuth 클래스를 받아 세션을 생성한다.
		 	getDefaultInstance의 첫번째 파라미터는 27~33Line에서 정의한 값
		*/
		
		// MimeMessage는 Message(추상)클래스를 상속받은 인터넷 메일을 위한 클래스
		// 38Line 생성한 세션을 담아 msg객체를 생성한다.
		MimeMessage msg = new MimeMessage(session);
		
		try {
			// 보내는 날짜 지정
			msg.setSentDate(new Date());
			
			// 보낸이
			msg.setFrom(new InternetAddress("hatsnakemail@gmail.com", "mailTest"));
			// Message 클래스의 setFrom() 메소드를 사용하여 발송자를 지정한다.
			// 발송자의 메일, 발송지명 InternetAddress 클래스는 이메일 주소를 나타날 때 사용하는 클래스
			
			// 수신자의 메일을 생성
			// 받는이 어디든지 가능 google, naver, daum
			InternetAddress to = new InternetAddress("hatsnakemail@gmail.com");
			
			msg.setRecipient(Message.RecipientType.TO, to);
			/*
				Message 클래스의 setRecipient() 메소드를 사용하여 수신자를 설정
				setRecipient() 메소드로 수신자, 참조, 숨은 참조 설정이 가능하다.
				Message.RecipientType.TO : 받는 사람
				Message.RecipientType.CC : 참조
				Message.RecipientType.BCC : 숨은 참조
			*/
			
			// 메일의 제목 지정, encoding 타입 설정
			msg.setSubject("메일 테스트", "UTF-8");
			
			// 메일의 내용 입력, encoding 타입 설정
			msg.setText("구글 메일을 사용하여 네이버 메일로 보내기 테스트.", "UTF-8");
			
			// Transport는 메일을 최종적으로 보내는 클래스로 메일을 보내는 부분이다.
			Transport.send(msg);
			
		} catch(AddressException ae) {
			System.out.println("AddressException >>> : " + ae.getMessage());
		} catch(MessagingException me) {
			System.out.println("MessagingException >>> : " + me.getMessage());
		} catch(UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException >>> : " + e.getMessage());
		}
	}
}
