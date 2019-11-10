<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
body {
background-image : url("image/background3.jpg");
background-repeat: no-repeat;
 background-size:cover;
 
   
}
.navbar-bccolor{
	background-color: #2F4F4F;

}

#gettheapp{
width:120px;
}


input[type='text'] { font-size: 24px; }
</style>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<script>
function validate() {
	let username = document.register.un.value;
	let password = document.register.pw.value;
	let pwcheck = document.register.pwc.value;
	if(username == "" || password == "" || pwcheck == "") {
		alert("Please complete the form!");
		return false;
	}
	if(pwcheck != password) {
		alert("Password does not match!");
		return false;
	}
	return true;
}
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark navbar-bccolor">
  <a class="navbar-brand" href="Home.jsp">Home</a>
 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarnav" aria-controls="navbarnav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
     <div class="collapse navbar-collapse" id="navbarnav">
	    	<ul class="navbar-nav mr-auto">
	      		<li class="nav-item ">
		      		<a class = "nav-link" href="Aboutus.jsp">About Us</a>
	      		</li>
	      		<li class="nav-item">
		      		<a class = "nav-link" href="Profile.jsp">Profile</a>
	      		</li>
	      		<li class="nav-item">
		      		<a class = "nav-link" href="register.jsp">Sign Up</a>
	      		</li>
	    	</ul>
	 </div>
</nav>
<br>
<br>
<h1 style = " color: white; padding-left: 20%;">Register</h1>
<br>
<br>
<br>
<form name="register" action="login" onsubmit="return validate()">
 
  <input type="hidden" name="src" value="register">
    <div class="form-group row">
  <label for="title-id" class="col-sm-2 col-form-label text-sm-right" style="color: white; font-size: 32px;"><strong>Username:</strong> </label>
  <div class="col-sm-7">

					  <input type="text" style = "font-size: 32px;"  name ="un" placeholder="Enter Username">
					  <span style  = "color: red;"> ${unError}</span>
					  <br>				
  </div>
  </div>
  <br>
  <div class="form-group row">
				<label for="release-date-id" style="color: white; font-size: 32px;"class="col-sm-2 col-form-label text-sm-right"><strong>Password: </strong></label>
				<div class="col-sm-7">
					<input type="password" style = "font-size: 32px;" name ="pw"placeholder="Enter Password">
				</div>
  </div>
 <br>
  <div class="form-group row">
				<label for="release-date-id" style="color: white; font-size: 32px;"class="col-sm-2 col-form-label text-sm-right"><strong>Password:</strong></label>
				<div class="col-sm-7">
					<input type="password" style = "font-size: 32px;" name ="pwc"placeholder="Enter Password Again">
				</div>
  </div>
  <br>
<div class="form-group row">
				<div class="col-sm-2"></div>
				<div class="col-sm-4 mt-2">
<img id = "gettheapp" src="image/gettheapp.jpg">					
</div>
</div>


<div class="form-group row">
				<div class="col-sm-2"></div>
				<div class="col-sm-4 mt-2">
					<button type="submit" value="Submit" class="btn btn-primary" style="font-size:24px;">Submit</button>
					
				</div>
			</div>

</form>












</body>
</html>