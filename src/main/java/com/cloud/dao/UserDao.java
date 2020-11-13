package com.cloud.dao;

import java.util.List;

import com.cloud.pojo.User;

public interface UserDao {
	//注册
	public void register(User user);
	//登录
	public User login(String username);
	//用户展示
	public List<User> showUser();
	//删除用户
	public int deleteUser(Integer usreid);
	//修改用户信息
	public int updateUser(User user);
	//查询一条数据
	public User selectOne(Integer userid);
}
