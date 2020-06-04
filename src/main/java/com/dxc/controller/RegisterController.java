package com.dxc.controller;

import java.nio.charset.StandardCharsets;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.dxc.dto.RecaptchaDTO;
import com.dxc.setting.AppConfig;
import com.dxc.setting.ApplicationSetting;
import com.dxc.utils.Constant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

import com.dxc.entity.Role;
import com.dxc.entity.User;
import com.dxc.entity.UserRole;
import com.dxc.filter.UserCriteria;
import com.dxc.service.MailService;
import com.dxc.service.MailServiceImpl;
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
		UserCriteria criteria = new UserCriteria(user.getEmail(), user.getIdentity());
		Long number = userService.countUser(criteria);
		if(number > 0) {
			return "Register Failed! Your Information is registered".getBytes(StandardCharsets.UTF_8);
		}
		User entity = new User();
		Role role = userService.findRoleById(Constant.roleUser);
		entity.setFullname(user.getFullname());
		entity.setEmail(user.getEmail());
		entity.setPassword("{noop}"+user.getPassword());
		entity.setIdentity(user.getIdentity());
		entity.setStatus(false);
		entity.setVoted(false);
		userService.save(entity);
		UserRole userRole = new UserRole(entity, role);
		userService.save(userRole);
		AbstractApplicationContext context = new AnnotationConfigApplicationContext(
				AppConfig.class);

		MailService mailService = context.getBean("mailService", MailServiceImpl.class);

		String senderEmailId = "ductrapt@gmail.com";
		String receiverEmailId = entity.getEmail();
		String subject = "Dear "+entity.getFullname()+",\n";
		String message = "Welcome to Blockvotes! Thanks so much for joining us. Please activate your account by clicking the following URL:\n"
						+"\nhttp://localhost:8990/blockvotes/register/valiate?email=" + entity.getEmail()+"\n"
						+"\nPlease validate this email address to use our service.\n"
						+"\nHave any questions? Just shoot us an email! We’re always here to help.\n"
						+"\nYours truthfully,\n"
						+"Blockvote Team";
		mailService.sendEmail(senderEmailId, receiverEmailId, subject, message);
		context.close();
		return "Register successfully!".getBytes(StandardCharsets.UTF_8);
	}
	@GetMapping("/valiate")
	public String validate(@RequestParam("email") String email) {
		UserCriteria criteria = new UserCriteria(email, "");
		List<User> users = userService.findUserByCriteria(criteria);
		User user = users.get(0);
		user.setStatus(true);
		userService.update(user);
		return "active";
	}
}
