package member.email;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendMail
 */
@WebServlet("/sendmail")
public class SendMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		String m_name = request.getParameter("name");
		String m_email = request.getParameter("email");
		String m_title = request.getParameter("title");
		String m_text = request.getParameter("text");

		
		try {
			String mail_from = m_name + "<" + m_email + ">";
			String mail_to = "admin<admin@83rpm.com>";
			String title = "hosting.83rpm.com 요청사항 :: " + m_title;
			String contents =  "보낸사람 :: " + m_name + "&lt;" + m_email + "&gt";
			
			mail_from = new String(mail_from.getBytes("utf-8"), "utf-8");
			mail_to = new String(mail_to.getBytes("utf-8"), "utf-8");
			
			Properties props = new Properties();
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "465");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.socketFactory.fallback", "false");
            props.put("mail.smtp.auth", "true");
			
            Authenticator auth = new SMTPAuthenticator();
            
            Session sess = Session.getDefaultInstance(props, auth);
            
            MimeMessage msg = new MimeMessage(sess);
            
            msg.setFrom(new InternetAddress(mail_from)); //보내는사람 설정
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(mail_to)); //받는사람설정
            msg.setSubject(title, "UTF-8"); //제목
            msg.setContent(contents, "text/html; charset=UTF-8"); //내용
            msg.setHeader("Content-type", "text/html; charset=UTF-8");
            
            Transport.send(msg); //메일보내기
            
            response.sendRedirect("email/emailComlete.jsp");
		} catch (Exception e) {
			response.sendRedirect("email/emailFailed.jsp");
		} finally {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
