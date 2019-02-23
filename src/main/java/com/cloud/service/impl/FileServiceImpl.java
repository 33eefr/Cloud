package com.cloud.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.FileDao;
import com.cloud.pojo.Files;
import com.cloud.service.FileService;
@Service
public class FileServiceImpl implements FileService {

	@Autowired
	private FileDao fileDao;
	@Override
	public void insertFile(Files files) {
		
		fileDao.insertFile(files);	
	}

}
