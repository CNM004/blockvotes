package com.dxc.dao;

import java.util.List;

import com.dxc.entity.Role;
import com.dxc.entity.User;
import com.dxc.entity.UserRole;
import com.dxc.entity.Candidate;
import com.dxc.filter.UserCriteria;

public interface UserDao {
	List<User> findAll();
	User findOne(Long id);
	Long save(User entity);
	void update(User entity);
	Role findRoleById(Long id);
	Long save(UserRole entity);
	Long countUser(UserCriteria criteria);
	List<User> findUserByCriteria(UserCriteria criteria);
	List<Candidate> findAllCandidates();
}
