package com.cloud.controller;



import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cloud.pojo.User;
import com.cloud.service.FileService;
import com.cloud.pojo.Files;


@Controller

public class uploadController {

	@Autowired
	private FileService fileService;
	/*
	 * 2019/2/23-csh
	 * 上传文件
	 */
	@RequestMapping(value="uploadMultiple",method=RequestMethod.POST)
	public String uploadMultiple(User user,Files files,HttpServletRequest request,Map<String,Object> map) throws IllegalStateException, IOException {
		//获取attachment对象
		List<MultipartFile> attachment = user.getAttachment();
		List<String> fileNames = new ArrayList<String>();
		if(!attachment.isEmpty() && attachment.size()>0) {
			//循环遍历
			for (MultipartFile multipartFile : attachment) {
				//获取文件路径
				String path = request.getServletContext().getRealPath("/image/");
				//获取源文件名--再Tomcat容器里面的SERVER PATH
				String fileName = multipartFile.getOriginalFilename();
				//fileName = user.getUserName()+"_"+UUID.randomUUID()+"_"+fileName;
				//根据path 抽象路径名和fileName 原文件名
				File filePath = new File(path,fileName);
				//如果filePath不存在，则通过父类创建
				if(!filePath.exists()) {
					filePath.getParentFile().mkdirs();
				}
				//目录保存到目标文件--File.separator代替windows中的/
				File target = new File(path+File.separator+fileName);
				System.out.println(""+target);
				multipartFile.transferTo(target);
				fileNames.add(fileName);
				//前端获取user_id
				String user_id = request.getParameter("user_id");
				//获取文件的后缀
				String prefixName = FilenameUtils.getExtension(fileName);
				
				String file_path = "";
				//根据后缀判断将文件放入不同路径
				if(prefixName.equalsIgnoreCase("jpg")||prefixName.equalsIgnoreCase("png")) {
					file_path = "D:\\cloud"+File.separator+user_id+File.separator+"images";
					File photoSrcPath = new File(file_path);
					FileUtils.copyFileToDirectory(target, photoSrcPath);
				}
				if(prefixName.equalsIgnoreCase("mp3")){
					file_path = "D:\\cloud"+File.separator+user_id+File.separator+"music";
					File musucSrcPath = new File(file_path);
					FileUtils.copyFileToDirectory(target, musucSrcPath);
				}
				if(prefixName.equalsIgnoreCase("mp4")) {
					file_path = "D:\\cloud"+File.separator+user_id+File.separator+"video";
					File videoSrcPath = new File(file_path);
					FileUtils.copyFileToDirectory(target, videoSrcPath);
				}
				if(prefixName.equalsIgnoreCase("txt")) {
					file_path = "D:\\cloud"+File.separator+user_id+File.separator+"txt";
					File txtSrcPath = new File(file_path);
					FileUtils.copyFileToDirectory(target, txtSrcPath);
				}
				//将文件名、文件路径和用户id放入数据库
				files.setFile_name(fileName);
				files.setUser_id(user.getUser_id());
				files.setFile_path(file_path);
				
				fileService.insertFile(files);
				
			}
			map.put("fileNames", fileNames);
			
		}
		return "showFile";
	}
	/*
	 * 
	 * 下载文件
	 */
	@RequestMapping(value="/download")
	public ResponseEntity<byte[]> download(HttpServletRequest request,
			@RequestParam("fileName") String fileName) throws Exception{
		String path = request.getServletContext().getRealPath("/image/");
		File file = new File(path+File.separator+fileName);
		HttpHeaders headers = new HttpHeaders();
		String downloadFileName = new String(fileName.getBytes("UTF-8"),"iso-8859-1");
		headers.setContentDispositionFormData("attachment", downloadFileName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		
		ResponseEntity<byte[]> responseEntity = new 
				ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers,HttpStatus.OK);
		
		return responseEntity;
	}
	
	
}
