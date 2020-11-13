package com.cloud.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cloud.pojo.Files;
import com.cloud.pojo.Folder;
import com.cloud.pojo.User;
import com.cloud.service.FolderService;

@Controller
public class FolderController {
	
	@Autowired
	private FolderService folderService;
	/*
	 * 2019/2/22
	 * 在用户目录下新建文件夹
	 */
	@RequestMapping("/createDir")
	public String creatDir(Folder folder, User user,HttpServletRequest request,HttpServletResponse response) throws IOException {
		String user_id = request.getParameter("user_id");
		String folderName = request.getParameter("folderName");
		if(StringUtils.isEmpty(folderName)){
			//登录人页面未录入文件夹名称
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out;
			out = response.getWriter();
			out.flush();
		    out.println("<script>");
		    out.println("alert('请输入文件夹名称后重新创建！');");
		    out.println("history.back();");
		    out.println("</script>");
		}else{
			//登录人填写文件夹名称时
			String userPath = "E:\\cloud"+File.separator+user_id+File.separator+folderName;
			
			File userdir=new File(userPath);
			
			if(!userdir.exists()){//如果文件夹不存在
				
				userdir.mkdirs();//创建文件夹
			}
			int userid = Integer.parseInt(user_id);
			folder.setDir_name(folderName);
			folder.setDir_path(userPath);
			folder.setUser_id(userid);
			folderService.addFolder(folder);
			System.out.println(folderName+"创建成功");
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out;
			out = response.getWriter();
			out.flush();
			out.println("<script>");
			out.println("alert('文件夹创建成功！');");
			out.println("history.back();");
			out.println("</script>");
		}
		return "main";
	}
	/*
	 * 2019-2-26
	 * 文件夹展示
	 */
	@RequestMapping("/showFolder")
	public String showFolder(Folder folder,Map<String,Object> map,@RequestParam("user_id") Integer user_id) {
		List<Folder> folders =  folderService.showFolder(user_id);
		map.put("folders", folders);
		return "showFolder";
	}
	/*
	 * 2019-2-27
	 * 文件夹内文件展示
	 */
	@RequestMapping("/showFiles")
	public String showFiles(@RequestParam("dir_id") Integer dir_id,Map<String,Object> map) {
		List<Files> files =  folderService.selectFiles(dir_id);
		map.put("files", files);
		
		return "files";
	}
	/*
	 *
	 * 查询一个文件夹
	 */
	@RequestMapping("/selectOne/{dir_id}")
	public String selectOne(@RequestParam("dir_id") Integer dir_id,Map<String,Object> map) {
		
		Folder folder = folderService.selectOne(dir_id);
		map.put("folder", folder);
		return null;
	}
	/*
	 * 删除文件夹
	 */
	@RequestMapping("/deleteFolder/{dir_id}")
	public String deleteFolder(Folder folder,@RequestParam("dir_id") Integer dir_id,HttpServletResponse response) throws IOException{
		System.out.println(dir_id);
		String dir_path = folderService.selectDirPath(dir_id);
        try{
       	 FileUtils.deleteDirectory(new File(dir_path));
       	 System.out.println("ok");
        }catch(IOException e) {
       	 e.printStackTrace();
       	 System.out.println(e.getMessage());
        }
        
        int i = folderService.deleteFolder(dir_id);
		System.out.println("成功删除"+ i +"个文件夹");

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out;
		out = response.getWriter();
		out.flush();
	    out.println("<script>");
	    out.println("alert('文件夹删除成功！');");
	    out.println("history.back();");
	    out.println("</script>");
		return "main";
	}
	
}
