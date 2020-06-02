package com.dxc.controller;

import java.nio.charset.StandardCharsets;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dxc.entity.User;
import com.dxc.service.UserService;

@Controller
@RequestMapping("/register")
public class Register {

	@Autowired
	UserService userService;


	@PostMapping("")
	@ResponseBody
	public byte[] register(@ModelAttribute("User") User user) {
		User entity = new User();
		entity.setFullname(user.getFullname());
		entity.setEmail(user.getEmail());
		entity.setPassword(user.getPassword());
		entity.setIdentity(user.getIdentity());
		entity.setStatus(true);
		entity.setVoted(false);
		userService.save(entity);
		return "Đăng kí thành công".getBytes(StandardCharsets.UTF_8);
	}
}
