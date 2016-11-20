

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

@WebServlet("/IndividualProduct")
public class IndividualProduct extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public IndividualProduct() {
		super();
		// TODO Auto-generated constructor stub
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//System.out.println("Hellloooo");
		String productId = request.getParameter("id").substring(0, 4);
		//System.out.println("product name passed to servlet is: "+ productId);
		try {
			Client c=Client.create();
			WebResource webresource=c.resource("https://localhost:9443/integratedprojectserver/products");
			//System.out.println(webresource.toString());
			ClientResponse restResponse = webresource.path(productId).accept("application/text").get(ClientResponse.class);
			//ClientResponse restResponse = webresource.queryParam("product_id",product).accept("application/text").get(ClientResponse.class);
			//ClientResponse restResponse = webresource.path(product).queryParam("product_id",product).accept("application/text").get(ClientResponse.class);
			System.out.println(restResponse.toString());
			//System.out.println("uri="+restResponse.getLocation());
			if (restResponse.getStatus() != 200) {
				//System.out.println("uri="+restResponse.getLocation());
				throw new RuntimeException("Failed : HTTP error code : " + restResponse.getStatus());
			}
			else{
				String statusString = restResponse.getEntity(String.class);
			//	System.out.println("In client JSOn="+statusString);
				JSONArray jsonObject = new JSONArray(statusString);
				ArrayList product = new ArrayList();
				Map row;
				for(int i=0;i<jsonObject.length();i++){
					row = new HashMap();
					JSONObject pr =jsonObject.getJSONObject(i);
					row.put("product_id",pr.getString("productid"));
					row.put("name",pr.getString("name"));
					String[] des = pr.getString("description").split("@");
					row.put("description",des);
					row.put("category",pr.getString("category"));
					row.put("brand",pr.getString("brand"));
					row.put("color",pr.getString("color"));
					row.put("price",pr.getDouble("price"));
					row.put("quantity",pr.getInt("quantity"));
					row.put("discount",pr.getDouble("discount"));
					row.put("rating",pr.getDouble("rating"));
					product.add(row);
				}
				//System.out.println("Hello");
				//System.out.println("get 0: "+product.get(0));
				//request.setAttribute("product", product); // Will be available as ${data} in JSP.
				//HttpSession session=request.getSession();
				request.setAttribute("product", product);
				request.setAttribute("id", productId);
				RequestDispatcher rd=request.getRequestDispatcher("../page2.jsp");
				rd.forward(request, response);
				
				//response.getWriter().append("Served at: ").append(request.getContextPath());
			}
		} catch(Exception e){
			e.printStackTrace();
		}
	}
}
