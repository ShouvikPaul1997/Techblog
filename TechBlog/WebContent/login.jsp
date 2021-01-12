<!doctype html>
<%@page import="com.tech.blog.entities.Message"%>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>login</title>


<style>
.banner-background {
	clip-path: polygon(59% 0, 100% 0, 100% 49%, 100% 89%, 62% 88%, 26% 96%, 0 86%, 0 0,
		27% 0);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<main class="d-flex align-items-center primary banner-background"
		style="height: 80vh">

		<div class="container mt-3">
			<div class="row">
				<div class="col-md-4 offset-md-4">

					<div class="card" style="margin-top: -80px">
						<div class="card-header primary text-white text-center">
							<span class="fa fa-user-circle fa-3x"></span><br>login here
						</div>
						<%
							Message m = (Message) session.getAttribute("msg");
						if (m != null) {
						%>
						<div class="alert <%=m.getCssclass() %>" role="alert"><%=m.getMsg() %></div>

						<%
							}
						
							session.removeAttribute("msg");
						%>

						<div class="card-body">
							<form action="LoginServlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" name="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter email"> <small id="emailHelp"
										class="form-text text-muted">We'll never share your
										email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control" name="password"
										id="exampleInputPassword1" placeholder="Password">
								</div>

								<button type="submit" class="btn text-white primary ">Submit</button>
							</form>
						</div>
					</div>

				</div>

			</div>

		</div>


	</main>



	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>