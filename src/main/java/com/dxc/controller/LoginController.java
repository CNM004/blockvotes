package com.dxc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

	@RequestMapping(value = { "/login", "/" })
	public String login(@RequestParam(value = "error", required = false) final String error, final Model model) {
		if (error != null) {
			model.addAttribute("message", "Login Failed!");
		}
		return "auth-login";
	}

	@RequestMapping("/admin")
	public String admin() {
		return "admin";
	}
	
	@RequestMapping("/opening")
	public String opening() {
		return "opening";
	}

	@RequestMapping("/user")
	public String user() {

		String role = SecurityContextHolder.getContext().getAuthentication().getAuthorities() != null
				? SecurityContextHolder.getContext().getAuthentication().getAuthorities().toString()
				: "";
		boolean isRoleAdmin = role.contains("ROLE_ADMIN");
		if (isRoleAdmin) {
			return "redirect:/admin";
		}
		return "redirect:/";
	}
	
	@RequestMapping("/user/forgot-password")
	public String forgetPassword() {

		return "auth-forgot-password";
	}

	@RequestMapping("/logout")
	public String logout(final Model model) {
		model.addAttribute("message", "Logged out!");
		return "auth-login";
	}
}
