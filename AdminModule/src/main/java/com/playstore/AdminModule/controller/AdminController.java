package com.playstore.AdminModule.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.playstore.AdminModule.model.Admin;
import com.playstore.AdminModule.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	AdminService adminService;

	@GetMapping("/register")
	public String showRegistrationForm(Model model) {
		model.addAttribute("Admin", new Admin());
		return "AdminRegistration";
	}

	@PostMapping("/register")
	public String registerAdmin(@ModelAttribute("Admin") Admin admin, Model model) {
		try {
			adminService.register(admin);
			return "redirect:/admin/login";
		} catch (Exception e) {
			model.addAttribute("errorMessage", "Registration failed. Please try again.");
			return "AdminRegistration";
		}
	}

	@GetMapping("/login")
	public String showLoginForm(Model model, HttpSession session) {
		model.addAttribute("Admin", new Admin());
		return "AdminLogin";
	}

	@PostMapping("/login")
	public String loginAdmin(@ModelAttribute("Admin") Admin admin, HttpSession session) {
		Optional<Admin> loginAdmin = adminService.login(admin.getEmail(), admin.getPassword());
		if (loginAdmin.isPresent()) {
			HttpSession session = request.getSession();
			session.setAttribute("Admin", loginAdmin.get());
			return "redirect:/admin/home";
		} else {
			session.setAttribute("errorMessage", "Invalid email or password.");
			return "redirect:/admin/login";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
			return "redirect:/admin/login";
		} else {
			return "AdminHome";
		}
		
	}

	@GetMapping("/home")
	public String adminHome(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			Admin admin = (Admin) session.getAttribute("Admin");
			if (admin != null) {
//				model.addAttribute("adminName", admin.getUsername());
				return "AdminHome";
			}
		}
		return "redirect:/admin/login";
	}

	@GetMapping("/profile")
	public String viewProfile(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			Admin admin = (Admin) session.getAttribute("Admin");
			if (admin != null) {
				model.addAttribute("admin", admin);
				return "AdminProfile";
			}
		}
		return "redirect:/admin/login";
		}
//	}

	@PostMapping("/profile/update")
	public String updateProfile(@ModelAttribute("Admin") Admin admin, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			Admin existingAdmin = (Admin) session.getAttribute("Admin");
			if (existingAdmin != null) {
				admin.setId(existingAdmin.getId()); // Preserve the existing ID
				admin.setRole(existingAdmin.getRole());
				adminService.update(admin);
				session.setAttribute("Admin", admin); // Update session with new data
				return "redirect:/admin/profile";
			}
		}
		return "redirect:/admin/login";
	}

	@GetMapping("/profile/delete")
	public String deleteProfile(HttpSession session, Model model) {
			Admin admin = (Admin) session.getAttribute("Admin");
				adminService.delete(admin);
				model.addAttribute("logoutMessage","You're Logout successfully.");
				session.removeAttribute("admin");
				session.invalidate();
				return "redirect:/admin/login";
			}
	
}






