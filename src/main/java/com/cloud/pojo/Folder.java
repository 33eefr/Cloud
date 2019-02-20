package com.cloud.pojo;

public class Folder {
	
	private Integer dir_id;
	
	private String dir_name;
	
	private Integer parent_dir;
	
	private String dir_path;
	
	private User createUser;

	public Folder() {
		super();
	}

	public Folder(User createUser) {
		super();
		this.createUser = createUser;
	}

	public Folder(Integer dir_id, String dir_name, Integer parent_dir, String dir_path) {
		super();
		this.dir_id = dir_id;
		this.dir_name = dir_name;
		this.parent_dir = parent_dir;
		this.dir_path = dir_path;
	}

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

	public Integer getParent_dir() {
		return parent_dir;
	}

	public void setParent_dir(Integer parent_dir) {
		this.parent_dir = parent_dir;
	}

	public String getDir_path() {
		return dir_path;
	}

	public void setDir_path(String dir_path) {
		this.dir_path = dir_path;
	}

	public User getCreateUser() {
		return createUser;
	}

	public void setCreateUser(User createUser) {
		this.createUser = createUser;
	}

	@Override
	public String toString() {
		return "Folder [dir_name=" + dir_name + ", parent_dir=" + parent_dir + ", dir_path=" + dir_path
				+ ", createUser=" + createUser + "]";
	}
	
}
