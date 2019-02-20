package com.cloud.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.cloud.dao.FolderDao;
import com.cloud.pojo.Folder;
import com.cloud.service.FolderService;

public class FolderServiceImpl implements FolderService{
	
	@Autowired
	private FolderDao folderDao;
	@Override
	public void addFolder(Folder folder) {
		
		folderDao.addFolder(folder);
		
	}

}
