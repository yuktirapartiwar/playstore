package com.playstore.UserModule.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.playstore.UserModule.model.User;
import com.playstore.UserModule.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

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
		try {
			userService.register(user);
			return "redirect:/user/login";
		} catch (Exception e) {
			model.addAttribute("errorMessage", "Registration failed. Please try again.");
			return "UserRegistration";
		}
	}

	@GetMapping("/login")
	public String showLoginForm(Model model, HttpServletRequest request) {
		model.addAttribute("User", new User());
		return "UserLogin";
	}
	
	@PostMapping("/login")
	public String loginUser(@ModelAttribute("User") User user, HttpServletRequest request) {
		Optional<User> loginUser = userService.login(user.getEmail(), user.getPassword());
		if (loginUser.isPresent()) {
			HttpSession userSession = request.getSession(true);
			userSession.setAttribute("User", loginUser.get());
			return "redirect:/user/home";
		} else {
			request.setAttribute("errorMessage", "Invalid email or password.");
			return "redirect:/user/login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession userSession = request.getSession(false);
		if (userSession != null) {
			userSession.invalidate();
		}
		return "redirect:/user/login";
	}

	@GetMapping("/home")
	public String userHome(Model model, HttpServletRequest request) {
		HttpSession userSession = request.getSession(false);
		if (userSession != null && userSession.getAttribute("User") != null) {
			return "UserHome";
		}
		return "redirect:/user/login";
	}
	
	@GetMapping("/profile")
	public String viewProfile(Model model, HttpServletRequest request) {
		HttpSession userSession = request.getSession(false);
		if (userSession != null && userSession.getAttribute("User") != null) {
			User user = (User) userSession.getAttribute("User");
			model.addAttribute("user", user);
			return "UserProfile";
		}
		return "redirect:/user/login";
	}
	
	@PostMapping("/profile/update")
	public String updateProfile(@ModelAttribute("User") User user, HttpServletRequest request) {
		HttpSession userSession = request.getSession(false);
		if (userSession != null && userSession.getAttribute("User") != null) {
			User existingUser = (User) userSession.getAttribute("User");
			user.setId(existingUser.getId());
			user.setRole(existingUser.getRole());
			userService.update(user);
			userSession.setAttribute("User", user);
			return "redirect:/user/profile";
		}
		return "redirect:/user/login";
	}
	
	@GetMapping("/profile/delete")
	public String deleteProfile(HttpServletRequest request, Model model) {
		HttpSession userSession = request.getSession(false);
		if (userSession != null && userSession.getAttribute("User") != null) {
			User user = (User) userSession.getAttribute("User");
			userService.delete(user);
			model.addAttribute("logoutMessage", "Your account has been deleted successfully.");
			userSession.invalidate();
			return "redirect:/user/login";
		}
		return "redirect:/user/login";
	}
}
