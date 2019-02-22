package com.cloud.service.impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.service.UserService;
import com.cloud.dao.UserDao;
import com.cloud.pojo.User;
@Service
public class UserServiceImpl implements UserService {
	//自动装配
	@Autowired
	private UserDao userDao;

	@Override
	public void register(User user) {
		
		userDao.register(user);
		
	}

	@Override
	public User checkLogin(String username, String password) {
		
		User user = userDao.login(username);
		if(user != null && user.getPassword().equals(password)){
			
			return user;
		}
		return null;
	}

	@Override
	public List<User> showUser() {
		userDao.showUser();
		return userDao.showUser();
	}

	@Override
	public int updateUser(User user) {
		int i = userDao.updateUser(user);
		return i;
	}

	@Override
	public User selectOne(Integer userid) {
		User user = userDao.selectOne(userid);
		return user;
	}

	@Override
	public int deleteUser(Integer usreid) {
		
		return userDao.deleteUser(usreid);
	}

	
	
}
