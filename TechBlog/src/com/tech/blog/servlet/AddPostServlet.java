package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class AddPostServlet
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	PrintWriter out=response.getWriter();
	HttpSession s=request.getSession();
	User user=(User) s.getAttribute("currentuser");

	
	int cId= Integer.parseInt(request.getParameter("cId"));
	String title= request.getParameter("title");
	String desc= request.getParameter("desc");
	String code= request.getParameter("code");
	Post p=new Post(title, desc, code, cId,user.getId());
	PostDao pd=new PostDao(ConnectionProvider.getConnection());
	if(pd.savePost(p)) {
		
		out.println("done");
		
		
	}

	else {
		
		
		out.println("error post updation");
		
		
	}
		
		

	
	}

}
