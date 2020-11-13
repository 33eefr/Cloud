package com.cloud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.FolderDao;
import com.cloud.pojo.Files;
import com.cloud.pojo.Folder;
import com.cloud.service.FolderService;
@Service
public class FolderServiceImpl implements FolderService{
	
	@Autowired
	private FolderDao folderDao;
	@Override
	public void addFolder(Folder folder) {
		
		folderDao.addFolder(folder);
		
	}
	@Override
	public List<Folder> showFolder(Integer user_id) {
		List<Folder> folders = folderDao.showFolder(user_id);
		return folders;
	}
	@Override
	public List<Files> selectFiles(Integer dir_id) {
		List<Files> files = folderDao.selectFiles(dir_id);
		return files;
	}
	@Override
	public Folder selectOne(Integer dir_id) {
		Folder folder = folderDao.selectOne(dir_id);
		return folder;
	}
	@Override
	public int deleteFolder(Integer dir_id) {
		int i = folderDao.deleteFolder(dir_id);
		return i;
	}
	@Override
	public String selectDirPath(Integer dir_id) {
		String dir_path = folderDao.selectDirPath(dir_id);
		return dir_path;
	}
	

}
