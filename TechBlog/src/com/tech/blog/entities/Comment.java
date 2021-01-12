package com.tech.blog.entities;

public class Comment {
int pId;
int uId;
public Comment(int pId, int uId) {
	super();
	this.pId = pId;
	this.uId = uId;
}
public int getpId() {
	return pId;
}
public void setpId(int pId) {
	this.pId = pId;
}
public int getuId() {
	return uId;
}
public void setuId(int uId) {
	this.uId = uId;
}

}
