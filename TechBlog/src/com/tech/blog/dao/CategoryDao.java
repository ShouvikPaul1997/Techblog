package com.tech.blog.dao;
import com.tech.blog.entities.*;

import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CategoryDao {
private  Connection con=null;	
	
	
public CategoryDao(Connection con) {
	super();
	this.con = con;
}


public  List<Category> getCategory() {
		
		List<Category> lst=new ArrayList<Category>();
		
		PreparedStatement pstmt=null;
		String qry="select * from categories";
		try {
			pstmt=con.prepareStatement(qry);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				
				int id=rs.getInt("cid");
				String name=rs.getString("cname");
				String desc=rs.getString("cdescription");
				Category c=new Category(id, name, desc);
				lst.add(c);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lst;
		
		
		
	}

}
