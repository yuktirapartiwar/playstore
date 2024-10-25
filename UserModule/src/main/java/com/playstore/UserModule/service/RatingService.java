package com.playstore.UserModule.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.playstore.UserModule.DTO.RatingDTO;

@Service
public class RatingService {

    @Value("${application.service.url}")
    private String applicationServiceUrl;

    @Autowired
    private RestTemplate restTemplate;

    public void submitRating(RatingDTO ratingDTO) {
        String url = applicationServiceUrl + "/api/ratings";
        System.out.println("Submitting rating to URL: " + url);
        System.out.println("Rating data: applicationId=" + ratingDTO.getApplicationId() + 
            ", userId=" + ratingDTO.getUserId() + ", value=" + ratingDTO.getRatingValue());
        
        RatingDTO response = restTemplate.postForObject(url, ratingDTO, RatingDTO.class);
        System.out.println("Rating submission response: " + (response != null ? "success" : "null"));
    }

    public Double getAverageRating(Long applicationId) {
        try {
            String url = applicationServiceUrl + "/api/ratings/average/" + applicationId;
            System.out.println("Fetching average rating from URL: " + url);
            return restTemplate.getForObject(url, Double.class);
        } catch (Exception e) {
            System.out.println("Error fetching average rating: " + e.getMessage());
            return null;
        }
    }
}
