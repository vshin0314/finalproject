<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
window.onload = function() {
	if (!("Notification" in window)) {
	    alert("This browser does not support system notifications");
	    // This is not how you would really do things if they aren't supported. :)
	}
	// Otherwise, we need to ask the user for permission
	else if (Notification.permission !== 'denied') {
	  Notification.requestPermission(function (permission) {
	    // If the user accepts, let's create a notification

	  });
	}
	if(sessionStorage.getItem("log")!=null){
		document.getElementById("login").innerHTML = "Logout"
		document.getElementById("login").onclick = 	function signout(){
			sessionStorage.removeItem("log");
			document.getElementById("profile").style.display = "none";
			document.getElementById("login").innerHTML = "Login"
			document.getElementById("login").href = "login.jsp";
			document.getElementById("signup").innerHTML = "Sign Up"
			document.getElementById("signup").href= "register.jsp";
		}
		document.getElementById("profile").style.display = "block";
		setInterval(checkRequest, 1000);
	//do something to change based on login
	}else {
		document.getElementById("profile").style.display = "none";
		document.getElementById("login").innerHTML = "Login";
		document.getElementById("login").href = "login.jsp";
		document.getElementById("signup").innerHTML = "Sign Up"
		document.getElementById("signup").href= "register.jsp";
	}
}
function checkRequest() {
	var xhttp = new XMLHttpRequest();
	xhttp.open("GET", "CheckRequest?src=/Home.jsp" +
			"&un=" + sessionStorage.getItem("log"), true);
	xhttp.send();
	xhttp.onreadystatechange = function() {
		if(xhttp.responseText.trim().length > 0){
			let requests = xhttp.responseText.split(",");
			for(let i=0; i<requests.length; ++i) {
				var notification = new Notification("Friend Request!", {body: requests[i] + " has sent you a friend request!"});
			}
		}
	};
	return false;
}

</script>
<style>
body {
background-image : url("image/background.jpg");
background-size: cover; 
   
}
.breadcrumb{
background-color: white;
}
.container img{
width:620px;
}
.container{
height: 10em;
padding-top:20%;
  display: flex;
  
  align-items: center;
  justify-content: center; 
}
#inlineFormCustomSelectPref{
margin-top:0;
}
#title-id{
width:40%;
}
.form-control{
margin-top: 10px;
float:left;
margin:0;
}
.navbar-bccolor{
	background-color: #2F4F4F;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Find My Bills</title>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark navbar-bccolor">
  <a class="navbar-brand" href="Home.jsp">Find My Bills |</a>
 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarnav" aria-controls="navbarnav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
     <div class="collapse navbar-collapse" id="navbarnav">
	    	<ul class="navbar-nav mr-auto">
	      		<li class="nav-item" >
		      		<a class = "nav-link" id="about" href="Aboutus.jsp">About Us</a>
	      		</li>
	      		<li class="nav-item">
		      		<a class = "nav-link" id="profile" href="Profile.jsp">Profile</a>
	      		</li>
	      		<li class="nav-item">
		      		<a class = "nav-link" id="login"></a>
	      		</li>
	      		<li class="nav-item">
		      		<a class = "nav-link" id="signup"></a>
	      		</li>
	    	</ul>
	 </div>
</nav>

<div class="container">
		<div class="row">
			<h1 class="col-12 mt-4"> <img src ="image/House.jpg"/></h1>
		</div> <!-- .row -->	
</div>
<br>
<br>
<br>
<div class="d-flex justify-content-center">
<form name="myform" method="POST" action="Servlet" onsubmit= "return selectCheck()">
<input type="text" style = "width:400px; margin-top: 20px;" class="form-control" id="search" name="search" placeholder = "Search Bills">
<select name="select" id="select" style= "width: 150px;margin-top: 20px;height: 40px;" onmouseout="return placeholder()" >
    <option value="selectnon">--SELECT--</option>
    <option value="bills">Bill</option>
    <option value="users">User</option>
    
  </select>
<input type = "submit" value = "Submit" class="btn btn-primary">

</form>
</div>
<script>
function placeholder() {
   if(document.myform.select.value == "bills"){
	   document.getElementById("search").setAttribute("placeholder", "Search Bills with keywords");
   }
   if(document.myform.select.value == "users"){
	   document.getElementById("search").setAttribute("placeholder", "Search Users with First Name or Last Name");
   }
 
}
function selectCheck(){
	if(document.myform.select.value == "selectnon"){
		alert("Please select option for search!.");
		return false;
	}
}
</script>
</body>
</html>