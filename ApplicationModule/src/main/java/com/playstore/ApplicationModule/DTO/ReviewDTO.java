package com.playstore.ApplicationModule.DTO;

import java.time.LocalDateTime;

public class ReviewDTO {
	private Long id;
    private String reviewText;
    private Long userId;
    private String username;
    private LocalDateTime reviewDate;
    private Long applicationId;
    
 // Default constructor
    public ReviewDTO() {}

    // Parameterized constructor
    public ReviewDTO(Long id, String reviewText, Long userId, String username, LocalDateTime reviewDate, Long applicationId) {
        this.id = id;
        this.reviewText = reviewText;
        this.userId = userId;
        this.username = username;
        this.reviewDate = reviewDate;
        this.applicationId = applicationId;
    }

    // Getters and setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getReviewText() {
        return reviewText;
    }

    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public LocalDateTime getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(LocalDateTime reviewDate) {
        this.reviewDate = reviewDate;
    }

    public Long getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(Long applicationId) {
        this.applicationId = applicationId;
    }

}
