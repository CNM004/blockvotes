package com.dxc.dao;

import java.util.List;
import com.dxc.entity.User;

public interface UserDao {
	List<User> findAll();
	User findOne(Long id);
	void save(User entity);
	void update(User entity);
}
