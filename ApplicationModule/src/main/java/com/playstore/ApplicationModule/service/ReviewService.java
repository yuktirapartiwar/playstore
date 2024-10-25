package com.playstore.ApplicationModule.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playstore.ApplicationModule.DTO.ReviewDTO;
import com.playstore.ApplicationModule.model.Review;
import com.playstore.ApplicationModule.model.Application;
import com.playstore.ApplicationModule.repository.ReviewRepository;
import com.playstore.ApplicationModule.repository.ApplicationRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;
    
    @Autowired
    private ApplicationRepository applicationRepository;

    public ReviewDTO createReview(ReviewDTO reviewDTO) {
        Application application = applicationRepository.findById(reviewDTO.getApplicationId())
            .orElseThrow(() -> new RuntimeException("Application not found"));

        Review review = new Review(
            reviewDTO.getReviewText(),
            reviewDTO.getUserId(),
            reviewDTO.getUsername(),
            reviewDTO.getReviewDate(),
            application
        );

        Review savedReview = reviewRepository.save(review);
        return convertToDTO(savedReview);
    }

    public List<ReviewDTO> getReviewsByApplicationId(Long applicationId) {
        Application application = applicationRepository.findById(applicationId)
            .orElseThrow(() -> new RuntimeException("Application not found"));
            
        return application.getReviews().stream()
            .map(this::convertToDTO)
            .collect(Collectors.toList());
    }

    private ReviewDTO convertToDTO(Review review) {
        return new ReviewDTO(
            review.getId(),
            review.getReviewText(),
            review.getUserId(),
            review.getUsername(),
            review.getReviewDate(),
            review.getApplication().getId()
        );
    }
}
