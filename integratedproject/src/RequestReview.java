import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

/**
 * Servlet implementation class RequestReview
 */
@WebServlet("/RequestReview")
public class RequestReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestReview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		if(session.getAttribute("useremail")!=null){
			
		
		String productid=request.getParameter("hidden1");
		Client c=Client.create();
		WebResource wr=c.resource("https://localhost:9443/integratedprojectserver/display/reviews");
		ClientResponse cliresponse=wr.queryParam("productid",productid).accept("application/text").get(ClientResponse.class);
		if (cliresponse.getStatus() != 200) {
			throw new RuntimeException("Failed : HTTP error code : " + cliresponse.getStatus());
		}
		else{
			try{
			String statusString = cliresponse.getEntity(String.class);
			System.out.println(statusString);
			JSONArray jsonObject = new JSONArray(statusString);
			ArrayList<String> reviews = new ArrayList<String>();
			
			for(int i=0;i<jsonObject.length();i++){
				JSONObject pr =jsonObject.getJSONObject(i);
				reviews.add(pr.getString("review"));
			}
			//HttpSession session=request.getSession();
			session.setAttribute("reviews", reviews);
			RequestDispatcher rd=request.getRequestDispatcher("viewreviews.jsp");
			rd.forward(request, response);
			}
			catch(Exception e){
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		}
		}
		else{
			System.out.println("invalid user");
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
