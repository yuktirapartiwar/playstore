package com.playstore.UserModule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.playstore.UserModule.model.User;
import com.playstore.UserModule.service.RatingService;
import com.playstore.UserModule.DTO.RatingDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.time.LocalDateTime;

@Controller
@RequestMapping("/user/rating")
public class RatingController {

    @Autowired
    private RatingService ratingService;

    @PostMapping("/submit")
    public String submitRating(@RequestParam("applicationId") Long applicationId,
                             @RequestParam("ratingValue") Integer ratingValue,
                             HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("User") != null) {
            User user = (User) session.getAttribute("User");
            
            RatingDTO ratingDTO = new RatingDTO();
            ratingDTO.setApplicationId(applicationId);
            ratingDTO.setRatingValue(ratingValue);
            ratingDTO.setUserId(user.getId());
            ratingDTO.setUsername(user.getUsername());
            ratingDTO.setRatingDate(LocalDateTime.now());
            
            try {
                ratingService.submitRating(ratingDTO);
                return "redirect:/user/application/" + applicationId;
            } catch (Exception e) {
                return "redirect:/user/application/" + applicationId + "?error=true";
            }
        }
        return "redirect:/user/login";
    }
}
