package com.playstore.UserModule.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.playstore.UserModule.DTO.ReviewDTO;

import java.util.Arrays;
import java.util.List;

@Service
public class ReviewService {

    @Value("${application.service.url}")
    private String applicationServiceUrl;

    @Autowired
    private RestTemplate restTemplate;

    public void submitReview(ReviewDTO reviewDTO) {
        String url = applicationServiceUrl + "/api/reviews";
        restTemplate.postForObject(url, reviewDTO, ReviewDTO.class);
    }

    public List<ReviewDTO> getApplicationReviews(Long applicationId) {
        String url = applicationServiceUrl + "/api/reviews/application/" + applicationId;
        ResponseEntity<ReviewDTO[]> response = restTemplate.getForEntity(url, ReviewDTO[].class);
        return Arrays.asList(response.getBody());
    }
}
