package com.tech.blog.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class Abcd
 */
//@WebServlet("/Abcd")
@MultipartConfig
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String name = request.getParameter("edit-name");
		String email = request.getParameter("edit-email");
		String password = request.getParameter("edit-password");
		String about = request.getParameter("edit-about");
		Part part = request.getPart("edit-img");
		String img = part.getSubmittedFileName();

		// update the data in session
		HttpSession s = request.getSession();
		User user = (User) s.getAttribute("currentuser");
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setAbout(about);
		user.setPfimg(img);

		// change the data in the database

		UserDao ud = new UserDao(ConnectionProvider.getConnection());
		boolean b = ud.updateUser(user);
	
		
		if (b == true) {

			String path=request.getRealPath("/")+"img"+File.separator+user.getPfimg();
			if(Helper.saveFile(part.getInputStream(), path)) {
				
				out.println("updated");
				Message m=new Message("Profile updated successfully", "alert-success");
				s.setAttribute("msg", m);
			}
			
			else {
				
				out.println("please check!!! not updated");
				Message m=new Message("Please select image carefuuly", "alert-danger");
				s.setAttribute("msg", m);
			}

		}

		else {

			out.println("error");
			Message m=new Message("something went wrong", "alert-danger");
			s.setAttribute("msg", m);
		}
		
		response.sendRedirect("profile.jsp");

		

	}
}
