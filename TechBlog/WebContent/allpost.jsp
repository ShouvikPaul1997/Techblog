<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>


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

<style type="text/css">
.unlike{
color: #858080;

}
.like{
color: #f00404;

}
i{
	cursor: pointer;

}

</style>


</head>
<body>




	<%
		Thread.sleep(400);

	PostDao pd = new PostDao(ConnectionProvider.getConnection());
	int cid = Integer.parseInt(request.getParameter("cid"));
	ArrayList<Post> lst = null;

	if (cid == 0) {

		lst = pd.getPostAllCategory();

	} else {

		lst = pd.getPostByCategory(cid);

	}

	if (lst.size() == 0) {

		out.println("no data");
	}

	else {

		for (Post p : lst) {
	%>



		<div class="card mt-2 border border-warning shadow-lg" style="">

			<div class="card-body">
				<h6 class="card-title"><%=p.getpTitle()%></h6>
				<p class="card-text"><%=p.getpDesc()%></p>

			</div>

			<div class="card-footer text-muted">
				
					<%
						LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
					User uu = (User) session.getAttribute("currentuser");
					%>
					
					<i  onclick="doLike(this,<%=p.getPid()%>,<%=uu.getId()%>)"
							class="fa fa-heart <%=ld.checkLike(p.getPid(), uu.getId()) %>"> <span class="like-counter"
							id="<%=p.getPid()%>"> <%=ld.countLike(p.getPid())%>
						</span>
						</i>
						
						<a href="postdetails.jsp?postid=<%=p.getPid()%>"
							class="" style="margin-left:10px">     see more</a>
					


				
			</div>
		</div>





	<%
		}
	}
	%>




</body>
</html>
