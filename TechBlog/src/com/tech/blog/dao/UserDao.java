package com.tech.blog.dao;
import java.sql.*;

import com.tech.blog.entities.User;
public class UserDao {
	Connection con;
	String qry="insert into techblog.user(uname,email,password,gender,about) values(?,?,?,?,?)";
	public UserDao(Connection con) {
		
		this.con = con;
	}
	
	public boolean saveuser(User user) {
	boolean b=false;
		try {
			
			PreparedStatement pstmt=con.prepareStatement(qry);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			pstmt.executeUpdate();
			b=true;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return b; 
		}
	
//	get user details for login
	
	
	public User getUserByEmailPassword(String email,String password) {
		User user=null;
		String qry = "select * from user where email =? and password=?";
		ResultSet rs=null;
		
		try {
			PreparedStatement pstmt=con.prepareStatement(qry);
			
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				user=new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("uname"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setRegdate(rs.getTimestamp("regdate"));
				user.setPfimg(rs.getString("pfimg"));
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
		
		return user;
		
		
		
		
		
	}
	
	
	public boolean updateUser(User user) {
		String qry="update techblog.user set uname=?, email=?, password=?, about=?, pfimg=? where id=?";
		PreparedStatement pstmt=null;
		boolean b=false;
		try {
			pstmt=con.prepareStatement(qry);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getAbout());
			pstmt.setString(5, user.getPfimg());
			pstmt.setInt(6, user.getId());
			pstmt.executeUpdate();
			b=true;
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
			return b;
	}
	
	public User getUserById(int userid) {
		User u1=null;
		
		String qry = "select * from techblog.user where id=?";
		ResultSet rs=null;
		
		try {
			PreparedStatement pstmt=con.prepareStatement(qry);
			pstmt.setInt(1,userid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String name=rs.getString("uname");
				String email=rs.getString("email");
				String gender=rs.getString("gender");
				String about=rs.getString("about");
				Timestamp regDate=rs.getTimestamp("regdate");
				String pfimg=rs.getString("uname");
				 u1=new User(userid, name, email, gender, regDate, about, pfimg);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return u1;
		
		
		
		
		
		
		
	
		
	}
	
}


























