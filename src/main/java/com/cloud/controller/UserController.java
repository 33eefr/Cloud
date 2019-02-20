package com.cloud.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		
		userService.register(user);
		System.out.println(user);
		return "login";	
	}
	
	//表单提交过来的路径
	@RequestMapping("/login")
	public String checkLogin(User user,Model model){
		//调用service方法
		user = userService.checkLogin(user.getUsername(), user.getPassword());
		//若有user则添加到model里并且跳转到成功页面
		if(user != null){
			model.addAttribute("user",user);
			return "redirect:/showUser";
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
}
