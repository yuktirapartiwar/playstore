package com.playstore.UserModule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.playstore.UserModule.model.User;
import com.playstore.UserModule.service.ReviewService;
import com.playstore.UserModule.DTO.ReviewDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.time.LocalDateTime;

@Controller
@RequestMapping("/user/review")
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    @PostMapping("/submit")
    public String submitReview(@RequestParam("applicationId") Long applicationId,
                             @RequestParam("reviewText") String reviewText,
                             HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("User") != null) {
            User user = (User) session.getAttribute("User");
            
            ReviewDTO reviewDTO = new ReviewDTO();
            reviewDTO.setApplicationId(applicationId);
            reviewDTO.setReviewText(reviewText);
            reviewDTO.setUserId(user.getId());
            reviewDTO.setUsername(user.getUsername());
            reviewDTO.setReviewDate(LocalDateTime.now());
            
            try {
                reviewService.submitReview(reviewDTO);
                return "redirect:/user/application/" + applicationId;
            } catch (Exception e) {
                return "redirect:/user/application/" + applicationId + "?error=true";
            }
        }
        return "redirect:/user/login";
    }
}
