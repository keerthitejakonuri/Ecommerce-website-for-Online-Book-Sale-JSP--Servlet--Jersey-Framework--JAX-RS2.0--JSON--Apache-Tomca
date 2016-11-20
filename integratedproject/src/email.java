
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.util.*;
import javax.mail.*;
 
import java.io.IOException;
import java.net.URL;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.activation.*;
import org.apache.log4j.Logger;
/**
 * Servlet implementation class contactusservlet
 */
@SuppressWarnings("unused")
@WebServlet("/contactusservlet")
public class email extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public email() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Logger log=Logger.getLogger(CartDisplay.class.getName());
		HttpSession session=request.getSession();
		String email=session.getAttribute("useremail").toString();
		log.info("emai is"+email);
		 ServletContext context = getServletContext();
	     String   host = context.getInitParameter("host");
	     String       port = context.getInitParameter("port");
	     final String    user = context.getInitParameter("user");
	     final String     pass = context.getInitParameter("password");
	     
	     System.out.println("details:"+host+":"+port+":"+user+":"+pass);
	     String messagebody = "Your request has been recieved. We will get back to you as soon as possible.";
	     try
	     {
	    	 Properties properties = new Properties();
	         properties.put("mail.smtp.host", host);
	         properties.put("mail.smtp.port", port);
	         properties.put("mail.smtp.auth", "true");
	         properties.put("mail.smtp.starttls.enable", "true");
	  
	         // creates a new session with an authenticator
	         Authenticator auth = new Authenticator() {
	             public PasswordAuthentication getPasswordAuthentication() {
	                 return new PasswordAuthentication(user, pass);
	             }
	         };
	    	 
	         Session session1 = Session.getInstance(properties, auth);
	         
	         Message msg = new MimeMessage(session1);
	         
	         msg.setFrom(new InternetAddress(user));
	         InternetAddress[] toAddresses = { new InternetAddress(email) };
	         msg.setRecipients(Message.RecipientType.TO, toAddresses);
	         msg.setSubject("reply from trendz");
	         msg.setSentDate(new Date());
	         msg.setText(messagebody);
	  
	         // sends the e-mail
	         Transport.send(msg);
	         RequestDispatcher rd=request.getRequestDispatcher("/checkOut.jsp");
	         rd.forward(request, response);
	     }
	     catch(Exception e)
	     {
	    	 System.out.println("hi i caught an exception in the email:"+e.getMessage());
	     }
}
}