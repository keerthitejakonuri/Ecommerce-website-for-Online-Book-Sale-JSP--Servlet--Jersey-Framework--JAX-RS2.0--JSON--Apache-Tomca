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
<link rel="stylesheet" href="<%=request.getContextPath()%>/individualStyle.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/carousel.css" />
<title><c:out value="${id}"/></title>
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
				<form action="../products" method="get">
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
                <li><a href="#">Edit profile</a></li>
                <li><a href="logout.jsp">Logout</a></li>  
                </ul>
               </li>
				
<!--                 <li class="right"><a href="#"><span class="glyphicon glyphicon-user"></span>Login</a></li> -->
                
                <li class="right"><a href="products/cartdisplay"><span class="glyphicon glyphicon-shopping-cart"></span>Cart</a></li>
				<li class="right"><a href="#"><span class="glyphicon glyphicon-earphone"></span>Contact Us</a></li>
              </ul>

            </div>
          </div>
        </nav>
      </div>
    </div>
<div class="container" id="display">
		<div class="row" id="margin">
		<c:forEach items="${product}" var="product">
			<br/>
			<br/>
<%-- 			<p id="brand"><c:out value='${product.brand}'/></p> --%>
			<br/>
			<div class="col-md-4 textWrap">
				<figure>
					<img src="<%=request.getContextPath()%>/Pics/<c:out value='${product.product_id}'/>.jpg"  alt="${product.product_id}_image"  id="image"></img>
				</figure>
			</div>
			<div class="col-md-4">
				<p class="bold" id="name"><c:out value='${product.name}'/></p>
				<p>
				<c:if test="${product.rating == 5}">
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
				<c:if test="${product.rating< 5 && product.rating> 4}">
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
							<input type="radio" name="star" class="star-5" id="star-5" checked/>										<label class="star-5" for="star-5">5</label>
							<span></span>
						</div>  
					</form>
				</c:if>
				<c:if test="${product.rating== 4}">
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
				<c:if test="${product.rating< 4 && product.rating> 3}">
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
				<c:if test="${product.rating== 3}">
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
				<c:if test="${product.rating< 3 && product.rating> 2}">
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
				<c:if test="${product.rating== 2}">
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
				<c:if test="${product.rating< 2 && product.rating> 1}">
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
				<c:if test="${product.rating== 1}">
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
				<c:if test="${product.rating< 1 && product.rating> 0}">
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
				<c:if test="${product.rating== 0}">
					<a href="#">Be the first one to review</a>
				</c:if>
				</p><br/><br/>
				<p class="bold">
				<c:if test='${product.discount!=0}'>
					<span id="discount"><fmt:formatNumber value="${product.price}" type="currency"/></span>
					<span class="red"><fmt:formatNumber value='${product.price-(product.price*(product.discount/100))}' type="currency"/></span>
					<form>
						<input type="hidden" name="price" value="<fmt:formatNumber value='${product.price-(product.price*(product.discount/100))}' type='currency'/>"/>
					</form>
				</c:if>
				<c:if test='${product.discount==0}'>
					<span class="red"><fmt:formatNumber value="${product.price}" type="currency"/></span>
					<form>
						<input type="hidden" name="price" value="<fmt:formatNumber value='${product.price}' type='currency'/>"/>
					</form>
				</c:if>
				</p>
				<p>Color: <c:out value='${product.color}'/></p>
				<p>Product Description:</p>
				<ul>
				<c:forEach items="${product.description}" var="des">
					<li>
					<c:out value='${des}'/>
					</li>
				</c:forEach>
				</ul>
			</div>
			<div id="right" class="center">
				<form action="cart" method="post" >
					<c:if test='${product.discount!=0}'>
						<input type="hidden" name="price" value="<fmt:formatNumber value='${product.price-(product.price*(product.discount/100))}' type='currency'/>"/>
				</c:if>
				<c:if test='${product.discount==0}'>
						<input type="hidden" name="price" value="<fmt:formatNumber value='${product.price}' type='currency'/>"/>
				</c:if>
					<input type="hidden" name="productId" value="<c:out value='${product.product_id}'/>"/>
					<input type="hidden" name="name" value="<c:out value='${product.name}'/>"/>
					<input type="hidden" name="quantity" value="1"/>
					<span class="icon-input-btn btn-lg btn-danger">
					<span class="glyphicon glyphicon-shopping-cart"></span>
					<input type="submit" value="Add to Cart" class="btn btn-md btn-danger"/>
					</span>
				</form>
				<br/>
				<form action="cartdisplay" method="get" >
					<input type="submit" value="View Cart" class="btn btn-md btn-info"/>
				</form>
			</div>
			</c:forEach>
		</div>
	</div>

</body>
</html>