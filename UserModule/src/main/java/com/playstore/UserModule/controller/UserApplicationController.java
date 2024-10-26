package com.playstore.UserModule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.playstore.UserModule.DTO.ApplicationDTO;
import com.playstore.UserModule.DTO.ReviewDTO;
import com.playstore.UserModule.service.ApplicationService;
import com.playstore.UserModule.service.ReviewService;
import com.playstore.UserModule.service.RatingService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.util.List;

@Controller
@RequestMapping("/user/application")
public class UserApplicationController {

    @Autowired
    private ApplicationService applicationService;
    
    @Autowired
    private ReviewService reviewService;
    
    @Autowired
    private RatingService ratingService;

    @GetMapping("/{id}")
    public String viewApplication(@PathVariable Long id, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("User") != null) {
            try {
                ApplicationDTO application = applicationService.getApplicationById(id);
                List<ReviewDTO> reviews = reviewService.getApplicationReviews(id);
                
                Double avgRating = ratingService.getAverageRating(id);
                if (avgRating != null) {
                    model.addAttribute("averageRating", avgRating);
                }
                
                model.addAttribute("application", application);
                model.addAttribute("reviews", reviews);
                return "UserApplicationDetail";
            } catch (Exception e) {
                e.printStackTrace();
                // return "redirect:/user/home?error=true";
            }
        }
        return "redirect:/user/login";
    }

    @GetMapping("/search")
    public String searchApplications(@RequestParam String query, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("User") != null) {
            try {
                ApplicationDTO searchResult = applicationService.searchApplicationsByName(query);
                
                if (searchResult != null) {
                    return "redirect:/user/application/" + searchResult.getId();
                }
                
                // If no result found, return to home page
                model.addAttribute("errorMessage", "No applications found matching your search.");
                return "redirect:/user/home";
                
            } catch (Exception e) {
                model.addAttribute("errorMessage", "Failed to search applications: " + e.getMessage());
                return "redirect:/user/home";
            }
        }
        return "redirect:/user/login";
    }
}
