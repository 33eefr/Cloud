package com.cloud.service;



import java.util.List;

import com.cloud.pojo.Files;

public interface FileService {
	
	/*
	 * 2019-2-23 csh
	 * 文件添加到数据库
	 */
	public void insertFile(Files files);
	
	//查询文件名
	public List<Files> selectFileName(Integer user_id);
	//查询images下的文件名
	public List<Files> selectImagesFileName(Integer user_id);
	//查询video下的文件名
	public List<Files> selectVideoFileName(Integer user_id);
	//查询txt下的文件名
	public List<Files> selectTxtFileName(Integer user_id);
	//查询music下的文件名
	public List<Files> selectMusicFileName(Integer user_id);

}
