package com.playstore.ApplicationModule.DTO;

import java.time.LocalDateTime;

public class RatingDTO {
	private Long id;
    private Long applicationId;
    private Long userId;
    private String username;
    private LocalDateTime ratingDate;
    private Integer ratingValue;
	public RatingDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RatingDTO(Long id, Long applicationId, Long userId, String username, LocalDateTime ratingDate,
			Integer ratingValue) {
		super();
		this.id = id;
		this.applicationId = applicationId;
		this.userId = userId;
		this.username = username;
		this.ratingDate = ratingDate;
		this.ratingValue = ratingValue;
	}
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
	public LocalDateTime getRatingDate() {
		return ratingDate;
	}
	public void setRatingDate(LocalDateTime ratingDate) {
		this.ratingDate = ratingDate;
	}
	public Integer getRatingValue() {
		return ratingValue;
	}
	public void setRatingValue(Integer ratingValue) {
		this.ratingValue = ratingValue;
	}
    
    
}