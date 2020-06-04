package com.dxc.controller;

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

	@RequestMapping("/user")
	public String user() {
		return "opening";
	}

	@RequestMapping("/logout")
	public String logout(final Model model) {
		model.addAttribute("message", "Logged out!");
		return "auth-login";
	}
}
