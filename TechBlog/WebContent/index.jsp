<%@page import="com.tech.blog.helper.Demo"%>
<%@page import="com.tech.blog.helper.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style >

.banner-background{
clip-path: polygon(59% 0, 100% 0, 100% 49%, 100% 89%, 62% 88%, 26% 96%, 0 86%, 0 0, 27% 0);
}

</style>

</head>
<body>

<!--navbar-->

<%@include file="navbar.jsp" %>

<div class="container-fluid p-0 m-0 ">

	<div class="jumbotron primary banner-background">
	<div class="container">
	<h1>Welcome all to TechBlog</h1>
	<p>Search for the latest news, get updated. To post your blog sign up below and start blogging---boooooooooom!!!!!!!!!!!!</p>
	<a class="btn btn-outline-light" href="registration.jsp"><span class="fa fa-spinner fa-spin"></span>start here</a>
	<a href="login.jsp"  class="btn btn-outline-light"><span class="fa fa-sign-in "></span>  Log in</a>
	
	
	</div>
	</div>


</div>


<!-- cards -->

<div class="container">

<!-- 1st row -->
	<div class="row mb-5">
	
	  <div class="col-md-4">
		<div class="card">
			<div class="card-body">
    			<h5 class="card-title">Card title</h5>
   				 <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    				<a href="#" class="btn btn-primary">Go somewhere</a>
 		    </div>
		
		</div>
	
	</div>
	
	 <div class="col-md-4">
		<div class="card">
			<div class="card-body">
    			<h5 class="card-title">Card title</h5>
   				 <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    				<a href="#" class="btn btn-primary">Go somewhere</a>
 		    </div>
		
		</div>
	
	</div>
	
	 <div class="col-md-4">
		<div class="card" >
			<div class="card-body">
    			<h5 class="card-title">Card title</h5>
   				 <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    				<a href="#" class="btn btn-primary">Go somewhere</a>
 		    </div>
		
		</div>
	
	</div>

</div>


<!-- 2nd row -->
	<div class="row">
	
	  <div class="col-md-4">
		<div class="card" >
			<div class="card-body">
    			<h5 class="card-title">Card title</h5>
   				 <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    				<a href="#" class="btn btn-primary">Go somewhere</a>
 		    </div>
		
		</div>
	
	</div>
	
	 <div class="col-md-4">
		<div class="card">
			<div class="card-body">
    			<h5 class="card-title">Card title</h5>
   				 <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    				<a href="#" class="btn btn-primary">Go somewhere</a>
 		    </div>
		
		</div>
	
	</div>
	
	 <div class="col-md-4">
		<div class="card">
			<div class="card-body">
    			<h5 class="card-title">Card title</h5>
   				 <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    				<a href="#" class="btn btn-primary">Go somewhere</a>
 		    </div>
		
		</div>
	
	</div>

</div>






</div>



<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="javascript/blog.js"></script>

</body>
</html>