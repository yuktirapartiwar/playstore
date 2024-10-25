<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.playstore.UserModule.DTO.ApplicationDTO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Application Details - PlayStore</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
<style>
body {
    background-color: #f8f9fa;
    font-family: 'Arial', sans-serif;
}
.navbar {
    background-color: #28a745;
}
.navbar-brand, .nav-link {
    color: white !important;
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
</style>
</head>
<body>
<% ApplicationDTO app = (ApplicationDTO)request.getAttribute("application"); %>
    
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
                <span class="genre-badge"><%= app.getGenre() %></span>
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

        <button class="download-btn">
            <i class="fas fa-download me-2"></i>Download
        </button>
    </div>
</div>

<div class="review-section mt-4">
    <h3>Write a Review</h3>
    <form action="/user/review/submit" method="post">
        <input type="hidden" name="applicationId" value="<%= app.getId() %>">
        <div class="mb-3">
            <label for="reviewText" class="form-label">Your Review</label>
            <textarea class="form-control" id="reviewText" name="reviewText" 
                      rows="4" required placeholder="Share your thoughts about this application..."></textarea>
        </div>
        <button type="submit" class="btn btn-primary">
            <i class="fas fa-paper-plane me-2"></i>Submit Review
        </button>
    </form>
</div>

<div class="reviews-list mt-5">
    <h3>Reviews</h3>
    <%@ page import="java.util.List" %>
    <%@ page import="com.playstore.UserModule.DTO.ReviewDTO" %>
    <%@ page import="java.time.format.DateTimeFormatter" %>
    <% 
        List<ReviewDTO> reviews = (List<ReviewDTO>) request.getAttribute("reviews");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMM dd, yyyy HH:mm");
        if (reviews != null && !reviews.isEmpty()) {
            for (ReviewDTO review : reviews) {
    %>
        <div class="review-card mb-4 p-4 bg-white rounded shadow-sm">
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
    <%
            }
        } else {
    %>
        <div class="alert alert-info" role="alert">
            No reviews yet. Be the first to review this application!
        </div>
    <%
        }
    %>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
