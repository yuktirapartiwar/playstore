package com.playstore.AdminModule.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class RatingService {

    @Value("${application.service.url}")
    private String applicationServiceUrl;

    @Autowired
    private RestTemplate restTemplate;

    public Double getAverageRating(Long applicationId) {
        try {
            String url = applicationServiceUrl + "/api/ratings/average/" + applicationId;
            System.out.println("Admin - Fetching average rating from URL: " + url);
            return restTemplate.getForObject(url, Double.class);
        } catch (Exception e) {
            System.out.println("Admin - Error fetching average rating: " + e.getMessage());
            return null;
        }
    }
}
