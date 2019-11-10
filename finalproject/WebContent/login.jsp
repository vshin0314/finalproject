<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
body{
background-image: url("image/background2.jpg");
background-size: cover;
}
button, input {
    width: 40%;
   height: 60px;
    overflow: visible;
}
.navbar-bccolor{
	background-color: #2F4F4F;

}

input[type='text'] { font-size: 24px; }

</style>
<script>
function validate() {
	let username = document.login.un.value;
	let password = document.login.pw.value;
	if(username == "" || password == "") {
		alert("Please complete the form!");
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

<h1 style = " color: white; padding-left: 20%;">LOGIN</h1>					
				

<form name="login" action="login" onsubmit="return validate()">
<br>
<br>
<br>
<br>
<br>
<div class="form-group row">
  <input type="hidden" name="src" value="login">
				<label for="title-id" class="col-sm-2 col-form-label text-sm-right" style="color: white;">Username: </label>
				<div class="col-sm-7">

					  <input type="text" style = "font-size: 22px;"  name ="un" placeholder="Enter Username">
					  <span style  = "color: red;"> ${unError}</span>
					  <br>				
				</div>
			</div> <!-- .form-group -->

			<div class="form-group row">
				<label for="release-date-id" style="color: white;" class="col-sm-2 col-form-label text-sm-right">Password:</label>
				<div class="col-sm-7">
					<input type="password" style = "font-size: 22px;" name ="pw"placeholder="Enter Password">
				</div>
			</div> <!-- .form-group -->
			<div class="form-group row">
				<div class="col-sm-2"></div>
				<div class="col-sm-4 mt-2">
					<button type="submit" value="Submit" class="btn btn-primary" style="font-size:24px;">Log In</button>
					
				</div>
			</div> <!-- .form-group -->
</form>
<div class="form-group row">
				<div class="col-sm-2"></div>
				<div class="col-sm-4 mt-2">
<img src="image/gettheapp.jpg">					
				</div>
			</div>




</body>
</html>