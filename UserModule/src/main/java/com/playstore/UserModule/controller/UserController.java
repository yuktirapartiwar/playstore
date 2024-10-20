package com.playstore.UserModule.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.playstore.UserModule.model.User;
import com.playstore.UserModule.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	UserService userService;
	
	@GetMapping("/register")
	public String showRegistrationForm(Model model) {
		model.addAttribute("User", new User());
		return "UserRegistration";
	}
	
	@PostMapping("/register")
	public String registerUser(@ModelAttribute("User") User user, Model model) {
		userService.register(user);
		return "UserLogin";
	}

	
	@GetMapping("/login")
	public String showLoginForm(Model model) {
		model.addAttribute("User", new User());
		return "UserLogin";
	}
	
	@PostMapping("/login")
	public String loginUser(@ModelAttribute("User") User user, Model model) {
		Optional<User> loginUser = userService.login(user.getEmail(), user.getPassword());
		
		if(loginUser.isPresent()) {
			return "UserHome";
		} else {
			return "UserLogin";
		}
	}
	
	@PostMapping("/logout")
	public ResponseEntity<String> logout() {
		return ResponseEntity.ok("Logout successful!");
	}

}
