package com.playstore.ApplicationModule.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "rating")
public class Rating {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "application_id", nullable = false)
    private Application application;

    @Column(name = "user_id", nullable = false)
    private Long userId;

    @Column(name = "rating_date")
    private LocalDateTime ratingDate;

    @Column(name = "rating_value", nullable = false)
    private Integer ratingValue;

	public Rating() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Rating(Application application, Long userId, LocalDateTime ratingDate, Integer ratingValue) {
		super();
		this.application = application;
		this.userId = userId;
		this.ratingDate = ratingDate;
		this.ratingValue = ratingValue;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
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
