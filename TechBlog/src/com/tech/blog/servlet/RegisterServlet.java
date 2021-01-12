package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		PrintWriter out=resp.getWriter();
		String check=req.getParameter("check");
	
		
		
		
			
	

		if(check==null) {
			out.println("box not checked");
			
		}
		else {
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			String gender=req.getParameter("gender");
			String about=req.getParameter("about");
			
			User user=new User(name, email, password, gender, about);
			UserDao ud=new UserDao(ConnectionProvider.getConnection());
			boolean b=ud.saveuser(user);
			if(b==true) {
				
				out.println("done");
				
				
			}
			
			else {
				
				out.println("error");
			}
		}
		
		
		
		
	}

}
