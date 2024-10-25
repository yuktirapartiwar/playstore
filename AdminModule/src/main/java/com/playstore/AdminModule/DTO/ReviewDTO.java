package com.playstore.AdminModule.DTO;

import java.time.LocalDateTime;

public class ReviewDTO {
    private Long id;
    private Long applicationId;
    private Long userId;
    private String username;
    private String reviewText;
    private LocalDateTime reviewDate;

    // Default constructor
    public ReviewDTO() {
        super();
    }

    // Parameterized constructor
    public ReviewDTO(Long id, Long applicationId, Long userId, String username, 
                    String reviewText, LocalDateTime reviewDate) {
        super();
        this.id = id;
        this.applicationId = applicationId;
        this.userId = userId;
        this.username = username;
        this.reviewText = reviewText;
        this.reviewDate = reviewDate;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(Long applicationId) {
        this.applicationId = applicationId;
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

    public String getReviewText() {
        return reviewText;
    }

    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
    }

    public LocalDateTime getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(LocalDateTime reviewDate) {
        this.reviewDate = reviewDate;
    }

    @Override
    public String toString() {
        return "ReviewDTO [id=" + id + 
               ", applicationId=" + applicationId + 
               ", userId=" + userId + 
               ", username=" + username + 
               ", reviewText=" + reviewText + 
               ", reviewDate=" + reviewDate + "]";
    }
}
