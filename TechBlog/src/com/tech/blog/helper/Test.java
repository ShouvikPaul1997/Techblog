package com.tech.blog.helper;

import java.sql.*;
import java.util.Scanner;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;



public class Test {
	
	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		System.out.println();
		String email=sc.nextLine();
		String password=sc.nextLine();
		
		UserDao ud=new UserDao(ConnectionProvider.getConnection());
		User u=ud.getUserByEmailPassword(email, password);
		System.out.println(u);
		
	}

}
