package com.tech.blog.entities;

import java.sql.Timestamp;

public class Post {
	private int pid;
	private String pTitle;
	private String pDesc;
	private String pCode;
	private Timestamp pTime;
	private int pcId;
	private int userId;


	public Post(String pTitle, String pDesc, String pCode, int pcId, int userId) {
		super();
		
		this.pTitle = pTitle;
		this.pDesc = pDesc;
		this.pCode = pCode;
		this.pcId = pcId;
		this.userId = userId;
	}

	public Post(int pid, String pTitle, String pDesc, String pCode, Timestamp pTime, int pcId, int userId) {
		super();
		this.pid = pid;
		this.pTitle = pTitle;
		this.pDesc = pDesc;
		this.pCode = pCode;
		this.pTime = pTime;
		this.pcId = pcId;
		this.userId = userId;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public String getpDesc() {
		return pDesc;
	}

	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public Timestamp getpTime() {
		return pTime;
	}

	public void setpTime(Timestamp pTime) {
		this.pTime = pTime;
	}

	public int getPcId() {
		return pcId;
	}

	public void setPcId(int pcId) {
		this.pcId = pcId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

}
