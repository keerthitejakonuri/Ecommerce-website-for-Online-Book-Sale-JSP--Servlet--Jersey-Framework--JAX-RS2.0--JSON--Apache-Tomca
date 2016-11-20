import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

/**
 * Servlet implementation class RequestOrders
 */
@WebServlet("/RequestOrders")
public class RequestOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RequestOrders() {
        super();
        
    }
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		try {
			Logger log=Logger.getLogger(RequestOrders.class.getName());
			HttpSession session=request.getSession();
		if(session.getAttribute("useremail")!=null){
			Client c=Client.create();
			log.info("calling webservice");
			WebResource webresource=c.resource("https://localhost:9443/integratedprojectserver/retrieve/orders");
			ClientResponse restResponse = webresource.accept("application/json").get(ClientResponse.class);
			if (restResponse.getStatus() != 200) {
				log.info("status!=200");
				throw new RuntimeException("Failed : HTTP error code : " + restResponse.getStatus());
			}
			else{
				log.info("status=200");
				String statusString = restResponse.getEntity(String.class);
				//System.out.println("In client JSOn="+statusString);
				JSONArray jsonObject = new JSONArray(statusString);
				//System.out.println("In JSOn len="+jsonObject.length());
				//System.out.println("json 1="+jsonObject);
				//System.out.println("array(0)"+jsonObject.getJSONArray(0));
				JSONArray[] jarray=new JSONArray[jsonObject.length()];
				for(int i=0;i<jsonObject.length();i++){
					jarray[i]=jsonObject.getJSONArray(i);
					//System.out.println("jarray="+jarray[i]);
				}
				Map row;
				ArrayList products = new ArrayList();
				
				for(int i=0;i<jarray.length;i++){
					row = new HashMap();
					JSONObject pr =jarray[i].getJSONObject(0);
					JSONObject pr1 =jarray[i].getJSONObject(1);
					row.put("orderid",pr.getString("orderid"));
					row.put("productid",pr.getString("productid"));
					row.put("name",pr1.getString("name"));
					row.put("price", pr1.getDouble("price"));
					row.put("orderdate",pr.getString("orderdate"));
					row.put("status",pr.getString("status"));
					
					row.put("shippingaddress",pr.getString("shippingaddress"));
					row.put("quantity",pr.getInt("quantity"));
					
					row.put("cid",pr.getString("cid"));
					
					
					row.put("discount", pr1.getDouble("discount"));
					if(pr.getString("status").equals("delivered")){
						row.put("deliverydate",pr.getString("deliverydate"));
					}
					products.add(row);
				}
				
				//HttpSession session=request.getSession();
				session.setAttribute("products", products);
				log.info("orders:"+products);
				//System.out.println("from orders map"+products.get(0).toString());
				RequestDispatcher rd=request.getRequestDispatcher("orderdisplay.jsp");
				log.info("redreing to orderdisplay.jsp");
				rd.forward(request, response);
			}
		}
			else{
				response.sendRedirect("login.jsp");
			}
			
		}catch(Exception e){
				System.out.println(e.getMessage());
		}
		
			
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
