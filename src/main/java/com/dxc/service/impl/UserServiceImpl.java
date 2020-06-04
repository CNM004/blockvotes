package com.dxc.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxc.dao.UserDao;
import com.dxc.entity.Role;
import com.dxc.entity.User;
import com.dxc.entity.UserRole;
import com.dxc.filter.UserCriteria;
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

	@Override
	public User findOne(Long id) {
		// TODO Auto-generated method stub
		return userDao.findOne(id);
	}

	@Override
	public Long save(User entity) {
		// TODO Auto-generated method stub
		return userDao.save(entity);
	}

	@Override
	public void update(User entity) {
		// TODO Auto-generated method stub
		userDao.update(entity);
	}

	@Override
	public Role findRoleById(Long id) {
		// TODO Auto-generated method stub
		return userDao.findRoleById(id);
	}

	@Override
	public Long save(UserRole entity) {
		// TODO Auto-generated method stub
		return userDao.save(entity);
	}

	@Override
	public Long countUser(UserCriteria criteria) {
		// TODO Auto-generated method stub
		return userDao.countUser(criteria);
	}

	@Override
	public List<User> findUserByCriteria(UserCriteria criteria) {
		// TODO Auto-generated method stub
		return userDao.findUserByCriteria(criteria);
	}

}
