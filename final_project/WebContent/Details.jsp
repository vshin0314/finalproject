<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Slabo+27px&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Details</title>
</head>
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
		document.getElementById("login").onclick = function signout(){
			sessionStorage.removeItem("log");
		}
		document.getElementById("favbill").innerHTML = "Bill Details";
	 	
		//setInterval(checkRequest, 1000);
	//do something to change based on login
	}else {
		alert("Please Login!");
		window.location.replace("login.jsp");
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
<style>
.fa {
  font-size: 50px;
  cursor: pointer;
  user-select: none;
}
.fa:hover {
  color: darkblue;
}
#text{
padding-top: 20px;}
#results{
  margin-left: 10%;
  margin-right: 10%;
}
.navbar-bccolor{
	background-color: #2F4F4F;
}
.form-control{
margin-top: 7px;}

#search{
float:left;
}
#select{
font-size:16px;
}
#header{
padding-left: 10%;
}
#details {
	margin-left: auto;
	margin-right: auto;
}
.row {
	justify-content: center;
}
</style>
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
<br><br><br>
<div class="container" >
	<div class="row">
		<div id="details" style="border:dashed; padding:15px; width: 50%;">
			<h2 id="favbill" style ="color: green;"></h2>
				<table id="favBills"></table>
		</div>	
	</div>
</div> 
</body>
<script>
var index = window.location.href.split('=')[1];
let favbills = document.querySelector("#favBills");
let xhr = new XMLHttpRequest();
xhr.open("GET", "Detail?billid=" + index, false);
xhr.send();
let billresult = JSON.parse(xhr.responseText);
let billRow = document.createElement("tr");
let billContent = document.createElement("td");

if(billresult.results[0].sponsor_party == "D"){
	sponsor_party = "Democratic";
}
else{
	sponsor_party = "Republican";
}

if(billresult.results[0].summary_short == "" ||billresult.results[0].summary_short==null){
	summary_short = "No Summary";
}
else{
	summary_short = billresult.results[0].summary_short;
}

let billtitle = document.createElement("p");
billtitle.innerHTML = "<strong><em>Title: </em></strong>" + billresult.results[0].title;
billContent.appendChild(billtitle);

let billsponsor = document.createElement("p");
billsponsor.innerHTML = "<strong><em>Sponsor: </em></strong>" + billresult.results[0].sponsor;
billContent.appendChild(billsponsor);

let party = document.createElement("p");
party.innerHTML = "<strong><em>Sponsor Party: </em></strong>" + sponsor_party;
billContent.appendChild(party);

let sponsorState = document.createElement("p");
sponsorState.innerHTML = "<strong><em>Sponsor State: </em></strong>" + billresult.results[0].sponsor_state;
billContent.appendChild(sponsorState);

let summary = document.createElement("p");
summary.innerHTML = "<strong><em>Summary: </em></strong>" + summary_short;
billContent.appendChild(summary);

let committee = document.createElement("p");
committee.innerHTML = "<strong><em>Committees: </em></strong>" + billresult.results[0].committees;
billContent.appendChild(committee);

let date = document.createElement("p");
date.innerHTML = "<strong><em>Introduced Date: </em></strong>" + billresult.results[0].introduced_date;
billContent.appendChild(date);

let button = document.createElement("p");
button.innerHTML = '<strong><button id= "button" value="' + index +'">Follow</button>';
billContent.appendChild(button);

let back = document.createElement("p");
back.innerHTML = '<strong><button id= "back" onclick = "window.history.back();" style="flex:right;">Back</button>';
billContent.appendChild(back);

billRow.appendChild(billContent);
favbills.appendChild(billRow); 

var xhr2 = new XMLHttpRequest();
xhr2.open("GET", "FollowCheck?src=/results.jsp" +
		"&un=" + sessionStorage.getItem("log") +
		"&billid=" +  index, false);
xhr2.send();
//already following
if(xhr2.responseText == "true") {
	document.querySelector("#button").style = "font-size:36px;";
	document.querySelector("#button").setAttribute("class", "fa fa-thumbs-down");
	document.querySelector("#button").innerHTML = "Unfollow";
	document.querySelector("#button").onclick = function() {
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
	document.querySelector("#button").style = "font-size:36px;";
	document.querySelector("#button").setAttribute("class", "fa fa-thumbs-up");
	document.querySelector("#button").innerHTML = "Follow";
	document.querySelector("#button").onclick = function() {
		if(sessionStorage.getItem("log") == null) {
			alert("Please Sign in!");
		}else {
			alert("You are now following bill " + this.getAttribute("value") + "!");
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
</script>
</html>
