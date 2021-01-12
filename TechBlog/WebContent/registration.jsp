<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>regiter</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.banner-background {
	clip-path: polygon(59% 0, 100% 0, 100% 49%, 100% 89%, 62% 88%, 26% 96%, 0 86%, 0 0,
		27% 0);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<main class="primary banner-background d-flex  " style="height:120vh">
		<div class="container">
		<div class="row ">
			<div class="col-md-6 offset-md-3">

				<div class="card ">

				
					<div class="card-header primary text-white text-center"><span class="fa fa-user-plus fa-3x"></span><br>Register here</div>
					

					<div class="card-body">

						<form action="rs" method="post" id="reg-form">
						<div class="form-group">
								<label for="exampleInputEmail1">User Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="name" placeholder="Enter username">
								
							</div>
						
						
						
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" name="password" id="exampleInputPassword1"
									placeholder="Password">
							</div>
							<input type="radio" name="gender" value="male"> Male
							<input type="radio" name="gender" value="female"> Female
							<br>
								<div class="form-group">
								
								<textarea class="form-control" rows="5" placeholder="Enter something about yourself" name="about"></textarea>
								
								
								
								</div>
							
							
							
							<br><br>
							<div class="form-check">
								<input type="checkbox" name="check" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Check me out</label>
							</div>
							
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>


					</div>

				</div>

			</div>


		</div>
	</div>

	</main>



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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	
	       <script>
            $(document).ready(function () {
                console.log("loaded........")
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
               
                    //send register servlet:
                    $.ajax({
                        url: "rs",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
						if(data.trim()==='done'){
                            swal("registered successfully...........we are going to redirect to login page ")
                            .then((value) => {
                             window.location="login.jsp"
                            });
							}
                            
						else{
							
							swal(data)
							
						}
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR)
                            swal("something went wrong ");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>

</body>
</html>






















