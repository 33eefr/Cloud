package com.cloud.dao;

import java.util.List;

import com.cloud.pojo.Files;

public interface FileDao {
	
	/*
	 * 2019-2-23 csh
	 * 文件添加到数据库
	 */
	public void insertFile(Files files);
	
	/* 2019-2-24 csh
	 * 查询所有文件名
	 */
	public List<Files> selectFileName(Integer user_id);
	//查询images下的文件名
	public List<Files> selectImagesFileName(Integer user_id);
	//查询video下的文件名
	public List<Files> selectVideoFileName(Integer user_id);
	//查询txt下的文件名
	public List<Files> selectTxtFileName(Integer user_id);
	//查询music下的文件名
	public List<Files> selectMusicFileName(Integer user_id);
	//删除文件
	public int deleteFile(Integer file_id);
	//查询文件所在路径
	public String selectFilePath(Integer file_id);
	//修改文件路径
	public int updateFilePath(Files files);
}
