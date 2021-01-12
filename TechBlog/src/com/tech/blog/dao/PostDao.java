package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import java.util.List;
import com.tech.blog.entities.Post;

public class PostDao {

	Connection con = null;


	public PostDao(Connection con) {
		this.con = con;
	}
	


	public boolean savePost(Post p) {
		boolean b=false;
		String qry="insert into techblog.post (ptitle,pdesc,pcode,pcid,userid) values(?,?,?,?,?)";
		try {
			PreparedStatement pstmt=con.prepareStatement(qry);
			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2, p.getpDesc());
			pstmt.setString(3, p.getpCode());
			pstmt.setInt(4, p.getPcId());
			pstmt.setInt(5, p.getUserId());
			pstmt.executeUpdate();
			b=true;
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		
		
		
		return b;
		
		
		
		
	}
	
	
	public ArrayList<Post> getPostAllCategory() {
		List<Post> lst=new ArrayList<Post>();
		String qry="select * from techblog.post order by ptime desc";
		PreparedStatement pstmt=null;
		try {
			pstmt=con.prepareStatement(qry);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				int pId=rs.getInt("pid");
				String pTitle=rs.getString("ptitle");
				String pDesc=rs.getString("pdesc");
				String pCode=rs.getString("pcode");
				Timestamp pTime=rs.getTimestamp("ptime");
				int pcId=rs.getInt("pcid");
				int userId=rs.getInt("userid");
				
				Post post=new Post(pId, pTitle, pDesc, pCode, pTime, pcId, userId);
				lst.add(post);
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		return (ArrayList<Post>) lst;
		

	}
	
	
	
	
	public ArrayList<Post> getPostByCategory(int catId) {
		List<Post> lst=new ArrayList<Post>();
		String qry="select * from techblog.post where pcid=? order by ptime desc";
		PreparedStatement pstmt=null;
		try {
			pstmt=con.prepareStatement(qry);
			pstmt.setInt(1, catId);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				int pId=rs.getInt("pid");
				String pTitle=rs.getString("ptitle");
				String pDesc=rs.getString("pdesc");
				String pCode=rs.getString("pcode");
				Timestamp pTime=rs.getTimestamp("ptime");
				int pcId=rs.getInt("pcid");
				int userId=rs.getInt("userid");
				
				Post post=new Post(pId, pTitle, pDesc, pCode, pTime, pcId, userId);
				lst.add(post);
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		return (ArrayList<Post>) lst;
		

	}
	
	
	
	public Post getPostById(int pId) {
		Post post=null;
		String qry="select * from techblog.post where pid=?";
		PreparedStatement pstmt=null;
		try {
			pstmt=con.prepareStatement(qry);
			pstmt.setInt(1, pId);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				int postId=rs.getInt("pid");
				String pTitle=rs.getString("ptitle");
				String pDesc=rs.getString("pdesc");
				String pCode=rs.getString("pcode");
				Timestamp pTime=rs.getTimestamp("ptime");
				int pcId=rs.getInt("pcid");
				int userId=rs.getInt("userid");
				
				 post=new Post(pId, pTitle, pDesc, pCode, pTime, pcId, userId);
				
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		return post;

	}

}
































