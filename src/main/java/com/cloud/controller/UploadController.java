package com.cloud.controller;



import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.StringSelection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

public class UploadController {

	@Autowired
	private FileService fileService;
	/*
	 * 2019/2/23-csh
	 * 上传文件
	 */
	@RequestMapping(value="uploadMultiple",method=RequestMethod.POST)
	public String uploadMultiple(User user,Files files,HttpServletRequest request,
			HttpServletResponse response,Map<String,Object> map) throws IllegalStateException, IOException {
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
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out;
		out = response.getWriter();
		out.flush();
	    out.println("<script>");
	    out.println("alert('文件上传成功！');");
	    out.println("history.back();");
	    out.println("</script>");
		return "main";
	}

	
	/*
	 * 
	 * 查询所有上传文件
	 */
	@RequestMapping(value="/selectFileName")
	public String selectFileName(Files files,Map<String,Object> map,@RequestParam("user_id") Integer user_id) {
		
		List<Files> fileNames = fileService.selectFileName(user_id);
		map.put("fileNames", fileNames);
		return "showFile";
	}
	/*
	 * 
	 * 查询所有images下文件
	 */
	@RequestMapping(value="/selectImagesFileName")
	public String selectImagesFileName(Files files,Map<String,Object> map,@RequestParam("user_id") Integer user_id) {
		
		List<Files> imagesFileName = fileService.selectImagesFileName(user_id);
		map.put("imagesFileName", imagesFileName);
		return "showImage";
	}
	/*
	 * 
	 * 查询所有video下文件
	 */
	@RequestMapping(value="/selectVideoFileName")
	public String selectVideoFileName(Files files,Map<String,Object> map,@RequestParam("user_id") Integer user_id) {
		
		List<Files> videoFileName = fileService.selectVideoFileName(user_id);
		map.put("videoFileName", videoFileName);
		return "showVideo";
	}
	/*
	 * 
	 * 查询所有txt下文件
	 */
	@RequestMapping(value="/selectTxtFileName")
	public String selectTxtFileName(Files files,Map<String,Object> map,@RequestParam("user_id") Integer user_id) {
		
		List<Files> txtFileName = fileService.selectTxtFileName(user_id);
		map.put("txtFileName", txtFileName);
		return "showTxt";
	}
	/*
	 * 
	 * 查询所有music下文件
	 */
	@RequestMapping(value="/selectMusicFileName")
	public String selectMusicFileName(Files files,Map<String,Object> map,@RequestParam("user_id") Integer user_id) {
		
		List<Files> musicFileName = fileService.selectMusicFileName(user_id);
		map.put("musicFileName", musicFileName);
		return "showMusic";
	}
	/*
	 * 
	 * 删除指定文件
	 */
	@RequestMapping("/deleteFile/{file_id}")
	public String deleteFile(@RequestParam("file_id") Integer file_id,@RequestParam("fileName") String fileName,
			HttpServletResponse response) throws IOException {
		
		String filePath = fileService.selectFilePath(file_id);
		FileUtils.deleteQuietly(new File(filePath+File.separator+fileName));
		int i = fileService.deleteFile(file_id);
		System.out.println("成功删除"+i+"个文件");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out;
		out = response.getWriter();
		out.flush();
	    out.println("<script>");
	    out.println("alert('文件删除成功！');");
	    out.println("history.back();");
	    out.println("</script>");
		return "main";
	}
	/*
	 * 复制文件到指定文件夹
	 */
	@RequestMapping("/move")
	public String move(Files files,@RequestParam("fileName") String fileName,
			HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		String user_id = request.getParameter("user_id");
		String fileid = request.getParameter("file_id");
		int file_id = Integer.parseInt(fileid);
		String filePath = fileService.selectFilePath(file_id);
		String folderName = request.getParameter("folderName");
		String file_path = "D:\\cloud"+File.separator+user_id+File.separator+folderName;
		
		FileUtils.moveFileToDirectory(new File(filePath+File.separator+fileName), new File(file_path), file_path.isEmpty());
		files.setFile_id(file_id);
		files.setFile_path(file_path);
		int i = fileService.updateFilePath(files);
		System.out.println("移动"+i+"个文件到"+folderName);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out;
		out = response.getWriter();
		out.flush();
	    out.println("<script>");
	    out.println("alert('文件移动成功！');");
	    out.println("history.back();");
	    out.println("</script>");
		return "main";
	}
	/*
	 * 
	 * 下载文件
	 */
	@RequestMapping(value="/download")
	public ResponseEntity<byte[]> download(User user,HttpServletRequest request,
			@RequestParam("fileName") String fileName,@RequestParam("user_id") Integer user_id) throws Exception{
		
		String prefixName = FilenameUtils.getExtension(fileName);
		//前端获取user_id
		System.out.println(user_id);
		//根据文件后缀确定下载路径
		String path = "";
			if(prefixName.equalsIgnoreCase("jpg")||prefixName.equalsIgnoreCase("png")) {
				path = "D:\\cloud"+File.separator+user_id+File.separator+"images";
			}
			if(prefixName.equalsIgnoreCase("mp3")){
				path = "D:\\cloud"+File.separator+user_id+File.separator+"music";
			}
			if(prefixName.equalsIgnoreCase("mp4")) {
				path = "D:\\cloud"+File.separator+user_id+File.separator+"video";	
			}
			if(prefixName.equalsIgnoreCase("txt")) {
				path = "D:\\cloud"+File.separator+user_id+File.separator+"txt";
			}
		File file = new File(path+File.separator+fileName);
		HttpHeaders headers = new HttpHeaders();
		String downloadFileName = new String(fileName.getBytes("UTF-8"),"iso-8859-1");
		headers.setContentDispositionFormData("attachment", downloadFileName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		
		ResponseEntity<byte[]> responseEntity = new 
				ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers,HttpStatus.OK);
		
		return responseEntity;
	}
	/*
	 * 2019-2-25
	 * 外链分享
	 * 
	 */
	@SuppressWarnings("static-access")
	@RequestMapping("/share")
	public String share(@RequestParam("fileName") String fileName,
			@RequestParam("user_id") Integer user_id,Map<String,Object> map) {
		
		 InetAddress ia=null;
	        try {
	            ia=ia.getLocalHost();
	            
	            String localname=ia.getHostName();
	            String localip=ia.getHostAddress();
	            System.out.println("本机名称是："+ localname);
	            System.out.println("本机的ip是 ："+localip);
	            map.put("localname", localname);
	            map.put("localip", localip);
	            System.out.println(user_id);
	            String path = "http://192.168.22.165:8080/cloud/download?fileName="+fileName+"&user_id="+user_id;
	            map.put("path", path);
	            System.out.println(path);
	           
	        } catch (Exception e) {
	            
	            e.printStackTrace();
	        }
	        return "shareFile";
	    }
	
	@RequestMapping("/copyShare")
	public String copyShare(HttpServletRequest request) {
		String sharePath = request.getParameter("share");
		Clipboard  clip= Toolkit.getDefaultToolkit().getSystemClipboard();  
	    StringSelection tText = new StringSelection(sharePath);  
	    clip.setContents(tText, null); 
		return "shareFile";
	}
	/*
	 * 
	 * 文件查询
	 */
	@RequestMapping("/selectFileById")
	public String selectFileById(HttpServletRequest request,Map<String,Object> map) {
		String fileId = request.getParameter("file_id");
		int file_id = Integer.parseInt(fileId);
		List<Files> files = fileService.selectFileById(file_id);
		map.put("files", files);
		return "selectFile";
	}
}
