package com.idali.Model;

public class User_p {
	
	String name ;
	String url;
	int  posts;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getPosts() {
		return posts;
	}
	public void setPosts(int posts) {
		this.posts = posts;
	}
	public User_p(String name, String url, int posts) {
		super();
		this.name = name;
		this.url = url;
		this.posts = posts;
	}
	 
	
	public User_p() {}
	

}
