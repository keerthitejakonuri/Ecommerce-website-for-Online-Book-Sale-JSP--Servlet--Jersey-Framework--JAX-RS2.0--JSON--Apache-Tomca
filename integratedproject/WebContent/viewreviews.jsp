<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
	.divtag{
			width:500px;
			height:100px;
			padding-top:30px;
			margin: auto;
			border-radius:20px;
			border-style:solid;
			border-color:gray;
			padding-top:30px;
		}
</style>
</head>
<body>
	<h3 style="color:blue;mrgin:auto;padding-top:20px;">Reviews</h3>
	<%ArrayList reviews = (ArrayList) session.getAttribute("reviews");
	
	int j=0;
   	for(int i=0;i<reviews.size();i++){
	   String review=reviews.get(i).toString();
	%>
	<div class="divtag">
		<p><%=review %></p>
	</div>
	<%} %>
</body>
</html>