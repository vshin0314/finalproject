<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Slabo+27px&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Search Results</title>
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
function selectCheck() {
	if(document.myform.select.value == "selectnon"){
		alert("Please select option for search!");
		return false;
	}
}
</script>
<style>
.fa {
  font-size: 50px;
  cursor: pointer;
  user-select: none;
}
.fa:hover {
  color: darkblue;
}
body {
   
}
#text{
padding-top: 20px;}
td, tr{
font-size: 20px;
font-family: 'Slabo 27px', serif;
}
td #text{
padding-top: 20px;
}
#results{
  margin-left: 10%;
  margin-right: 10%;
 
}
.navbar-bccolor{
	background-color: #2F4F4F;
}
.form-control{
margin-top: 7px;}
td{
  display: flex;
  float: left;
}
#search{
float:left;
}
#select{
font-size:16px;
}
#header{
padding-left: 10%;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
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
	    	
<h2 id = "welcome" style= "color: white;">WELCOME! <%= message %></h2>
	    
	 </div>
</nav>
<br>
<h1 id = header>Search Results for: <%=request.getAttribute("keyword") %></h1>
<br>
<br>
<h2 id = "result"></h2>
<form name="myform" action="Servlet" onsubmit="return selectCheck()" style="padding-left: 30%;">

  <input type="text" style = "width:400px;" class="form-control" id="search" name="search" placeholder = "Search Bills">
  <select name="select" style= "width: 150px;height: 40px;" onmouseout="return placeholder()" >
    <option value="selectnon">--SELECT--</option>
    <option value="bills">Bill</option>
    <option value="users">User</option>
    
  </select>
<input type = "submit" value = "Submit" class="btn btn-primary">
</form>
<div id="results"></div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	let data = <%= request.getAttribute("data") %>;
	let keyword = "<%=request.getAttribute("keyword") %>";
	let option = "<%=request.getAttribute("option") %>";
	if(option == "users") {
		if(data.users.length == 0) {
			alert("No search result!");
			window.location.replace("Home.jsp");
		}
	}else {
		if(data.results[0].bills.length == 0) {
			alert("No search result!");
			window.location.replace("Home.jsp");
		}
	}
	
	
	$("#results").append("<hr style='border-top: dotted 1px;' />");
	if(option == "users") {
		for(let i =0; i<data.users.length; ++i){
			$("#results").append('<table><tr><td rowspan="4">&nbsp</td><td>&nbsp</td></tr>'
			+'<tr><td>&nbsp<strong>Name: </strong> '+data.users[i].Fname + " " + data.users[i].Lname+'</td></tr>'
			+'<tr><td>&nbsp<strong>Username: </strong> '+data.users[i].username+'</td></tr>'
			+'<tr><td>&nbsp<strong>Linkedin: </strong> '+data.users[i].linkedin+'</td></tr></table>'
			+'<button id="button" type="button">Friend Request!</button>'
			+"<hr style='border-top: dotted 1px;' />");
			document.querySelector("#button").onclick = function() {
				//user not logged in
				if(sessionStorage.getItem("log") == null) {
					alert("Please log in");
				//logged in user
				}else {
					var xhttp = new XMLHttpRequest();
					xhttp.open("GET", "Addfriend?un="+ sessionStorage.getItem("log") +
							"&friend=" + data.users[i].username, false);
					xhttp.send();
				}
			}
		}
	}else {
		var party = [0];
		var imgArray = new Array();
		var newimg = document.createElement("img"); 
		var summary = [0];
		var buttons = [0];
		for(i=0; i<data.results[0].bills.length; i++) {
			imgArray[i] = new Image();
			if(data.results[0].bills[i].sponsor_party == "D"){
				party[i] = "Democratic";
			}
			else{
				party[i] = "Republican";
			}
			
			if(data.results[0].bills[i].summary_short == "" ||data.results[0].bills[i].summary_short==null){
				summary[i] = "No Summary";
			}
			else{
				summary[i] = data.results[0].bills[i].summary_short;
			}
			$("#results").append('<table><tr><td >&nbsp</td><td>&nbsp</td></tr>'
			+'<tr><td style="vertical-align: center;">&nbsp<strong style = "padding-bottom:12px;font-size: 30px; color: blue;">Title:</strong> '+data.results[0].bills[i].title+'</td></tr>'
			+'<tr><td>&nbsp<strong style = "font-size: 30px; color: blue;"> Name of the Sponser: </strong> '+data.results[0].bills[i].sponsor_name+'</td></tr>'
			+'<tr><td>&nbsp<strong style = "font-size: 30px; color: blue;">Party:</strong> <div>'+party[i]+'</div></td></tr>'
			+'<tr><td>&nbsp<strong style = "font-size: 30px; color: blue;">Sponsor State:</strong>'+data.results[0].bills[i].sponsor_state+'</td></tr>'
			+'<tr><td>&nbsp<strong style = "font-size: 30px; color: blue;">Summary: </strong>'+summary[i]+'</td></tr>'+
			'<tr><td>&nbsp<strong><button id= "button'+ i.toString() +'" value="' + data.results[0].bills[i].bill_id +'">Follow</button></td></tr></table>'
			
			+"<hr style='border-top: dotted 1px;' />");
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "FollowCheck?src=/results.jsp" +
					"&un=" + sessionStorage.getItem("log") +
					"&billid=" +  data.results[0].bills[i].bill_id, false);
			xhr.send();
			//already following
			console.log(xhr.responseText);
			if(xhr.responseText == "true") {
				document.querySelector("#button"+i.toString()).style = "font-size:36px;";
				document.querySelector("#button"+i.toString()).setAttribute("class", "fa fa-thumbs-down");
				document.querySelector("#button"+i.toString()).onclick = function() {
					if(sessionStorage.getItem("log") == null) {
						alert("Please Sign in!");
					}else {
						alert(this.getAttribute("value"));
						this.setAttribute("class", "fa fa-thumbs-up");
						var xhttp = new XMLHttpRequest();
						xhttp.open("GET", "Follow?src=/results.jsp" +
								"&follow=true" +
								"&un=" + sessionStorage.getItem("log") +
								"&billid=" +  this.getAttribute("value"), true);
						xhttp.send(); 
					}
				}
			//not following
			}else {
				document.querySelector("#button"+i.toString()).style = "font-size:36px;";
				document.querySelector("#button"+i.toString()).setAttribute("class", "fa fa-thumbs-up");
				document.querySelector("#button"+i.toString()).onclick = function() {
					if(sessionStorage.getItem("log") == null) {
						alert("Please Sign in!");
					}else {
						alert(this.getAttribute("value"));
						this.setAttribute("class", "fa fa-thumbs-down");
						var xhttp = new XMLHttpRequest();
						xhttp.open("GET", "Follow?src=/results.jsp" +
								"&follow=false" +
								"&un=" + sessionStorage.getItem("log") +
								"&billid=" +  this.getAttribute("value"), true);
						xhttp.send(); 
					}
				}
			}
			
		}
	}
	<%
		session.removeAttribute("data");
	%>
	
	function placeholder() {
	   if(document.myform.select.value == "bills"){
		   document.getElementById("search").setAttribute("placeholder", "Search Bills with keywords");
	   }
	   if(document.myform.select.value == "users"){
		   document.getElementById("search").setAttribute("placeholder", "Search Users with First Name or Last Name");
	   }
	}
	
</script>
</html>