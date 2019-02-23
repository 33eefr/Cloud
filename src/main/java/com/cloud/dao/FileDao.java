package com.cloud.dao;

import com.cloud.pojo.Files;

public interface FileDao {
	
	/*
	 * 2019-2-23 csh
	 * 文件添加到数据库
	 */
	public void insertFile(Files files);
}
