package com.cloud.pojo;

public class Files {
	
	private int file_id;//文件id
	
	private String file_name;//文件名
	
	private String file_path;//文件路径
	
	private int user_id;//上传文件用户id

	public int getFile_id() {
		return file_id;
	}

	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "Files [file_id=" + file_id + ", file_name=" + file_name + ", file_path=" + file_path + ", user_id="
				+ user_id + "]";
	}

	
	
	
}
