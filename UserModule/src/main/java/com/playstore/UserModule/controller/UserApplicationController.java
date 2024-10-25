package com.playstore.UserModule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
