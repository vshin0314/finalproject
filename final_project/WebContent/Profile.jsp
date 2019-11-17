<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
</head>
<style>
.navbar-bccolor{
	background-color: #2F4F4F;

}
#profile{

float:left;}

#image{

float:left;}
#search{
float:left;
}

</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">

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
		      		<a class = "nav-link" href="register.jsp">Sign Out</a>
	      		</li>
	    	</ul>
	 </div>
</nav>
<br>
	<div class="container">
		
		<div class="row">
			<img id="profile" src = "image/ken.jpg" style= "width: 20%;"class="rounded-circle">
			<h1 id = "image" class="col-12 mt-4 mb-4">Ken's Profile</h1>
			<form action="Servlet">
 
<input type="text" style = "width:400px;" class="form-control" id="search" name="search" placeholder = "Search Bills">
<input type = "submit" value = "Submit" class="btn btn-primary">

</form>
	
			
		</div> 
		
	</div> 
	<br>
	<br>
	<div class="container" >
	
		<div class="row">
		<div class="col-12 col-md-6" style="border:dashed; padding:15px; width: 50%;">
			<h2 style ="color: green;">Ken's Favorite Bills</h2>
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
		
			<h2 style ="color: green;">Ken's Friends</h2>
			<p>
			<i class="fa fa-star" style="font-size:24px;color:Orange"></i>
			Jady Chan
			</p>
			<p>
			<i class="fa fa-star" style="font-size:24px;color:Orange"></i>
			Buchi Obi
			</p>
			<p>			
			<i class="fa fa-star" style="font-size:24px;color:Orange"></i>
		Sang Kim</p>
		<p>			
			<i class="fa fa-star" style="font-size:24px;color:Orange"></i>
		Brian Koo</p>
		<p>			
			<i class="fa fa-star" style="font-size:24px;color:Orange"></i>
Vicky Yu</p>
<p>			
			<i class="fa fa-star" style="font-size:24px;color:Orange"></i>
		Victoria Shin</p>						
		</div>	
		</div> <!-- .row -->
	</div> 
	
	





</body>

</html>