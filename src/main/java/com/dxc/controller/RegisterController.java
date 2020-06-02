package com.dxc.controller;

import java.nio.charset.StandardCharsets;

import com.dxc.dto.RecaptchaDTO;
import com.dxc.setting.ApplicationSetting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

import com.dxc.entity.User;
import com.dxc.service.RecaptchaService;
import com.dxc.service.UserService;

@Controller
@RequestMapping("/register")
public class RegisterController {

	@Autowired
	UserService userService;
	@Autowired
	private RecaptchaService recaptchaService;
	@Autowired
	private ApplicationSetting appSetting;
	
	@GetMapping("/create")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("auth-register");
		mv.addObject("siteKey", appSetting.getSiteKey());
		return mv;
	}
	
	@PostMapping("/search")
	public @ResponseBody RecaptchaDTO token(HttpServletRequest request, @RequestParam("token") String token) {
		return recaptchaService.token(token);
	}


	@PostMapping("/save")
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
