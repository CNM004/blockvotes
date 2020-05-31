package com.dxc.service;

import java.util.List;
import org.springframework.stereotype.Service;

import com.dxc.entity.User;

@Service
public interface UserService {
	List<User> findAll();
}
