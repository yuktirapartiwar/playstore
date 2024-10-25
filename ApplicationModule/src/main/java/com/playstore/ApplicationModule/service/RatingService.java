package com.playstore.ApplicationModule.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playstore.ApplicationModule.DTO.RatingDTO;
import com.playstore.ApplicationModule.model.Rating;
import com.playstore.ApplicationModule.model.Application;
import com.playstore.ApplicationModule.repository.RatingRepository;
import com.playstore.ApplicationModule.repository.ApplicationRepository;
import java.util.List;

@Service
public class RatingService {

    @Autowired
    private RatingRepository ratingRepository;
    
    @Autowired
    private ApplicationRepository applicationRepository;

    public RatingDTO createRating(RatingDTO ratingDTO) {
        Application application = applicationRepository.findById(ratingDTO.getApplicationId())
            .orElseThrow(() -> new RuntimeException("Application not found"));

        Rating rating = new Rating(
            application,
            ratingDTO.getUserId(),
            ratingDTO.getRatingDate(),
            ratingDTO.getRatingValue()
        );

        Rating savedRating = ratingRepository.save(rating);
        
        // Calculate and update average rating
        double avgRating = application.getRatings().stream()
            .mapToInt(Rating::getRatingValue)
            .average()
            .orElse(0.0);
        
        application.setAverageRating(avgRating);
        applicationRepository.save(application);
        
        return convertToDTO(savedRating);
    }

    public Double getAverageRating(Long applicationId) {
        Application application = applicationRepository.findById(applicationId)
            .orElseThrow(() -> new RuntimeException("Application not found"));
        return application.getAverageRating();
    }

    private RatingDTO convertToDTO(Rating rating) {
        return new RatingDTO(
            rating.getId(),
            rating.getApplication().getId(),
            rating.getUserId(),
            null,
            rating.getRatingDate(),
            rating.getRatingValue()
        );
    }
}
