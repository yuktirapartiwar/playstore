package com.playstore.UserModule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.playstore.UserModule.exception.UserAlreadyExistsException;
import com.playstore.UserModule.exception.UserNotFoundException;
import com.playstore.UserModule.exception.UserUpdateFailedException;
import com.playstore.UserModule.exception.UserDeletionFailedException;
import com.playstore.UserModule.model.Users;
import com.playstore.UserModule.service.JWTService;
import com.playstore.UserModule.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	UserService userService;

	@Autowired
	JWTService jwtService;
	
	@GetMapping("/register")
	public String showRegistrationForm(Model model) {
		model.addAttribute("User", new Users());
		return "UserRegistration";
	}
	
	@PostMapping("/register")
	public String registerUser(@ModelAttribute("User") Users user, Model model) {
		try {
			userService.register(user);
			return "redirect:/user/login";
		} catch (UserAlreadyExistsException e) {
			model.addAttribute("errorMessage", e.getMessage());
			return "UserRegistration";
		} catch (Exception e) {
			model.addAttribute("errorMessage", "Registration failed. Please try again.");
			return "UserRegistration";
		}
	}

	@GetMapping("/login")
	public String showLoginForm(Model model, HttpServletRequest request) {
		model.addAttribute("User", new Users());
		String message = request.getParameter("message");
		if (message != null) {
			model.addAttribute("successMessage", message);
		}
		return "UserLogin";
	}
	
	@PostMapping("/login")
	public String loginUser(@ModelAttribute("User") Users user, HttpServletRequest request, Model model) {
		try {
			String token = userService.authenticateAndGetToken(user.getEmail(), user.getPassword());
			HttpSession userSession = request.getSession(true);
			userSession.setAttribute("jwtToken", token);
			userSession.setAttribute("User", userService.getUserByEmail(user.getEmail()));
			System.out.println("Token: " + token);
			return "redirect:/user/home";
		} catch (UserNotFoundException e) {
			System.out.println("Token: " + e.getMessage());
			model.addAttribute("errorMessage", e.getMessage());
			return "UserLogin";
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
		if (userSession != null && userSession.getAttribute("jwtToken") != null) {
			String token = (String) userSession.getAttribute("jwtToken");
			String email = jwtService.extractUsername(token);
			Users user = userService.getUserByEmail(email);
			model.addAttribute("user", user);
			return "UserHome";
		}
		return "redirect:/user/login";
	}
	
	@GetMapping("/profile")
	public String viewProfile(Model model, HttpServletRequest request) {
		HttpSession userSession = request.getSession(false);
		if (userSession != null && userSession.getAttribute("User") != null) {
			Users user = (Users) userSession.getAttribute("User");
			model.addAttribute("user", user);
			return "UserProfile";
		}
		return "redirect:/user/login";
	}
	
	@PostMapping("/profile/update")
	public String updateProfile(@ModelAttribute("User") Users user, HttpServletRequest request, Model model) {
		HttpSession userSession = request.getSession(false);
		if (userSession != null && userSession.getAttribute("User") != null) {
			Users existingUser = (Users) userSession.getAttribute("User");
			user.setId(existingUser.getId());
			user.setRole(existingUser.getRole());
			try {
				userService.update(user);
				userSession.setAttribute("User", user);
				return "redirect:/user/profile";
			} catch (UserAlreadyExistsException e) {
				model.addAttribute("errorMessage", e.getMessage());
				return "UserProfile";
			} catch (UserUpdateFailedException e) {
				model.addAttribute("errorMessage", e.getMessage());
				return "UserProfile";
			}
		}
		return "redirect:/user/login";
	}
	
	@GetMapping("/profile/delete")
	public String deleteProfile(HttpServletRequest request, Model model) {
		HttpSession userSession = request.getSession(false);
		if (userSession != null && userSession.getAttribute("User") != null) {
			Users user = (Users) userSession.getAttribute("User");
			try {
				userService.delete(user);
				userSession.invalidate();
				return "redirect:/user/login?message=Your account has been deleted successfully.";
			} catch (UserDeletionFailedException e) {
				model.addAttribute("errorMessage", e.getMessage());
				return "UserProfile";
			}
		}
		return "redirect:/user/login";
	}
}
