<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	Thread.sleep(400);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	margin: 0;
	left: 0;
	right: 0;
	bottom: 0;
}

ss
.container-fluid {
	position: relative;
	height: 100%;
}

body {
	background: url("img/background.jpg");
}
</style>
<style type="text/css">
.unlike {
	color: #858080;
}

.like {
	color: #f00404;
}

i {
	cursor: pointer;
}
</style>

</head>
<body>



	<%
		int pId = Integer.parseInt(request.getParameter("postid"));
	PostDao pd = new PostDao(ConnectionProvider.getConnection());
	Post p = pd.getPostById(pId);

	UserDao ud = new UserDao(ConnectionProvider.getConnection());
	LikeDao ld = new LikeDao(ConnectionProvider.getConnection());

	User uu = (User) session.getAttribute("currentuser");
	User u = ud.getUserById(p.getUserId());
	%>

	<div id="container" class="container-fluid">

		<div class="row">
			<div class="col-8 offset-2">
				<div class="card mt-3 shadow-lg">
					<div class="card-header card-header-color"
						style="background-color: #c0dae2">
						<div class="row">
							<div class="container-fluid col-md-4">
								Posted by: <a href="#"><%=u.getName()%></a>
							</div>
							<div class="container-fluid col-md-3"></div>
							<div class="container-fluid col-md-5">
								on:
								<%=p.getpTime().toLocaleString()%>

							</div>

						</div>

					</div>
					<div class="card-body">
						<h5 class="card-title"><%=p.getpTitle()%></h5>
						<p class="card-text"><%=p.getpDesc()%>
						<pre><%=p.getpCode()%></pre>

					</div>
					<div class="card-footer text-muted" style="background: #e6e6e6">



						<i onclick="doLike(this,<%=p.getPid()%>,<%=uu.getId()%>)"
							class="fa fa-heart <%=ld.checkLike(p.getPid(), uu.getId())%>">
							<span class="like-counter" id="<%=p.getPid()%>"> <%=ld.countLike(p.getPid())%>
						</span>
						</i>



					</div>
					<div class="card-body " id="commentbody">


						<div class="form-group">
							<label for="exampleFormControlTextarea1">Example textarea</label>
							<textarea class="form-control" id="exampleFormControlTextarea1"
								rows="3"></textarea>
							<button onclick="postComment(<%=p.getPid()%>,<%=uu.getId()%>,
								)" id="postcomment" type="button"
								class="btn btn-primary">Post</button>
						</div>
						<p>fhcoibdfchdbcvhhdbvowdwbvcowdvhbvwdwsvbbvlhdbvbdvbdvbdhbvbh</p>
						<p>fhcoibdfchdbcvhhdbvowdwbvcowdvhbvwdwsvbbvlhdbvbdvbdvbdhbvbh</p>
						<p>fhcoibdfchdbcvhhdbvowdwbvcowdvhbvwdwsvbbvlhdbvbdvbdvbdhbvbh</p>
						<p>fhcoibdfchdbcvhhdbvowdwbvcowdvhbvwdwsvbbvlhdbvbdvbdvbdhbvbh</p>

					</div>
				</div>


			</div>

		</div>




	</div>





























	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="javascript/blog.js"></script>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- update profile script tag start -->

	<script type="text/javascript" src="website.js">
	
	
	
	</script>

	<script type="text/javascript">
	function postComment(pId,uId) {
		console.log(this);
		
	}
	
	</script>



</body>
</html>
