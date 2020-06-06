package com.dxc.service;

import java.util.List;
import org.springframework.stereotype.Service;

import com.dxc.entity.User;
import com.dxc.entity.Candidate;
import com.dxc.entity.Role;
import com.dxc.entity.UserRole;
import com.dxc.filter.UserCriteria;;

@Service
public interface UserService {
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
