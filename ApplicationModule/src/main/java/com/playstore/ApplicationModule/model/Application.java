package com.playstore.ApplicationModule.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "application")
public class Application {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "name", nullable = false, length = 100)
	private String name;

	@Column(name = "description", columnDefinition = "TEXT")
	private String description;

	@Column(name = "release_date")
	private LocalDate releaseDate;

	@Column(name = "version", length = 20)
	private String version;

	@Column(name = "genre", length = 50)
	private String genre;

	@Column(name = "owner_id", nullable = false)
	private Long ownerId;

	@Column(name = "download_count")
	private Integer downloadCount = 0;

	@Column(name = "visibility")
	private Boolean visibility = true;

	@OneToMany(mappedBy = "application", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Review> reviews = new ArrayList<>();

	@OneToMany(mappedBy = "application", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Rating> ratings = new ArrayList<>();
	
	@Column(name = "url", columnDefinition = "TEXT")
	private String url;
	
	// Constructors
		public Application() {
			this.reviews = new ArrayList<>();
			this.ratings = new ArrayList<>();
		}

		public Application(String name, String description, LocalDate releaseDate, String version, String genre, Long ownerId, String url) {
			this();
			this.name = name;
			this.description = description;
			this.releaseDate = releaseDate;
			this.version = version;
			this.genre = genre;
			this.ownerId = ownerId;
			this.url = url;
		}

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public LocalDate getReleaseDate() {
			return releaseDate;
		}

		public void setReleaseDate(LocalDate releaseDate) {
			this.releaseDate = releaseDate;
		}

		public String getVersion() {
			return version;
		}

		public void setVersion(String version) {
			this.version = version;
		}

		public String getGenre() {
			return genre;
		}

		public void setGenre(String genre) {
			this.genre = genre;
		}

		public Long getOwnerId() {
			return ownerId;
		}

		public void setOwnerId(Long ownerId) {
			this.ownerId = ownerId;
		}

		public Integer getDownloadCount() {
			return downloadCount;
		}

		public void setDownloadCount(Integer downloadCount) {
			this.downloadCount = downloadCount;
		}

		public Boolean getVisibility() {
			return visibility;
		}

		public void setVisibility(Boolean visibility) {
			this.visibility = visibility;
		}

		public List<Review> getReviews() {
			return reviews;
		}

		public void setReviews(List<Review> reviews) {
			this.reviews = reviews;
		}

		public List<Rating> getRatings() {
			return ratings;
		}

		public void setRatings(List<Rating> ratings) {
			this.ratings = ratings;
		}

		public String getUrl() {
			return url;
		}

		public void setUrl(String url) {
			this.url = url;
		}
		
		

}
