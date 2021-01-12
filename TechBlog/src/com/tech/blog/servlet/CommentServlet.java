package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.CommentDao;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class CommentServlet
 */
//@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String comment=request.getParameter("ar");
		int pId=Integer.parseInt(request.getParameter("pId"));
		int uId=Integer.parseInt(request.getParameter("uId"));
		
		CommentDao cmDao=new CommentDao(ConnectionProvider.getConnection());
		boolean b=cmDao.saveComment(pId, comment, uId);
		out.println(b);
	}

}
