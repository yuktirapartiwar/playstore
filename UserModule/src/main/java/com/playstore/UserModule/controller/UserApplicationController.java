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
import java.util.Set;
import java.util.ArrayList;

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

    @GetMapping("/genre/{genre}")
    public String getApplicationsByGenre(@PathVariable String genre, Model model, HttpServletRequest request) {
        System.out.println("==================================");
        System.out.println("Request received for genre: " + genre);
        System.out.println("Request URI: " + request.getRequestURI());
        
        HttpSession session = request.getSession(false);
        System.out.println("Session exists: " + (session != null));
        if (session != null) {
            System.out.println("User in session: " + session.getAttribute("User"));
        }
        
        if (session != null && session.getAttribute("User") != null) {
            System.out.println("User is authenticated");
            try {
                // Get applications for the genre
                System.out.println("Fetching applications for genre^&^&^&^&: " + genre);
                List<ApplicationDTO> applications = applicationService.getApplicationsByGenre(genre);
                System.out.println("Applications found: " + applications.size());
                
                // Add ratings
                for (ApplicationDTO app : applications) {
                    Double avgRating = ratingService.getAverageRating(app.getId());
                    if (avgRating != null) {
                        model.addAttribute("averageRating_" + app.getId(), avgRating);
                    }
                }
                
                // Add attributes to model
                model.addAttribute("applications", applications);
                model.addAttribute("selectedGenre", genre);
                
                // Return view name directly without redirect
                return "UserCategoryPage";
                
            } catch (Exception e) {
                System.out.println("Error occurred: " + e.getMessage());
                e.printStackTrace();
                
                // Add error details to model and return to same page
                model.addAttribute("errorMessage", "Failed to fetch applications: " + e.getMessage());
                model.addAttribute("applications", new ArrayList<>()); // Empty list
                model.addAttribute("selectedGenre", genre);
                return "UserCategoryPage"; // Stay on same page
            }
        }
        
        System.out.println("Session validation failed");
        return "redirect:/user/login";
    }

    // Add this method to catch any requests to /user/application/**
    @GetMapping("/**")
    public String catchAll(HttpServletRequest request) {
        System.out.println("==================================");
        System.out.println("Catch-all handler reached");
        System.out.println("Request URI: " + request.getRequestURI());
        System.out.println("Request URL: " + request.getRequestURL());
        System.out.println("==================================");
        return "redirect:/user/home";
    }
}
