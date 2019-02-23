package com.cloud.pojo;

public class Folder {
	
	private Integer dir_id;
	
	private String dir_name;
	
	
	private String dir_path;
	


	public Integer getDir_id() {
		return dir_id;
	}

	public void setDir_id(Integer dir_id) {
		this.dir_id = dir_id;
	}

	public String getDir_name() {
		return dir_name;
	}

	public void setDir_name(String dir_name) {
		this.dir_name = dir_name;
	}

	
	public String getDir_path() {
		return dir_path;
	}

	public void setDir_path(String dir_path) {
		this.dir_path = dir_path;
	}

	@Override
	public String toString() {
		return "Folder [dir_id=" + dir_id + ", dir_name=" + dir_name + ", dir_path=" + dir_path + "]";
	}

	
}
