<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.playstore.AdminModule.DTO.ApplicationDTO"%>
<%@ page import="java.util.List" %>
<%@ page import="com.playstore.AdminModule.DTO.ReviewDTO" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Application Details - PlayStore Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <style>
        :root {
            --primary-color: #1a73e8;
            --secondary-color: #34a853;
            --danger-color: #ea4335;
            --warning-color: #fbbc05;
            --navbar-height: 60px;
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
            align-items: flex-start;
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .app-icon {
            width: 120px;
            height: 120px;
            border-radius: 20px;
            object-fit: cover;
        }

        .app-info {
            flex: 1;
        }

        .app-title {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .app-name {
            font-size: 1.75rem;
            font-weight: 600;
            margin: 0;
        }

        .genre-badge {
            background-color: #e9ecef;
            color: #495057;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            font-size: 0.9rem;
        }

        .meta-info {
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 1.5rem;
            margin: 2rem 0;
        }

        .meta-item {
            margin-bottom: 1rem;
        }

        .meta-label {
            font-weight: 600;
            color: #495057;
            margin-bottom: 0.5rem;
        }

        .meta-value {
            color: #333;
        }

        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin: 2rem 0;
        }

        .stat-card {
            background: white;
            border-radius: 10px;
            padding: 1rem;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        .stat-value {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--primary-color);
        }

        .stat-label {
            color: #666;
            font-size: 0.9rem;
        }

        .reviews-section {
            margin-top: 2rem;
        }

        .review-card {
            background: white;
            border-radius: 10px;
            padding: 1rem;
            margin-bottom: 1rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        .visibility-toggle {
            margin-left: auto;
        }

        .form-switch {
            padding-left: 2.5rem;
        }

        .form-check-input {
            width: 3rem;
            height: 1.5rem;
            cursor: pointer;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }

        .btn-edit {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-delete {
            background-color: var(--danger-color);
            color: white;
        }
    </style>
</head>
<body>
<% 
    ApplicationDTO app = (ApplicationDTO)request.getAttribute("application");
    List<ReviewDTO> reviews = (List<ReviewDTO>)request.getAttribute("reviews");
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMM dd, yyyy HH:mm");
%>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <i class="fas fa-play-circle me-2"></i>PlayStore
        </a>
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/admin/home"><i class="fas fa-home me-1"></i>Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/admin/application/list"><i class="fas fa-mobile-alt me-1"></i>Applications</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin/profile"><i class="fas fa-user me-1"></i>Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin/logout"><i class="fas fa-sign-out-alt me-1"></i>Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="app-detail-card">
        <!-- App Header -->
        <div class="app-header">
            <% if (app.getLogoUrl() != null && !app.getLogoUrl().isEmpty()) { %>
                <img src="<%= app.getLogoUrl() %>" alt="<%= app.getName() %>" class="app-icon">
            <% } else { %>
                <div class="app-icon d-flex align-items-center justify-content-center bg-light">
                    <i class="fas fa-mobile-alt fa-3x text-primary"></i>
                </div>
            <% } %>
            
            <div class="app-info">
                <div class="app-title">
                    <h1 class="app-name"><%= app.getName() %></h1>
                    <div class="visibility-toggle">
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" 
                                   id="visibility" 
                                   <%= app.getVisibility() ? "checked" : "" %>
                                   onchange="updateVisibility(<%= app.getId() %>, this.checked)">
                            <label class="form-check-label" for="visibility">
                                <span id="visibilityStatus" class="<%= app.getVisibility() ? "text-success" : "text-danger" %>">
                                    <%= app.getVisibility() ? "Visible" : "Hidden" %>
                                </span>
                            </label>
                        </div>
                    </div>
                </div>
                <span class="genre-badge"><%= app.getGenre() %></span>
            </div>
        </div>

        <!-- Statistics Cards -->
        <div class="stats-container">
            <div class="stat-card">
                <div class="stat-value"><%= app.getDownloadCount() %></div>
                <div class="stat-label">Downloads</div>
            </div>
            <div class="stat-card">
                <div class="stat-value">
                    <%= app.getAverageRating() != null ? String.format("%.1f", Double.parseDouble(app.getAverageRating())) : "0.0" %>
                </div>
                <div class="stat-label">Average Rating</div>
            </div>
            <div class="stat-card">
                <div class="stat-value"><%= app.getVersion() %></div>
                <div class="stat-label">Current Version</div>
            </div>
        </div>

        <!-- Meta Information -->
        <div class="meta-info">
            <div class="meta-item">
                <div class="meta-label">Description</div>
                <div class="meta-value"><%= app.getDescription() %></div>
            </div>
            <div class="meta-item">
                <div class="meta-label">Release Date</div>
                <div class="meta-value"><%= app.getReleaseDate() %></div>
            </div>
            <div class="meta-item">
                <div class="meta-label">Download URL</div>
                <div class="meta-value">
                    <a href="<%= app.getUrl() %>" target="_blank" class="text-primary">
                        <%= app.getUrl() %>
                    </a>
                </div>
            </div>
        </div>

        <!-- Reviews Section -->
        <div class="reviews-section">
            <h3 class="mb-4">User Reviews</h3>
            <div class="reviews-container">
                <% if (reviews != null && !reviews.isEmpty()) {
                    for (ReviewDTO review : reviews) { %>
                        <div class="review-card">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <div class="user-info">
                                    <i class="fas fa-user-circle me-2"></i>
                                    <span class="fw-bold"><%= review.getUsername() %></span>
                                </div>
                                <small class="text-muted">
                                    <%= review.getReviewDate().format(formatter) %>
                                </small>
                            </div>
                            <p class="mb-0"><%= review.getReviewText() %></p>
                        </div>
                    <% }
                } else { %>
                    <div class="alert alert-info" role="alert">
                        <i class="fas fa-info-circle me-2"></i>
                        No reviews available for this application.
                    </div>
                <% } %>
            </div>
        </div>

        <!-- Action Buttons -->
        <div class="action-buttons">
            <a href="/admin/application/edit/<%= app.getId() %>" class="btn btn-edit">
                <i class="fas fa-edit me-2"></i>Edit Application
            </a>
            <button class="btn btn-delete" onclick="deleteApplication('<%= app.getId() %>')">
                <i class="fas fa-trash-alt me-2"></i>Delete Application
            </button>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Initialize any UI components
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    const tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });

    // Initialize visibility toggle
    const visibilityToggle = document.getElementById('visibility');
    if (visibilityToggle) {
        visibilityToggle.addEventListener('change', function() {
            updateVisibility('<%= app.getId() %>', this.checked);
        });
    }
});

function updateVisibility(appId, isVisible) {
    fetch('/admin/application/' + appId + '/visibility?visibility=' + isVisible, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Failed to update visibility');
        }
        const statusElement = document.getElementById('visibilityStatus');
        statusElement.textContent = isVisible ? 'Visible' : 'Hidden';
        statusElement.className = isVisible ? 'text-success' : 'text-danger';
    })
    .catch(error => {
        console.error('Error:', error);
        document.getElementById('visibility').checked = !isVisible;
        alert('Failed to update visibility. Please try again.');
    });
}

function deleteApplication(appId) {
    if (confirm('Are you sure you want to delete this application? This action cannot be undone.')) {
        window.location.href = '/admin/application/delete/' + appId;
    }
}
</script>
</body>
</html>
