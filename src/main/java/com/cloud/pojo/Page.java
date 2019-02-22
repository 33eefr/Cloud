package com.cloud.pojo;


import java.util.List;

public class Page <T>{
	private List<T> data;//数据库查询出的数据
	
	private int totalRecord;//总记录数，数据库查询

	private int pageNumber;//当前页码
	
	private int pageSize;//每页的记录数

	private String path;//jsp页面链接所要跳转的地址
	
	private int index;    //当前索引，计算得到
	
	private int totalPage;//总页数 计算得到

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getIndex() {
		return index;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public Page(int totalRecord, int pageNumber, int pageSize) {
		super();
		this.totalRecord = totalRecord;
		this.pageNumber = pageNumber;
		this.pageSize = pageSize;
	}
	
	
	
	

}