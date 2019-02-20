package com.cloud.service;



import java.util.List;

import com.cloud.pojo.User;

public interface UserService {
	//注册
	public void register(User user);
	//检验用户登录
	public User checkLogin(String username,String password);
	//用户信息展示
	public List<User> showUser();
	//修改用户信息
	public int updateUser(User user);
	//查询一条数据
	public User selectOne(Integer userid);
}
