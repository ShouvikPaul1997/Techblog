package com.tech.blog.entities;

public class Message {

	
	String msg;
	String cssclass;
	

	
	public Message(String msg, String cssclass) {
		this.msg = msg;
		this.cssclass = cssclass;
	}

	public String getCssclass() {
		return cssclass;
	}

	public void setCssclass(String cssclass) {
		this.cssclass = cssclass;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
