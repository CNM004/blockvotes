package com.dxc.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxc.dao.UserDao;
import com.dxc.entity.User;
import com.dxc.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	
	@Override
	@Transactional
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return userDao.findAll();
	}

}
