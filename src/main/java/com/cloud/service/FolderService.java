package com.cloud.service;

import java.util.List;

import com.cloud.pojo.Files;
import com.cloud.pojo.Folder;

public interface FolderService {
	
	//增加文件夹
	public void addFolder(Folder folder);
	//展示文件夹
	public List<Folder> showFolder(Integer user_id);
	//文件夹内文件显示
	public List<Files> selectFiles(Integer dir_id);
	//查询一个文件夹
	public Folder selectOne(Integer dir_id);
	//删除文件夹
	public int deleteFolder(Integer dir_id);
	//查询文件夹路径
	public String selectDirPath(Integer dir_id);
}
