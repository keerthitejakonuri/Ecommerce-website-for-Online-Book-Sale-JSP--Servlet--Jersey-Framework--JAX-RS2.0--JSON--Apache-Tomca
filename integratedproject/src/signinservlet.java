

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;

import org.apache.log4j.Logger;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;

/**
 * Servlet implementation class signinservlet
 */
@WebServlet("/signinservlet")
public class signinservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signinservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Logger log=Logger.getLogger(signinservlet.class.getName());
		String useremail=request.getParameter("useremail");
		String userpassword=request.getParameter("userpassword");
		log.info("usermail"+useremail);
		log.info("pssword"+userpassword);
		MultivaluedMap m=new MultivaluedMapImpl();
		m.add("useremail", useremail);
		m.add("userpassword", userpassword);
		HttpSession session= request.getSession();
		System.out.println("user email in sinin servlett........"+useremail);
   	 session.setAttribute("useremail", useremail);
   	 
		javax.net.ssl.HttpsURLConnection.setDefaultHostnameVerifier(
			    new javax.net.ssl.HostnameVerifier(){

			        public boolean verify(String hostname,
			                javax.net.ssl.SSLSession sslSession) {
			            if (hostname.equals("localhost")) {
			                return true;
			            }
			            return false;
			        }
			    });
		try{
			
			Client c=Client.create();
			WebResource webresource=c.resource("https://localhost:9443/integratedprojectserver/loginservice/hi");
			ClientResponse restResponse = webresource.type(MediaType.APPLICATION_FORM_URLENCODED_TYPE).post(ClientResponse.class,m);
			if (restResponse.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + restResponse.getStatus());
			}
			else{
				String statusString = restResponse.getEntity(String.class);
               // System.out.println("in else::::::"+statusString); 
                
                if(!statusString.contentEquals("false"))
                {
                //	System.out.println("sigin servlet not false part");
                	 //HttpSession session= request.getSession();
                	 ///session.setAttribute("useremail", useremail);
                	 session.setAttribute("time",statusString );
                	 response.sendRedirect("/integratedproject/index.jsp");
                }
                else
                {
                	//System.out.println("sigin servlet false part");
                	response.sendRedirect("/integratedproject/login.jsp?status=false");
                	
                }
                
				}
			
		}
		catch(Exception e)
		{
		  System.out.println("exception"+e.getMessage());	
		}
 }
}
