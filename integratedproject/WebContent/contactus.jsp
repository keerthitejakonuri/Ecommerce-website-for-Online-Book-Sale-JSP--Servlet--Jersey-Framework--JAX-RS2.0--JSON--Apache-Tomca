<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Contact us</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
<form action="contactus" method="post">
<center><h1>Please leave us a message here</h1>
<h2>We will get back to you.</h2>
<h2>We Promise!!</h2></center>
<fieldset class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" name="contactemail" placeholder="Enter email" required>
  </fieldset>
<fieldset class="form-group">
    <label for="exampleTextarea">Please enter your comments here</label>
    <textarea class="form-control" id="exampleTextarea" rows="3" required></textarea>
  </fieldset>
  <button type="submit" class="btn btn-primary">submit</button>
  <button type="reset" class="btn btn-primary">reset</button>
</form>
</div>
</body>
</html>