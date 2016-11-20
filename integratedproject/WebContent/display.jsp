<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
   <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/carousel.css" />
<title>Display of products</title>
</head>
<body>
	
	<div class="navbar-wrapper">
      <div class="container-fluid">
        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container-fluid color">
            <div class="navbar-header">
            </div>
            <div class="navbar-collapse collapse">
			  
				<div id="searchdiv">
				<form action="products" method="get">
					<input type="text" class="searchbox" name="search" value="Search"/>
					<span id="go" class="icon-input-btn btn btn-sm btn-info">
					<span class="glyphicon glyphicon-search"></span>
					<input type="submit" class="btn btn-sm btn-info" value="Search"></input>
					</span>
				</form>
				</div>
			  <br/>
			  <br/>
			  		<ul class="nav navbar-nav">
			  	<li  class="active"><a href="index.jsp">Home</a></li>
				<li><a href="newuser.jsp">Sign Up</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
                <a href="#"class="dropdown-toggle" type="button" data-toggle="dropdown">
                <span class="glyphicon glyphicon-user"></span>Login<span class="caret"></span></a>
                <ul class="dropdown-menu">
                <li><a href="login.jsp">Login</a></li>
                <li><a href="RequestOrders">View Orders</a></li>
                <li><a href="userinfodisplayservlet">Edit profile</a></li>
                <li><a href="logout.jsp">Logout</a></li>  
                </ul>
               </li>
               <li class="right"><a href="products/cartdisplay"><span class="glyphicon glyphicon-shopping-cart"></span>Cart</a></li>
				<li class="right"><a href="#"><span class="glyphicon glyphicon-earphone"></span>Contact Us</a></li>
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </div>
	
	<div class="container" id="display">
		<p>
			Search Results:
		<span>
		<form action="products" method="post">
			<span>Sort by Price:  </span>
			<span>
 			<input type="radio" name="sort" value="asc" onclick="products" checked> Ascending
  			<input type="radio" name="sort" value="desc" onclick="products"> Descending
  			<input type="hidden" name="search" value="<%=request.getAttribute("search") %>">
  			<input type="submit" value="sort" class="btn btn-sm btn-primary">
  			</span>
			</form>
			</span>
			</p>
		<div class="row" id="margin">
		<c:forEach items="${products}" var="products">
			<a href="products/page?id=${products.product_id}/${products.name}" alt="Product">
			<div class="col-md-2" id="textWrap">
				<figure>
					<img class="image" src="<%=request.getContextPath()%>/Pics/<c:out value='${products.product_id}'/>.jpg"  alt="image"></img>
					<figcaption>
						<c:out value='${products.name}'/>
						<br/>
						<c:if test='${products.discount!=0}'>
							<span id="discount"><fmt:formatNumber value="${products.price}" type="currency"/></span>
							<span class="red"><fmt:formatNumber value='${products.price-(products.price*(products.discount/100))}' type="currency"/></span>
						</c:if>
						<c:if test='${products.discount==0}'>
							<span class="red"><fmt:formatNumber value="${products.price}" type="currency"/></span>
						</c:if>
						<br/>
						<c:if test="${products.rating == 5}">
							<form id="ratingsForm">
								<div class="stars fullstars">
									<input type="radio" name="star" class="star-1" id="star-1"/>
										<label class="star-1" for="star-1">1</label>
									<input type="radio" name="star" class="star-2" id="star-2" />
										<label class="star-2" for="star-2">2</label>
									<input type="radio" name="star" class="star-3" id="star-3"/>
										<label class="star-3" for="star-3">3</label>
									<input type="radio" name="star" class="star-4" id="star-4"/>
										<label class="star-4" for="star-4">4</label>
									<input type="radio" name="star" class="star-5" id="star-5" checked/>
										<label class="star-5" for="star-5">5</label>
										<span></span>
								</div>  
								</form>
						</c:if>
						<c:if test="${products.rating< 5 && products.rating> 4}">
							<form id="ratingsForm">
								<div class="stars fullstars stars_45">
									<input type="radio" name="star" class="star-1" id="star-1"/>
										<label class="star-1" for="star-1">1</label>
									<input type="radio" name="star" class="star-2" id="star-2" />
										<label class="star-2" for="star-2">2</label>
									<input type="radio" name="star" class="star-3" id="star-3"/>
										<label class="star-3" for="star-3">3</label>
									<input type="radio" name="star" class="star-4" id="star-4"/>
										<label class="star-4" for="star-4">4</label>
									<input type="radio" name="star" class="star-5" id="star-5" checked/>
										<label class="star-5" for="star-5">5</label>
									<span></span>
								</div>  
								</form>
						</c:if>
						<c:if test="${products.rating== 4}">
							<form id="ratingsForm">
								<div class="stars fullstars">
									<input type="radio" name="star" class="star-1" id="star-1"/>
										<label class="star-1" for="star-1">1</label>
									<input type="radio" name="star" class="star-2" id="star-2" />
										<label class="star-2" for="star-2">2</label>
									<input type="radio" name="star" class="star-3" id="star-3"/>
										<label class="star-3" for="star-3">3</label>
									<input type="radio" name="star" class="star-4" id="star-4" checked/>
										<label class="star-4" for="star-4">4</label>
									<input type="radio" name="star" class="star-5" id="star-5"/>
										<label class="star-5" for="star-5">5</label>
									<span></span>
								</div>  
								</form>
						</c:if>
						<c:if test="${products.rating< 4 && products.rating> 3}">
							<form id="ratingsForm">
								<div class="stars fullstars stars_35">
									<input type="radio" name="star" class="star-1" id="star-1"/>
										<label class="star-1" for="star-1">1</label>
									<input type="radio" name="star" class="star-2" id="star-2" />
										<label class="star-2" for="star-2">2</label>
									<input type="radio" name="star" class="star-3" id="star-3"/>
										<label class="star-3" for="star-3">3</label>
									<input type="radio" name="star" class="star-4" id="star-4" checked/>
										<label class="star-4" for="star-4">4</label>
									<input type="radio" name="star" class="star-5" id="star-5"/>
										<label class="star-5" for="star-5">5</label>
									<span></span>
								</div>  
								</form>
						</c:if>
						<c:if test="${products.rating== 3}">
							<form id="ratingsForm">
								<div class="stars fullstars">
									<input type="radio" name="star" class="star-1" id="star-1"/>
										<label class="star-1" for="star-1">1</label>
									<input type="radio" name="star" class="star-2" id="star-2" />
										<label class="star-2" for="star-2">2</label>
									<input type="radio" name="star" class="star-3" id="star-3" checked/>
										<label class="star-3" for="star-3">3</label>
									<input type="radio" name="star" class="star-4" id="star-4"/>
										<label class="star-4" for="star-4">4</label>
									<input type="radio" name="star" class="star-5" id="star-5"/>
										<label class="star-5" for="star-5">5</label>
									<span></span>
								</div>  
								</form>
						</c:if>
						<c:if test="${products.rating< 3 && products.rating> 2}">
							<form id="ratingsForm">
								<div class="stars fullstars stars_25">
									<input type="radio" name="star" class="star-1" id="star-1"/>
										<label class="star-1" for="star-1">1</label>
									<input type="radio" name="star" class="star-2" id="star-2" />
										<label class="star-2" for="star-2">2</label>
									<input type="radio" name="star" class="star-3" id="star-3" checked/>
										<label class="star-3" for="star-3">3</label>
									<input type="radio" name="star" class="star-4" id="star-4"/>
										<label class="star-4" for="star-4">4</label>
									<input type="radio" name="star" class="star-5" id="star-5"/>
										<label class="star-5" for="star-5">5</label>
									<span></span>
								</div>  
								</form>
						</c:if>
						<c:if test="${products.rating== 2}">
							<form id="ratingsForm">
								<div class="stars fullstars">
									<input type="radio" name="star" class="star-1" id="star-1"/>
										<label class="star-1" for="star-1">1</label>
									<input type="radio" name="star" class="star-2" id="star-2" checked/>
										<label class="star-2" for="star-2">2</label>
									<input type="radio" name="star" class="star-3" id="star-3"/>
										<label class="star-3" for="star-3">3</label>
									<input type="radio" name="star" class="star-4" id="star-4"/>
										<label class="star-4" for="star-4">4</label>
									<input type="radio" name="star" class="star-5" id="star-5"/>
										<label class="star-5" for="star-5">5</label>
									<span></span>
								</div>  
								</form>
						</c:if>
						<c:if test="${products.rating< 2 && products.rating> 1}">
							<form id="ratingsForm">
								<div class="stars fullstars stars_15">
									<input type="radio" name="star" class="star-1" id="star-1"/>
										<label class="star-1" for="star-1">1</label>
									<input type="radio" name="star" class="star-2" id="star-2" checked/>
										<label class="star-2" for="star-2">2</label>
									<input type="radio" name="star" class="star-3" id="star-3" />
										<label class="star-3" for="star-3">3</label>
									<input type="radio" name="star" class="star-4" id="star-4"/>
										<label class="star-4" for="star-4">4</label>
									<input type="radio" name="star" class="star-5" id="star-5"/>
										<label class="star-5" for="star-5">5</label>
									<span></span>
								</div>  
								</form>
						</c:if>
						<c:if test="${products.rating== 1}">
							<form id="ratingsForm">
								<div class="stars fullstars">
									<input type="radio" name="star" class="star-1" id="star-1" checked/>
										<label class="star-1" for="star-1">1</label>
									<input type="radio" name="star" class="star-2" id="star-2"/>
										<label class="star-2" for="star-2">2</label>
									<input type="radio" name="star" class="star-3" id="star-3"/>
										<label class="star-3" for="star-3">3</label>
									<input type="radio" name="star" class="star-4" id="star-4"/>
										<label class="star-4" for="star-4">4</label>
									<input type="radio" name="star" class="star-5" id="star-5"/>
										<label class="star-5" for="star-5">5</label>
									<span></span>
								</div>  
								</form>
						</c:if>
						<c:if test="${products.rating< 1 && products.rating> 0}">
							<form id="ratingsForm">
								<div class="stars fullstars stars_05">
									<input type="radio" name="star" class="star-1" id="star-1" checked/>
										<label class="star-1" for="star-1">1</label>
									<input type="radio" name="star" class="star-2" id="star-2" />
										<label class="star-2" for="star-2">2</label>
									<input type="radio" name="star" class="star-3" id="star-3"/>
										<label class="star-3" for="star-3">3</label>
									<input type="radio" name="star" class="star-4" id="star-4"/>
										<label class="star-4" for="star-4">4</label>
									<input type="radio" name="star" class="star-5" id="star-5"/>
										<label class="star-5" for="star-5">5</label>
									<span></span>
								</div>  
								</form>
						</c:if>
						<c:if test="${products.rating== 0}">
							<a href="#">Be the first one to review</a>
						</c:if>
					</figcaption>
				</figure>
			</div>
			</a>
		</c:forEach>
		</div>
	</div>
</body>
</html>