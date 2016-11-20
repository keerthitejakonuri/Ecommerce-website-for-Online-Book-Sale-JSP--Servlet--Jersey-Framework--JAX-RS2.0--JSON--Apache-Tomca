<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.util.ArrayList"%>
<%@page import = "java.util.HashMap"%>
<%@page import = "java.util.LinkedList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
		.ptag{
			font-style:arial;
			font-size: 20px;
			display:inline-block;
			margin-right:30px;
			
		}
		.ptag1{
			font-style:arial;
			font-size: 20px;
			width:250px;
			display:inline-block;
			word-wrap:break-word;
			margin-right:30px;
			
		}
		.divtag{
			width:1100px;
			height:300px;
			padding-top:30px;
			margin: auto;
			border-radius:20px;
			border-style:solid;
			border-color:gray;
			padding-top:30px;
		}
		
		#mybutton,#mybutton1{
			margin-top: 20px;
			margin-left: 20px;
		}
</style>
</head>
<body>
	<% ArrayList orders = (ArrayList) session.getAttribute("products");
	   HashMap h=new HashMap();
		int j=0;
	   for(int i=0;i<orders.size();i++){
		   HashMap map=(HashMap)orders.get(i);
		  String product=map.get("productid").toString();
		  String order=map.get("orderid").toString();
		  String cid=map.get("cid").toString();
	%>
		
		<div class="divtag">
			
			<img  style="float:left;" src="<%=request.getContextPath()%>/Pics/<%=map.get("productid") %>.jpg" alt="image"></img>
			<div ><p class="ptag1">name</p><p class="ptag">order#</p><p class="ptag">price</p>
			<%if(map.get("deliverydate")!=null){ %>
				<p class="ptag">delivery date</p>
			<%} %>
			<p class="ptag">status</p><p class="ptag">address</p></div>
			<div >
		   		<p class="ptag1"><%=map.get("name")%></p>
		   		<p class="ptag"><%=map.get("orderid").toString().toUpperCase() %></p>
		   		<p class="ptag"><%= (double)map.get("price")-((double)map.get("price")*(double)map.get("discount")/100) %></p>
		   		<%if(map.get("deliverydate")!=null){ %>
		   			<p class="ptag"><%=map.get("deliverydate") %></p>
		   		<%} %>
		   		<p class="ptag"><%=map.get("status") %></p>
		   		<p class="ptag"><%=map.get("shippingaddress") %></p>
		   </div>
		  	
		   <%if(map.get("deliverydate")!=null){ %>
		  	 <a href="review.jsp?productid=<%= product %>&orderid=<%= order %>&cid=<%= cid %>">add/update review</a><br/>
		   	
		   <%} %>
		   		<form method="get" action="RequestReview">
		   			<input type="hidden" value=<%=product %> name="hidden1"/>
		   			<input type="submit" value="View reviews" name="submit"/>
		   		</form>
		   		<!--  <a href="/RequestReview?productid=<%= product %>">view review</a>-->
		   	</div>
		   
	<% 	   
	   }
	%>
	
	<script>
    	
    	
	</script>
</body>
</html>