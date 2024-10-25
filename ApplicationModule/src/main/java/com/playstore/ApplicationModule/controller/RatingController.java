package com.playstore.ApplicationModule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.playstore.ApplicationModule.DTO.RatingDTO;
import com.playstore.ApplicationModule.service.RatingService;

@RestController
@RequestMapping("/api/ratings")
public class RatingController {

    @Autowired
    private RatingService ratingService;

    @PostMapping
    public ResponseEntity<RatingDTO> createRating(@RequestBody RatingDTO ratingDTO) {
        try {
            RatingDTO createdRating = ratingService.createRating(ratingDTO);
            return new ResponseEntity<>(createdRating, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/average/{applicationId}")
    public ResponseEntity<Double> getAverageRating(@PathVariable Long applicationId) {
        try {
            System.out.println("Received request for average rating of application " + applicationId);
            Double averageRating = ratingService.getAverageRating(applicationId);
            System.out.println("Returning average rating: " + averageRating);
            return new ResponseEntity<>(averageRating, HttpStatus.OK);
        } catch (Exception e) {
            System.out.println("Error getting average rating: " + e.getMessage());
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
