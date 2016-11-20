import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.MultivaluedMap;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;

/**
 * Servlet implementation class savereview
 */
@WebServlet("/savereview")
public class savereview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public savereview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
		HttpSession session=request.getSession();
	if(session.getAttribute("useremail")!=null){
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String review=request.getParameter("txtarea");
		System.out.println("review is"+review);
		//HttpSession session=request.getSession();
		String productid=session.getAttribute("productid").toString();
		String orderid=session.getAttribute("orderid").toString();
		String cid=session.getAttribute("cid").toString();
		System.out.println("cid="+cid);
		System.out.println("pid="+productid);
		System.out.println("oid="+orderid);
		/*MultivaluedMap<String,String> m=new MultivaluedMapImpl();
		m.add("productid",productid);
		m.add("cid",cid);
		m.add("orderid",orderid);
		m.add("review",review);*/
		Client cli=Client.create();
		
		WebResource wr=cli.resource("https://localhost:9443/integratedprojectserver/store/review");
		ClientResponse cliresponse=wr.queryParam("cid",cid).queryParam("orderid",orderid).queryParam("productid",productid).queryParam("review",review).accept("application/text").get(ClientResponse.class);
		//System.out.println(cliresponse.getLocation());
		if (cliresponse.getStatus() != 200) {
			throw new RuntimeException("Failed : HTTP error code : " + cliresponse.getStatus());
		}
		else{
			String statusString = cliresponse.getEntity(String.class);
			System.out.println(statusString);
			if(Boolean.parseBoolean(statusString)){
				//RequestDispatcher rd=request.getRequestDispatcher("orderdisplay.jsp");
				//rd.forward(request, response);
				response.sendRedirect("orderdisplay.jsp");
			}
		}
	}
	else{
		System.out.println("invald usr");
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
