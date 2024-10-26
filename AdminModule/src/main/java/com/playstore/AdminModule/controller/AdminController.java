package com.playstore.AdminModule.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.playstore.AdminModule.exception.AdminAlreadyExistsException;
import com.playstore.AdminModule.exception.AdminDeletionFailedException;
import com.playstore.AdminModule.exception.AdminNotFoundException;
import com.playstore.AdminModule.exception.AdminUpdateFailedException;
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
		} catch (AdminAlreadyExistsException e) {
			model.addAttribute("errorMessage", e.getMessage());
			return "AdminRegistration";
		} catch (Exception e) {
			model.addAttribute("errorMessage", "Registration failed. Please try again.");
			return "AdminRegistration";
		}
	}

	@GetMapping("/login")
	public String showLoginForm(Model model, HttpServletRequest request) {
		model.addAttribute("Admin", new Admin());
		String message = request.getParameter("message");
		if (message != null) {
			model.addAttribute("successMessage", message);
		}
		return "AdminLogin";
	}

	@PostMapping("/login")
	public String loginAdmin(@ModelAttribute("Admin") Admin admin, HttpServletRequest request, Model model) {
		try {
			Admin loggedInAdmin = adminService.login(admin.getEmail(), admin.getPassword());
			HttpSession session = request.getSession();
			session.setAttribute("Admin", loggedInAdmin);
			return "redirect:/admin/application/list";
		} catch (AdminNotFoundException e) {
			model.addAttribute("errorMessage", e.getMessage());
			return "AdminApplicationList";
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

// 	@GetMapping("/home")
// 	public String adminHome(Model model, HttpServletRequest request) {
// 		HttpSession session = request.getSession(false);
// 		if (session != null) {
// 			Admin admin = (Admin) session.getAttribute("Admin");
// 			if (admin != null) {
// //				model.addAttribute("adminName", admin.getUsername());
// 				return "AdminHome";
// 			}
// 		}
// 		return "redirect:/admin/login";
// 	}

	@GetMapping("/profile")
	public String viewProfile(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			Admin admin = (Admin) session.getAttribute("Admin");
			if (admin != null) {
				model.addAttribute("Admin", admin);
				return "AdminProfile";
			}
		}
		return "redirect:/admin/login";
		}
//	}

	@PostMapping("/profile/update")
	public String updateProfile(@ModelAttribute("Admin") Admin admin, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("Admin") != null) {
			Admin existingAdmin = (Admin) session.getAttribute("Admin");
			admin.setId(existingAdmin.getId());
			admin.setRole(existingAdmin.getRole());
			try {
				adminService.update(admin);
				session.setAttribute("Admin", admin);
				return "redirect:/admin/profile";
			} catch (AdminAlreadyExistsException e) {
				model.addAttribute("errorMessage", e.getMessage());
				return "AdminProfile";
			} catch (AdminUpdateFailedException e) {
				model.addAttribute("errorMessage", e.getMessage());
				return "AdminProfile";
			}
		}
		return "redirect:/admin/login";
	}

	@GetMapping("/profile/delete")
	public String deleteProfile(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("Admin") != null) {
			Admin admin = (Admin) session.getAttribute("Admin");
			try {
				adminService.delete(admin);
				session.invalidate();
				return "redirect:/admin/login?message=Your account has been deleted successfully.";
			} catch (AdminDeletionFailedException e) {
				model.addAttribute("errorMessage", e.getMessage());
				return "AdminProfile";
			}
		}
		return "redirect:/admin/login";
	}

}
