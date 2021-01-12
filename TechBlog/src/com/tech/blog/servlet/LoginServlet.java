package com.tech.blog.servlet;
import com.tech.blog.entities.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
//@WebServlet("/lis")
public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	
	PrintWriter out=response.getWriter();
	
	
	out.println("<html>");
	out.println("<head>");
	out.println("<title>");
	out.println("login servlet");
	out.println("</title>");
	out.println("</head>");
	out.println("<body>");
	
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	UserDao ud=new UserDao(ConnectionProvider.getConnection());
	User u=ud.getUserByEmailPassword(email, password);
	if(u==null) {
		
		Message msg=new Message("please check","alert-danger");
		HttpSession s=request.getSession();
		s.setAttribute("msg", msg);
		response.sendRedirect("login.jsp");
		
	}
	else {
		
		HttpSession s=request.getSession();
		s.setAttribute("currentuser", u);
		response.sendRedirect("profile.jsp");
		
	}
	
	out.println("fetched");
	out.println("</body>");
	out.println("</html>");


	
	
	
	}

}
