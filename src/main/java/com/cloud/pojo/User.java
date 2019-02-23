package com.cloud.pojo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class User {
	
	private int user_id;//用户id
	
	private String username;//用户名
	
	private String password;//密码
	
	private String email;//邮箱
	
	private Date register_time;//注册时间
	
	private MultipartFile file;//文件
	
	private String description;//描述
	
	private List<MultipartFile> attachment;//附件
	

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	

	public Date getRegister_time() {
		return register_time;
	}

	public void setRegister_time(Date register_time) {
		this.register_time = register_time;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<MultipartFile> getAttachment() {
		return attachment;
	}

	public void setAttachment(List<MultipartFile> attachment) {
		this.attachment = attachment;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", username=" + username + ", password=" + password + ", email=" + email
				+ ", register_time=" + register_time + "]";
	}

	

	
	

}
