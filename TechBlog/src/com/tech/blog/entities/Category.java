package com.tech.blog.entities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tech.blog.helper.ConnectionProvider;

public class Category {
	private int cid;
	private String cname;
	private String desc;
	
	

	public Category(int cid, String cname, String desc) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.desc = desc;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	

}
