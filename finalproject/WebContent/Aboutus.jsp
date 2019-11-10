<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>About Us</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="https://fonts.googleapis.com/css?family=Anton&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab&display=swap" rel="stylesheet">
	<!-- BootStrap css -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	

</head>
<style>
.navbar {
	background-color: gray;
	font-family: 'Roboto Slab', serif;
	
}

.container{
	font-family: 'Roboto Slab', serif;
}
.navbar-bccolor{
	background-color: #2F4F4F;

}
.navbar-custom { 
    background-color: lightgreen; 
} 

.nav-item{
	margin-right: 10px;

}


.jumbotron{
	text-align: center;
	background-image: url("image/jumtron.jpg");
	background-position: center;
	text-align: center;
	color:		white;
	
	background-size: cover;
	font-family: 'Anton', sans-serif;
}

.col img{
	width: 100%;
}

.col{
text-align: center;
	margin-left: auto;
	margin-right: auto;
}

.row{
	border-bottom: black;
	border-bottom-style: solid;
	border-bottom-width: 1px;
	padding-bottom :5%;
	padding-top: 5%;
	padding-left:1%;
	padding-right:1%;
}
.col-md-4{
	padding: 4%;
}
@media (min-width: 768px){
	.col{
		font-size: 16px;
	}
}
@media (min-width: 992px){
	.col{
		font-size: 20px;
	}
}


</style>
<body>
<nav class="navbar navbar-expand-md navbar-dark navbar-bccolor">
  <a class="navbar-brand" href="Home.jsp">Home  | </a>
 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarnav" aria-controls="navbarnav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
     <div class="collapse navbar-collapse" id="navbarnav">
	    	<ul class="navbar-nav mr-auto">
	      		<li class="nav-item ">
		      		<a class = "nav-link" href="Aboutus.jsp">About Us</a>
	      		</li>
	      		<li class="nav-item">
		      		<a class = "nav-link" href="About.jsp">About</a>
	      		</li>
	      		<li class="nav-item">
		      		<a class = "nav-link" href="login.jsp">Login</a>
	      		</li>
	      		<li class="nav-item">
		      		<a class = "nav-link" href="register.jsp">Sign Up</a>
	      		</li>
	    	</ul>
	 </div>
</nav>
<div id = "header">
	<div class = "jumbotron">
		<h1 class = "display-4">Our Team</h1>
		<p class ="lead">Find My Bills</p>
	</div>
</div>

<div class = "container">
	<div class ="row">
		
		<div class ="col col-12 col-md-4">
			<img src = "image/Sang.jpg" class="rounded-circle" alt = "Sang Kim">
			<h2>Sang Kim</h2>
			<h5>Master of JDBC</h5>
			<p> Sang Kim is a awesome guy majoring Computer Science and Business Administration at University of Southern California. He likes to play with JDBC on his free-time.</p>
<a href="https://www.linkedin.com/in/sangmin-sang-kim-86334a125/" class="btn btn-info" role="button">View More</a>
		</div>

	
		<div class ="col col-12 col-md-4">
			<img src = "image/Koo.jpeg" class="rounded-circle" alt = "Brian Koo">
			<h2>Brian Koo</h2>
			<h5>Master of Boba</h5>
			<p>Brian Koo is just a normal guy majoring Computer Science at University of Southern California. His hobby is bobaing, playing with boba, and drinking boba.</p>
			<a href="https://www.linkedin.com/in/brian-bone-seung-koo-3070aa191/" class="btn btn-info" role="button">View More</a>
			
		</div>

		
		<div class ="col col-12 col-md-4">
			<img src = "image/Jady.jpg" class="rounded-circle" alt = "Jady Chan">
			<h2>Jady Chan</h2>
			<h5>Master of Music</h5>
			<p>Jady Chan is a professional musician majoring COMPUTATIONAL NEUROSCIENCE and minoring Computer Science at University of Southern California. She likes to find bills on her free time. So we made this website. </p>
			<a href="https://www.linkedin.com/in/jady-chan-8333b110b/" class="btn btn-info" role="button">View More</a>
		</div>
	</div>
	<div class ="row">
		
		<div class ="col col-12 col-md-4">
			<img src = "image/Shin.jpg" class="rounded-circle" alt = "Victoria Shin">
			<h2>Victoria Shin</h2>
			<h5>Master of EunSook</h5>
			<p> Victoria Shin is a expert in Eunsook or Eunsooking. She is majoring Computer Science at University of Southern California. She is good at BUAD 304, KSEA, beating Korean Drum and KBBQing.</p>
			<a href="https://www.linkedin.com/in/eunsook-victoria-shin-0314/" class="btn btn-info" role="button">View More</a>
		</div>

	
		<div class ="col col-12 col-md-4">
			<img src = "image/ken.jpg" class="rounded-circle" alt = "KenCen">
			<h2>Ken Cen</h2>
			<h5>Master of CSCI561</h5>
			<p>Ken Cen has so many minors, majors and expecting to get a Masters Degree in Computer Science at University of Southern California. So, I don't have space to list all his degree on this website.</p>
			<a href="https://www.linkedin.com/in/ken-cen-410373a2/" class="btn btn-info" role="button">View More</a>
		</div>

		
		<div class ="col col-12 col-md-4">
			<img src = "image/vicky.jpg" class="rounded-circle" alt = "Vicky Yu">
			<h2>Vicky Yu</h2>
			<h5>Master of RA</h5>
			<p>Vicky Yu is a professional RA majoring Computer Science at University of Southern California. Her hobby is playing with React JS and Bootstrap.</p>
			<a href="https://www.linkedin.com/in/vickyyu1/" class="btn btn-info" role="button">View More</a>
		</div>
	</div>

<div class = "col-sm-12 footer">
	<p class = "footer">© 2019 Find My Bills, Inc. By 201 Trojans</p>
</div>


</div>
	<!-- JS that is not required by Bootstrap but required for some of Bootstrap -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>