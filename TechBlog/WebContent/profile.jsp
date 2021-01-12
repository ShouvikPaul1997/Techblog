<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.CategoryDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.tech.blog.entities.*"%>
<%@ page errorPage="error_page.jsp"%>

<%
	User user = (User) session.getAttribute("currentuser");
if (user == null) {

	response.sendRedirect("login.jsp");

}
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

</head>
<body>

	<!-- navbar -->

	<nav class="navbar navbar-expand-lg navbar-dark  primary">
		<a class="navbar-brand" href="index.jsp"><span
			class="fa fa-rocket fa-spin"></span>Techblog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"><span class="fa fa-home"></span> Home <span
						class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown active"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-bars"></span>
						Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming</a> <a
							class="dropdown-item" href="#">Learn DSA</a> <a
							class="dropdown-item" href="#">Trending tech</a> <a
							class="dropdown-item" href="#">Today's hot picks</a></li>
				<li class="nav-item active"><a class="nav-link" href="#"><span
						class="fa fa-address-card"></span> Contact Us</a></li>
				<li class="nav-item active"><button type="button"
						class="btn btn-primary" data-toggle="modal"
						data-target="#postmodal" style="">Post my blog</button></li>


			</ul>





			<ul class="navbar-nav mr-right">

				<li class="nav-item active"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#profilemodal"><span
						class="fa fa-user-circle"></span><%=user.getName()%> </a></li>

				<li class="nav-item active"><a class="nav-link"
					href="Logout"><span class="fa fa-user-plus"></span>
						Logout</a></li>

			</ul>

		</div>
	</nav>
	<!-- end of navbar -->








	<!-- profile update success or failure msg below -->

	<%
		Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssclass()%>">

		<%=m.getMsg()%>

	</div>


	<%
		}

	session.removeAttribute("msg");
	%>



	<!-- start of post modal -->


	<div class="modal fade" id="postmodal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-body">
					<div class="container">




						<!-- start of post form -->



						<form action="AddPostServlet" method="post" class="form-group"
							id="postform">

							<table class="table">

								<tbody>

									<tr>
										<th scope="row">Select Category</th>
										<td><select name="cId" id="cars" class="form-control"
											required="required">
												<option selected value="" disabled="disabled">-----Select
													Category-------</option>

												<%
													CategoryDao c = new CategoryDao(ConnectionProvider.getConnection());
												ArrayList<Category> lst = (ArrayList<Category>) c.getCategory();

												for (Category type : lst) {
												%>
												<option value="<%=type.getCid()%>"><%=type.getCname()%>
												</option>


												<%
													}
												%>
										</select></td>

									</tr>



									<tr>
										<th scope="row">Title</th>
										<td><input type="text" placeholder="enter title"
											class="form-control" name="title"></td>

									</tr>
									<tr>
										<th scope="row">Blog desc</th>
										<td><textarea required="required"
												placeholder="Write something(must not be empty)"
												class="form-control" rows="5" name="desc"></textarea></td>

									</tr>

									<tr>
										<th scope="row">Write code</th>
										<td><textarea placeholder="Write some code if any"
												class="form-control" rows="5" name="code"></textarea></td>

									</tr>
								</tbody>
							</table>
							<div class="container text-center">

								<button type="submit" class="btn btn-outline-primary">Post</button>

							</div>
						</form>



						<!-- end of post form -->



					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>



	<!-- end of post modal -->




	<!-- start of profile modal -->


	<div>

		<!-- Modal -->
		<div class="modal fade" id="profilemodal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">

						<div class="container text-center">
							<div class="container text-center">

								<img src="img/<%=user.getPfimg()%>"
									style="width: 100px; border-radius: 100px;">


							</div>

							<h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>

						</div>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<!-- start of table -->

						<div class="container" id="profile-details">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row" style="padding-right: 85px;">email</th>
										<td class="pl=3 "><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">gender</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">about</th>
										<td class="modal-body"><%=user.getAbout()%></td>

									</tr>
									<tr>
										<th scope="row">Reg-Date</th>
										<td class="modal-body"><%=user.getRegdate().toString()%></td>

									</tr>
								</tbody>
							</table>
						</div>

						<!-- end of table -->


						<!-- start of editable   table -->
						<div class="container" id="profile-edit" style="display: none">


							<form class="form-group" action="EditProfile" method="post"
								enctype="multipart/form-data">

								<div class="container" id="profile-details">
									<table class="table">

										<tbody>
											<tr>
												<th scope="row" style="padding-right: 85px;">name</th>
												<td class="pl=3 "><input class="form-control"
													name="edit-name" type="text" value="<%=user.getName()%>">
												</td>

											</tr>


											<tr>
												<th scope="row" style="padding-right: 85px;">email</th>
												<td class="pl=3 "><input type="email"
													class="form-control" name="edit-email"
													value="<%=user.getEmail()%>"></td>

											</tr>
											<tr>
												<th scope="row" style="padding-right: 85px;">password</th>
												<td class="pl=3 "><input type="password"
													class="form-control" name="edit-password"
													value=<%=user.getPassword()%>></td>

											</tr>


											<tr>
												<th scope="row">gender</th>
												<td><%=user.getGender()%></td>

											</tr>
											<tr>
												<th scope="row">about</th>
												<td class="modal-body "><textarea rows="3"
														name="edit-about" class="form-control"><%=user.getAbout()%></textarea></td>

											</tr>
											<tr>
												<th scope="row">Reg-Date</th>
												<td class="modal-body"><%=user.getRegdate().toString()%></td>

											</tr>



											<tr>
												<th scope="row">upload img</th>
												<td class="modal-body"><input type="file"
													name="edit-img" class="form-control"
													value=<%=user.getPfimg()%>></td>

											</tr>
										</tbody>
									</table>
								</div>

								<div class="container text-center">

									<button id="profile-update-btn" type="submit"
										class="btn btn-primary  ">save changes</button>

								</div>

							</form>


						</div>

						<!-- end of editable table -->

					</div>
					<div class="modal-footer justify-content-between">


						<div>
							<button id="edit-profile-button" type="button"
								class="btn btn-primary ">Edit</button>

						</div>




						<div>

							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- end of profile modal -->




	<!-- start of post category on the left panel -->


	<div class="container-fluid " style="">
		<div class="row">



			<div class="container-fluid col mt-1" style="">
				<div class="list-group">
					<a href="#" onclick="getPosts(0,this)" class="c-link list-group-item active list-group-item-action">All category</a>


					<!-- category -->

					<%
						CategoryDao cd = new CategoryDao(ConnectionProvider.getConnection());
					ArrayList<Category> cat = (ArrayList<Category>) cd.getCategory();
					for (Category ca : cat) {
					%>

					<a href="#" onclick="getPosts(<%=ca.getCid() %>,this)" class="c-link list-group-item list-group-item-action"><%=ca.getCname()%></a>



					<%
						}
					%>


				</div>



			</div>
			<!-- end of post category on the left panel -->


			<!-- start of post div block -->

			<div class="container-fluid col-md-7" style="">

				<!-- post column -->

				<div id="loader" class=" container text-center">
					<!-- loader -->

					<div class="spinner-border text-primary" role="status">
						<span class="sr-only">Loading...</span>
					</div>
					<div>Loading...</div>
				</div>



				<div id="posts">
					<!-- all posts -->

				</div>


			</div>
			<div class="container-fluid col-md-2" style=""></div>

		</div>

	</div>

	<!-- end of post div -->






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

<script type="text/javascript" src="website.js"></script>

	<script>
		let val = false;
		$('#edit-profile-button').click(function() {
			if (val == false) {

				$("#profile-details").hide();
				$("#profile-edit").show();
				$(this).text("back")
				val = true;

			}

			else {

				$("#profile-details").show();
				$("#profile-edit").hide();
				val = false;
				$(this).text("Edit")
			}

		})
	</script>
	<!-- update profile script tag end-->




	<!-- send post script tag start -->

	<script>
		$(document).ready(function name() {

			$('#postform').on("submit", function(e) {
				console.log("submitted")
				e.preventDefault();
				let form = new FormData(this);
				document.getElementById("postform").reset();
				$.ajax({

					url : "AddPostServlet",
					type : 'POST',
					data : form,
					success : function(data, textStatus, jqXHR) {
						if (data.trim() == 'done') {

							swal("updated successfully", "", "success");

						}

						else {

							swal("something went wrong", "", "error");

						}
					},

					error : function(jqXHR, textStatus, errorThrown) {

					},

					processData : false,
					contentType : false,

				})

			})

		})
	</script>

	<script type="text/javascript">
		
	</script>




	<!-- send post script tag end -->

	<!-- fetch all post javascript tag -->

	<script>
function getPosts(catId,temp) {
	$('#loader').show();
	$('#posts').hide();
	$('.c-link').removeClass('active');
	$(temp).addClass("active")
$.ajax({
		
		url:"allpost.jsp",
		data:{cid:catId},
		
		success : function(data, textStatus, jqXHR) {
			$('#loader').hide();
			$('#posts').show();
			$('#posts').html(data);
			
		},

		error : function(jqXHR, textStatus, errorThrown) {

		}
})

}

$(document).ready(function () {
		let allPostActive=$('.c-link')[0];	
		getPosts(0,allPostActive);
		
		
	})



</script>






	<!-- fetch all post javascript tag -->
</body>
</html>



























