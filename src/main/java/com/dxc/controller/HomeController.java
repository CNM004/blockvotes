package com.dxc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dxc.entity.User;
import com.dxc.service.UserService;

@Controller
public class HomeController {

	@Autowired
	UserService userService;
	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("home");
		return mv;
	}
	
	@GetMapping("/a")
	public String a() {
		List<User> a = userService.findAll();
		return "a";
	}

}
