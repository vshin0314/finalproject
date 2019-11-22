<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
		//setInterval(checkRequest, 1000);
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
	
function toggle(x){
	x.classList.toggle("fa-thumbs-down");
	
}
</script>
<meta charset="UTF-8">
<title>Profile</title>
</head>
<style>
.fa {
  font-size: 50px;
  cursor: pointer;
  user-select: none;
}
.fa:hover {
  color: darkblue;
}
.navbar-bccolor{
	background-color: #2F4F4F;
}
#profile{
	float:left;
}
#image{
	float:left;
}
#search{
	float:left;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">

<body>
<%
String message = (String) session.getAttribute ("username");
%>


<nav class="navbar navbar-expand-md navbar-dark navbar-bccolor">
  <a class="navbar-brand" href="Home.jsp">Home</a>
 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarnav" aria-controls="navbarnav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
     <div class="collapse navbar-collapse" id="navbarnav">
	    	<ul class="navbar-nav mr-auto">
	    	
	      		<li class="nav-item ">
		      		<a class = "nav-link" id="about" href="Aboutus.jsp">About Us</a>
	      		</li>
	      		<li class="nav-item">
		      		<a class = "nav-link" id="profile" href="Profile.jsp">Profile</a>
	      		</li>
	      		<li class="nav-item">
		      		<a class = "nav-link" id="signout" href="register.jsp">Sign Out</a>
	      		</li>
	      		
	    	</ul>
	    	<h2 id = "welcome" style= "color: white;">WELCOME! <%= message %></h2>
	 </div>
</nav>
<br>
	<div class="container">	
		<div class="row">
			<img id="profile" src = "image/ken.jpg" style= "width: 20%;"class="rounded-circle">
			<img id="profile" src = "image/kc.jpg" style= "height: 10%;">
			<h1 id = "image" class="col-12 mt-4 mb-4"><%= message %>'s Profile</h1>
				
		</div> 
	</div> 
	<br>
	<br>
	<div class="container" >
	
		<div class="row">
		<div class="col-12 col-md-6" style="border:dashed; padding:15px; width: 50%;">
			<h2 style ="color: green;"><%= message %>'s Favorite Bills</h2>
			<p>
			<i class="fa fa-star" style="font-size:24px;color:blue"></i>
			Making appropriations for the Departments of Commerce and Justice, Science, and Related Agencies for the fiscal year ending September 30, 2020, and for other purposes.
			</p>
			<p>
			<i class="fa fa-star-o" style="font-size:24px;color:blue"></i>
			Commending the performance of the Special Operations Forces and a military working dog in the eradication of the terrorist leader of the Islamic State of Iraq and Syria.			</p>
			<p>
			<i class="fa fa-star" style="font-size:24px;color:blue"></i>
			A resolution condemning the horrific attack in Dayton, Ohio, and expressing support and prayers for all those impacted by that tragedy.			</p>
		</div>	
		<div class="col-12 col-md-5" style="border:dashed; padding:15px; width: 50%;">
			<h2 style ="color: green;"><%= message %>'s Friends</h2>
			<p>
			<i onclick="toggle(this)" style="font-size:24px;"class="fa fa-thumbs-up"></i>
			Jady Chan
			</p>
			<p>
			<i onclick="toggle(this)" style="font-size:24px;"class="fa fa-thumbs-up"></i>
			O G
			</p>
			<p>			
			<i onclick="toggle(this)" style="font-size:24px;"class="fa fa-thumbs-up"></i>
			Sang Kim
			</p>
			<p>			
			<i onclick="toggle(this)" style="font-size:24px;"class="fa fa-thumbs-up"></i>
			Brian Koo
			</p>
			<p>			
			<i onclick="toggle(this)" style="font-size:24px;"class="fa fa-thumbs-up"></i>
			Vicky Yu
			</p>
			<p>			
			<i onclick="toggle(this)" style="font-size:24px;"class="fa fa-thumbs-up"></i>
			Victoria Shin</p>						
		</div>	
		</div> <!-- .row -->
	</div> 
</body>
</html>