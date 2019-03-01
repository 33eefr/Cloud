package com.cloud.service.impl;

import java.util.List;

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
	
	@Override
	public List<Files> selectFileName(Integer user_id) {
		
		return fileDao.selectFileName(user_id);
	}
	@Override
	public List<Files> selectImagesFileName(Integer user_id) {
		List<Files> imagesFileName =fileDao.selectImagesFileName(user_id);
		return imagesFileName;
	}
	@Override
	public List<Files> selectVideoFileName(Integer user_id) {
		List<Files> videoFileName = fileDao.selectVideoFileName(user_id);
		return videoFileName;
	}
	@Override
	public List<Files> selectTxtFileName(Integer user_id) {
		List<Files> txtFileName = fileDao.selectTxtFileName(user_id);
		return txtFileName;
	}
	@Override
	public List<Files> selectMusicFileName(Integer user_id) {
		List<Files> musicFileName = fileDao.selectMusicFileName(user_id);
		return musicFileName;
	}

	@Override
	public int deleteFile(Integer file_id) {
		int i = fileDao.deleteFile(file_id);
		return i;
	}

	@Override
	public String selectFilePath(Integer file_id) {
		String filePath = fileDao.selectFilePath(file_id);
		return filePath;
	}

	@Override
	public int updateFilePath(Files files) {
		int i = fileDao.updateFilePath(files);
		return i;
	}




}
