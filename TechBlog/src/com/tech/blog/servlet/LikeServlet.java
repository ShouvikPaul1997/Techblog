package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private void Process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	String operation=request.getParameter("operation");
			int pId=Integer.parseInt(request.getParameter("pId"));
			int uId=Integer.parseInt(request.getParameter("uId"));
			PrintWriter out=response.getWriter();
			//out.println("data from server"+operation+" "+pId+" "+uId);
			
			LikeDao lD=new LikeDao(ConnectionProvider.getConnection());
			String s=lD.checkLike(pId, uId);
			if(s.equals("like")) {
				if(lD.deleteLike(pId, uId)) {
					out.println("liked");
					
				}
			
			
			
			}
			else {
				
				boolean b=lD.saveLike(pId, uId);
				out.println(b);
			}
			
	}
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request,response);
		
	}

}
