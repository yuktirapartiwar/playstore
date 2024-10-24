package com.playstore.AdminModule.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.playstore.AdminModule.DTO.ApplicationDTO;
import com.playstore.AdminModule.model.Admin;
import com.playstore.AdminModule.service.ApplicationService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/application")
public class ApplicationController {
    
    @Autowired
    private ApplicationService applicationService;
    
    @GetMapping("/add")
    public String showAddApplicationForm(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("Admin") != null) {
            model.addAttribute("application", new ApplicationDTO());
            return "AdminAddApplication";
        }
        return "redirect:/admin/login";
    }
    
    @PostMapping("/add")
    public String addApplication(@ModelAttribute ApplicationDTO applicationDTO, 
                               HttpServletRequest request, 
                               Model model) {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("Admin") != null) {
            Admin admin = (Admin) session.getAttribute("Admin");
            applicationDTO.setOwnerId(admin.getId());
            applicationDTO.setDownloadCount(0);
            
            try {
                applicationService.addApplication(applicationDTO);
                return "redirect:/admin/home";
            } catch (Exception e) {
                model.addAttribute("errorMessage", "Failed to add application: " + e.getMessage());
                return "AdminAddApplication";
            }
        }
        return "redirect:/admin/login";
    }
    
    @GetMapping("/list")
    public String listApplications(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("Admin") != null) {
            try {
                List<ApplicationDTO> applications = applicationService.getAllApplications();
                model.addAttribute("applications", applications);
                return "AdminApplicationList";
            } catch (Exception e) {
                model.addAttribute("errorMessage", "Failed to fetch applications: " + e.getMessage());
                return "AdminHome";
            }
        }
        return "redirect:/admin/login";
    }
    
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("Admin") != null) {
            try {
                ApplicationDTO application = applicationService.getApplicationById(id);
                model.addAttribute("application", application);

                return "AdminEditApplication";
            } catch (Exception e) {
                model.addAttribute("errorMessage", "Failed to fetch application: " + e.getMessage());
                return "redirect:/admin/application/list";
            }
        }
        return "redirect:/admin/login";
    }
    
    @PostMapping("/edit/{id}")
    public String updateApplication(@PathVariable Long id, 
                              @ModelAttribute ApplicationDTO applicationDTO,
                              HttpServletRequest request, 
                              Model model) {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("Admin") != null) {
            try {
                applicationDTO.setId(id);
                applicationService.updateApplication(applicationDTO);
                model.addAttribute("successMessage", "Application updated successfully!");
                return "redirect:/admin/application/list";
            } catch (Exception e) {
                model.addAttribute("errorMessage", "Failed to update application: " + e.getMessage());
                model.addAttribute("application", applicationDTO);
                return "AdminEditApplication";
            }
        }
        return "redirect:/admin/login";
    }
    
    @GetMapping("/delete/{id}")
    public String deleteApplication(@PathVariable Long id, 
                              HttpServletRequest request, 
                              Model model) {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("Admin") != null) {
            try {
                applicationService.deleteApplication(id);
                model.addAttribute("successMessage", "Application deleted successfully!");
            } catch (Exception e) {
                model.addAttribute("errorMessage", "Failed to delete application: " + e.getMessage());
            }
            return "redirect:/admin/application/list";
        }
        return "redirect:/admin/login";
    }
    
}