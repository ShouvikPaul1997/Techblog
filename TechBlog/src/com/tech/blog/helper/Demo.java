package com.tech.blog.helper;

import java.sql.Connection;

public class Demo {
	
	public static Connection returnString() {
		
		Connection con=ConnectionProvider.getConnection();
		
		return con;
		

	}
}
