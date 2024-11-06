<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.playstore.UserModule.DTO.ApplicationDTO"%>
<%@ page import="java.util.List" %>
<%@ page import="com.playstore.UserModule.DTO.ReviewDTO" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Application Details - PlayStore</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
<style>
:root {
    --primary-color: #1a73e8;
    --secondary-color: #34a853;
    --danger-color: #ea4335;
    --warning-color: #fbbc05;
    --navbar-height: 60px;
    --footer-height: 56px;
    --sidebar-width: 250px;
}

body {
    min-height: 100vh;
    background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
    padding-top: var(--navbar-height);
}

.navbar {
    background-color: var(--primary-color);
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 1030;
    height: var(--navbar-height);
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.footer {
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    height: var(--footer-height);
    background-color: white;
    border-top: 1px solid #eee;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #6c757d;
    z-index: 10;
}

.app-detail-card {
    background: white;
    border-radius: 15px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    padding: 2rem;
    margin-top: 2rem;
}
.app-header {
    display: flex;
    align-items: center;
    margin-bottom: 2rem;
}
.app-icon {
    width: 120px;
    height: 120px;
    border-radius: 20px;
    margin-right: 2rem;
}
.app-info h1 {
    margin-bottom: 0.5rem;
}
.genre-badge {
    background-color: #e9ecef;
    color: #495057;
    padding: 0.5rem 1rem;
    border-radius: 8px;
    font-size: 0.9rem;
    display: inline-block;
}
.meta-info {
    margin: 2rem 0;
    padding: 1rem;
    background-color: #f8f9fa;
    border-radius: 10px;
}
.meta-item {
    margin-bottom: 1rem;
}
.meta-label {
    font-weight: 600;
    color: #495057;
}
.download-btn {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 1rem 2rem;
    border-radius: 10px;
    font-weight: 500;
    transition: all 0.3s ease;
}
.download-btn:hover {
    background-color: #218838;
    transform: translateY(-2px);
}
.review-card {
    transition: transform 0.2s;
}
.review-card:hover {
    transform: translateY(-2px);
}
.user-info {
    color: #495057;
}
.review-text {
    color: #212529;
    line-height: 1.6;
}
.reviews-list {
    max-width: 800px;
    margin: 0 auto;
}
.alert {
    z-index: 1050;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    max-width: 90%;
    width: 400px;
}
.star-rating {
    display: flex;
    flex-direction: row-reverse;
    justify-content: flex-end;
}

.star-rating input {
    display: none;
}

.star-rating label {
    cursor: pointer;
    font-size: 25px;
    color: #ddd;
    padding: 5px;
}

.star-rating label:hover,
.star-rating label:hover ~ label,
.star-rating input:checked ~ label {
    color: #ffc107;
}

.rating-form {
    max-width: 300px;
    margin: 0 auto;
    text-align: center;
}
.rating-display {
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.rating-display .stars {
    color: #ffc107;
}

.rating-value {
    color: #6c757d;
    font-weight: 500;
}

.stars i {
    font-size: 1rem;
    margin-right: 2px;
}

.ratings-reviews-container {
    margin-top: 3rem;
}

.review-card {
    border: 1px solid #eee;
    border-radius: 8px;
    padding: 1rem;
    background-color: #f8f9fa;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.review-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
<% 
    ApplicationDTO app = (ApplicationDTO)request.getAttribute("application");
    List<ReviewDTO> reviews = (List<ReviewDTO>)request.getAttribute("reviews");
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMM dd, yyyy HH:mm");
%>
    
<!-- Navigation bar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="/user/home">PlayStore</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/user/home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user/profile">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user/logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="app-detail-card">
        <div class="app-header">
            <% if (app.getLogoUrl() != null && !app.getLogoUrl().isEmpty()) { %>
                <img src="<%= app.getLogoUrl() %>" alt="<%= app.getName() %>" class="app-icon">
            <% } else { %>
                <div class="app-icon d-flex align-items-center justify-content-center bg-light">
                    <i class="fas fa-mobile-alt fa-3x text-primary"></i>
                </div>
            <% } %>
            <div class="app-info">
                <h1><%= app.getName() %></h1>
                <div class="app-meta d-flex align-items-center gap-3">
                    <span class="genre-badge"><%= app.getGenre() %></span>
                    <div class="rating-display">
                        <% if (app.getAverageRating() != null) { %>
                            <span class="stars">
                                <% for (int i = 1; i <= 5; i++) { %>
                                    <i class="fas fa-star <%= i <= app.getAverageRating() ? "text-warning" : "text-muted" %>"></i>
                                <% } %>
                            </span>
                            <span class="rating-value">(<%= String.format("%.1f", app.getAverageRating()) %>)</span>
                        <% } else { %>
                            <span class="text-muted">No ratings yet</span>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>

        <div class="meta-info">
            <div class="meta-item">
                <div class="meta-label">Description</div>
                <p><%= app.getDescription() %></p>
            </div>
            <div class="meta-item">
                <div class="meta-label">Version</div>
                <p><%= app.getVersion() %></p>
            </div>
            <div class="meta-item">
                <div class="meta-label">Release Date</div>
                <p><%= app.getReleaseDate() %></p>
            </div>
        </div>

        <button class="download-btn" onclick="event.stopPropagation(); downloadApplication('<%= app.getUrl() %>', '<%= app.getId() %>')">
            <i class="fas fa-download me-2"></i>Download
        </button>

        <div class="ratings-reviews-container mt-4">
            <div class="row">
                <!-- Rating Section -->
                <div class="col-md-5">
                    <div class="rating-section bg-white p-4 rounded shadow-sm">
                        <h4 class="mb-4">Rate this Application</h4>
                        <form action="/user/rating/submit" method="post" class="rating-form">
                            <input type="hidden" name="applicationId" value="<%= app.getId() %>">
                            <div class="star-rating mb-3">
                                <input type="radio" id="star5" name="ratingValue" value="5" required>
                                <label for="star5" title="5 stars"><i class="fas fa-star"></i></label>
                                <input type="radio" id="star4" name="ratingValue" value="4">
                                <label for="star4" title="4 stars"><i class="fas fa-star"></i></label>
                                <input type="radio" id="star3" name="ratingValue" value="3">
                                <label for="star3" title="3 stars"><i class="fas fa-star"></i></label>
                                <input type="radio" id="star2" name="ratingValue" value="2">
                                <label for="star2" title="2 stars"><i class="fas fa-star"></i></label>
                                <input type="radio" id="star1" name="ratingValue" value="1">
                                <label for="star1" title="1 star"><i class="fas fa-star"></i></label>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">
                                <i class="fas fa-star me-2"></i>Submit Rating
                            </button>
                        </form>
                    </div>

                    <div class="review-form-section bg-white p-4 rounded shadow-sm mt-4">
                        <h4 class="mb-4">Write a Review</h4>
                        <form action="/user/review/submit" method="post">
                            <input type="hidden" name="applicationId" value="<%= app.getId() %>">
                            <div class="mb-3">
                                <textarea class="form-control" id="reviewText" name="reviewText" 
                                          rows="4" required placeholder="Share your thoughts about this application..."></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">
                                <i class="fas fa-paper-plane me-2"></i>Submit Review
                            </button>
                        </form>
                    </div>
                </div>

                <!-- Reviews List Section -->
                <div class="col-md-7">
                    <div class="reviews-section bg-white p-4 rounded shadow-sm">
                        <h4 class="mb-4">User Reviews</h4>
                        <div class="reviews-container" style="max-height: 600px; overflow-y: auto;">
                            <% if (reviews != null && !reviews.isEmpty()) {
                                for (ReviewDTO review : reviews) { %>
                                    <div class="review-card mb-3">
                                        <div class="d-flex justify-content-between align-items-center mb-2">
                                            <div class="user-info">
                                                <i class="fas fa-user-circle me-2"></i>
                                                <span class="fw-bold"><%= review.getUsername() %></span>
                                            </div>
                                            <small class="text-muted">
                                                <%= review.getReviewDate().format(formatter) %>
                                            </small>
                                        </div>
                                        <p class="review-text mb-0"><%= review.getReviewText() %></p>
                                    </div>
                                <% }
                            } else { %>
                                <div class="alert alert-info" role="alert">
                                    <i class="fas fa-info-circle me-2"></i>
                                    No reviews yet. Be the first to review this application!
                                </div>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>
function downloadApplication(url, applicationId) {
    // Make AJAX call to increment download count
    fetch('/api/downloads/' + applicationId, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        }
    });
    
    // Show success message
    const alertDiv = document.createElement('div');
    alertDiv.className = 'alert alert-success alert-dismissible fade show position-fixed top-0 start-50 translate-middle-x mt-3';
    alertDiv.innerHTML = `
        <strong>Success!</strong> Download completed.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    `;
    document.body.appendChild(alertDiv);

    

    // Open URL in new tab
    window.open(url, '_blank');

    // Remove alert after 30 seconds
    setTimeout(() => {
        alertDiv.remove();
    }, 30000);
}
</script>
</body>
</html>
