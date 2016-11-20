

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

@WebServlet("/ProductDisplay")
public class ProductsDisplay extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ProductsDisplay() {
		super();
		// TODO Auto-generated constructor stub
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//List<Object> products = getData();
		Logger log=Logger.getLogger(ProductsDisplay.class.getName());
		try {
			Client c=Client.create();
			log.info("calling web service");
			WebResource webresource=c.resource("https://localhost:9443/integratedprojectserver/products/display");
			System.out.println(webresource.toString());
			String search= request.getParameter("search");
			request.setAttribute("search", search);
			//System.out.println("Search value is: "+search);
			String order = "asc";
			order=request.getParameter("sort");
			if(order==null){
				order="asc";
			}
			System.out.println("order value is: "+ order);
			ClientResponse restResponse = webresource.queryParam("searchstring", search).queryParam("order", order).accept("application/text").get(ClientResponse.class);
			//ClientResponse restResponse = webresource.path("/P100").accept("application/text").get(ClientResponse.class);
			//System.out.println(restResponse.toString());
			//System.out.println("uri="+restResponse.getLocation());
			if (restResponse.getStatus() != 200) {
				//System.out.println("uri="+restResponse.getLocation());
				
				log.info("status!=200");
				throw new RuntimeException("Failed : HTTP error code : " + restResponse.getStatus());
			}
			else{
				log.info("status=200");
				String statusString = restResponse.getEntity(String.class);
				//System.out.println("In client JSOn="+statusString);
				JSONArray jsonObject = new JSONArray(statusString);
				ArrayList products = new ArrayList();
				Map row;
				for(int i=0;i<jsonObject.length();i++){
					row = new HashMap();
					JSONObject pr =jsonObject.getJSONObject(i);
					row.put("product_id",pr.getString("productid"));
					row.put("name",pr.getString("name"));
					//row.put("description",pr.getString("description"));
					//row.put("category",pr.getString("category"));
					//row.put("brand",pr.getString("brand"));
					//row.put("color",pr.getString("color"));
					row.put("price",pr.getDouble("price"));
					//row.put("quantity",pr.getInt("quantity"));
					row.put("discount",pr.getDouble("discount"));
					row.put("rating",pr.getDouble("rating"));
					products.add(row);
					request.setAttribute("category", pr.getString("category"));
				}
				HttpSession session=request.getSession();
				//System.out.println("Hello");
				//System.out.println("get 0: "+products.get(0));
				session.setAttribute("products", products);
				RequestDispatcher rd=request.getRequestDispatcher("display.jsp");
				rd.forward(request, response);
				//response.getWriter().append("Served at: ").append(request.getContextPath());
			}
		} catch(Exception e){
			e.printStackTrace();
			Response res =Response.serverError().entity(e.getMessage()).build();
			System.out.println(res.toString());
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request,response);
	}
}

