package com.cloud.controller;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


import com.cloud.service.UserService;

import com.cloud.pojo.User;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	//正常访问login页面
	@RequestMapping("/tologin")
	public String tologin(){
		return "login";
		}
	
	//正常访问register页面
	@RequestMapping("/toregister")
	public String toregister(){
		return "register";
		}
	@RequestMapping("/register")
	public String register(User user) {
		user.setRegister_time(new Date());
		userService.register(user);
		System.out.println(user);
		
		return "login";	
	}
	
	//表单提交过来的路径
	@RequestMapping("/login")
	public String checkLogin(User user,HttpSession session){
		//调用service方法
		user = userService.checkLogin(user.getUsername(), user.getPassword());
		//若有user则添加到model里并且跳转到成功页面
		if(user != null){
			session.setAttribute("user",user);
		//登录同时创建以user_id命名的文件夹   2019/2/22
		String userPath = "D:\\cloud"+File.separator+user.getUser_id();
		
		File userdir=new File(userPath);
		
		if(!userdir.exists()){//如果文件夹不存在
			
			userdir.mkdirs();//创建文件夹
		}
			return "main";
		}
		return "fail";
	}

	//注销方法
	@RequestMapping("/outLogin")
	public String outLogin(HttpSession session){
		//通过session.invalidata()方法来注销当前的session
		session.invalidate();
		return "login";
	}
	//用户展示
	@RequestMapping("/showUser")
	public String showUser(Map<String,Object> map) {
		
		List<User> lists = userService.showUser();
		map.put("lists", lists);
		return "showUser";
	}
	//查询一条数据
	@RequestMapping("/selectOne/{user_id}")
	public String selectOne(@PathVariable("user_id") Integer user_id,Map<String,Object> map) {
		
		User user = userService.selectOne(user_id);
		map.put("user", user);
		return "updateUser";
	}
	
	@RequestMapping(value="/updateUser")
	public String updateUser(User user) {
		
		int i = userService.updateUser(user);
		System.out.println("成功修改"+ i +"条用户信息");
		return "redirect:/showUser";	
	}	
	@RequestMapping("/deleteUser/{user_id}")
	public String deleteUser(@PathVariable("user_id") Integer user_id) {
		
		int i = userService.deleteUser(user_id);
		System.out.println("成功删除"+i+"个用户");
		return "redirect:/showUser";
		
	}
	/*
	 * 2019/2/22
	 * 在用户目录下新建文件夹
	 */
	@RequestMapping("/createDir")
	public String creatDir(User user,HttpServletRequest request) {
		String user_id = request.getParameter("user_id");
		String folderName = request.getParameter("folderName");
		String userPath = "D:\\cloud"+File.separator+user_id+File.separator+folderName;
		
		File userdir=new File(userPath);
		
		if(!userdir.exists()){//如果文件夹不存在
			
			userdir.mkdirs();//创建文件夹
		}
		
		return "main";		
	}
}
