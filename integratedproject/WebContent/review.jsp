<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>
  	#text1{
  		 width:500px;
  		 margin:auto;
  		 margin-top:50px;
  	}
  </style>
</head>
<body>
	<div id="text1">
		
		<img src="<%=request.getContextPath() %>/images/<%=request.getParameter("productid") %>.jpg" alt="image"></img>
	<form method="get" action="savereview">
		<textarea name="txtarea" rows=4 cols=30>write your review....</textarea><br/><br/>
		<input id="mybutton1" type="submit" class="btn btn-info" value="submit"/>
	</form>
	</div>
	<%	session.setAttribute("productid",request.getParameter("productid"));
		session.setAttribute("orderid",request.getParameter("orderid"));
		session.setAttribute("cid",request.getParameter("cid"));
	%>
	
</body>
</html>