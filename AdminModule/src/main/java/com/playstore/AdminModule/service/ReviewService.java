package com.playstore.AdminModule.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.playstore.AdminModule.DTO.ReviewDTO;

@Service
public class ReviewService {
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${application.service.url}")
    private String applicationServiceUrl;
    
    public List<ReviewDTO> getApplicationReviews(Long applicationId) {
        String url = applicationServiceUrl + "/api/reviews/application/" + applicationId;
        ReviewDTO[] reviews = restTemplate.getForObject(url, ReviewDTO[].class);
        return Arrays.asList(reviews);
    }
    
    public void deleteReview(Long reviewId) {
        String url = applicationServiceUrl + "/api/reviews/" + reviewId;
        restTemplate.delete(url);
    }
}
