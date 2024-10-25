package com.playstore.UserModule.DTO;

import java.time.LocalDate;

public class ApplicationDTO {
	private Long id;
    private String name;
    private String description;
    private LocalDate releaseDate;
    private String version;
    private String genre;
    private Long ownerId;
    private Integer downloadCount;
    private Boolean visibility;
    private String url;
     private String logoUrl;
	private Double averageRating;
	public ApplicationDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ApplicationDTO(Long id, String name, String description, LocalDate releaseDate, String version, String genre,
			Long ownerId, Integer downloadCount, Boolean visibility, String url, String logoUrl) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.releaseDate = releaseDate;
		this.version = version;
		this.genre = genre;
		this.ownerId = ownerId;
		this.downloadCount = downloadCount;
		this.visibility = visibility;
		this.url = url;
        this.logoUrl = logoUrl;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
    public String getLogoUrl() {
		return logoUrl;
	}
	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}
	public Double getAverageRating() {
		return averageRating;
	}
	public void setAverageRating(Double averageRating) {
		this.averageRating = averageRating;
	}
    
}
