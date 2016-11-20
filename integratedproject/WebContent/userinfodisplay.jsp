<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="http://getbootstrap.com/favicon.ico">

    <title>New User</title>

    <!-- Bootstrap core CSS -->
    <link href="./bootstrap/Signin Template for Bootstrap_files/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="./bootstrap/Signin Template for Bootstrap_files/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./bootstrap/Signin Template for Bootstrap_files/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="./bootstrap/Signin Template for Bootstrap_files/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<script>
	function passwordcheck()
	{
	  if(document.getElementById("inputpassword").value==document.getElementById("retypepassword").value)
	    {
		  return true;
		}
		else
         {
		 document.getElementById("inputpassword").value="";
		 document.getElementById("retypepassword").value="";
		 document.getElementById("errormessage").innerHTML="The passwords donot match";
		  return false;
		 }		
		 
	}
	</script>
  </head>
  <body> 
  <%String s=new String();
     if(request.getParameter("saved")!=null)
     {
    	 s="your changes have been saved!";
     }
   %>
   
  <%String firstname=session.getAttribute("firstname").toString();
    String lastname=session.getAttribute("lastname").toString();
    String email=session.getAttribute("email").toString();
   %>
    <div class="container">

      <form class="form-signin" action="edituserservlet" onSubmit="return passwordcheck();" method="post">
        
        <h3 class="form-signin-heading">You can edit your details here</h3>
<p><%=s %></p>	
		<h5>First Name<sup style="color:red">*</sup></h5>
		<label for="firstname" class="sr-only">First Name</label>
        <input type="text" name="firstname" class="form-control" placeholder="First Name" value="<%=firstname %>" required autofocus>
        
        <h5>Last Name<sup style="color:red">*</sup></h5>
		<label for="lastname" class="sr-only">Last Name</label>
        <input type="text" name="lastname" class="form-control" placeholder="Last Name" value="<%=lastname %>"required autofocus>
		
		<h5>Email<sup style="color:red">*</sup></h5>
		<label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" name="inputemail" class="form-control" placeholder="Email address" value="<%=email %>"readonly autofocus>
        
        <h5>Create Password</h5>
		<label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="inputpassword" class="form-control" placeholder="Password">
        
        <h5>Re-type Password</h5>
		<label for="retypepassword" class="sr-only">Password</label>
        <input type="password" name="retypepassword" class="form-control" placeholder="Password">
        		
        <div style="display:inline-block">
		<center><button class="btn btn-lg btn-primary btn-block" id="regularsign" type="submit">Save</button>
		<button class="btn btn-lg btn-primary btn-block" id="regularsign" type="reset" style="float:right">Cancel</button></center>
		</div>
		
      </form>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
