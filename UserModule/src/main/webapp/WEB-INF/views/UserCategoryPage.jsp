<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.playstore.UserModule.DTO.ApplicationDTO"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= request.getAttribute("selectedGenre") %> Applications - PlayStore</title>
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
        }

        .navbar {
            background-color: var(--primary-color);
            height: var(--navbar-height);
        }

        .page-container {
            display: flex;
            min-height: calc(100vh - var(--navbar-height));
        }

        .sidebar {
            width: var(--sidebar-width);
            padding: 1rem;
            background-color: white;
            border-right: 1px solid #dee2e6;
        }

        .main-content {
            flex: 1;
            padding: 2rem;
            background-color: #f8f9fa;
        }

        /* Copy all styles from UserHome.jsp */
        .app-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 1.5rem;
            padding: 1rem;
        }

        .app-card {
            background: white;
            border-radius: 12px;
            padding: 1rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            transition: transform 0.2s;
        }

        .app-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        /* Add all other styles from UserHome.jsp */

        .app-info {
            text-align: center;
        }

        .app-name {
            font-weight: 600;
            color: #333;
            margin-bottom: 0.5rem;
        }

        .app-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .category-badge {
            background-color: #e9ecef;
            color: #495057;
            padding: 0.25rem 0.5rem;
            border-radius: 6px;
            font-size: 0.8rem;
        }

        .details-btn {
            width: 100%;
            background-color: #28a745;
            border: none;
            padding: 0.5rem;
            border-radius: 8px;
            color: white;
            font-weight: 500;
            transition: background-color 0.3s ease;
        }

        .details-btn:hover {
            background-color: #218838;
            color: white;
        }

        .app-rating {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .menu-items li.active {
            background-color: rgba(26, 115, 232, 0.1);
            border-radius: 8px;
        }

        .menu-items li.active a {
            color: var(--primary-color);
            font-weight: 500;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
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

    <div class="page-container">
        <!-- Sidebar -->
        <div class="sidebar bg-white border-end">
            <div class="search-box">
                <form action="/user/application/search" method="get" class="d-flex">
                    <input type="text" name="query" class="search-input" placeholder="Search applications..." required>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
            </div>
            
            <div class="sidebar-menu">
                <div class="menu-section">
                    <div class="menu-title">CATEGORIES</div>
                    <ul class="menu-items">
                        <li class="<%= "Games".equals(request.getAttribute("selectedGenre")) ? "active" : "" %>">
                            <a href="/user/application/genre/Games" 
                               class="text-decoration-none"
                               onclick="console.log('Games link clicked')">
                                <i class="fas fa-gamepad"></i>Games
                            </a>
                        </li>
                        <li class="<%= "Beauty".equals(request.getAttribute("selectedGenre")) ? "active" : "" %>">
                            <a href="/user/application/genre/Beauty" 
                               class="text-decoration-none"
                               onclick="console.log('Beauty link clicked')">
                                <i class="fas fa-spa"></i>Beauty
                            </a>
                        </li>
                        <li class="<%= "Fashion".equals(request.getAttribute("selectedGenre")) ? "active" : "" %>">
                            <a href="/user/application/genre/Fashion" 
                               class="text-decoration-none"
                               onclick="console.log('Fashion link clicked')">
                                <i class="fas fa-tshirt"></i>Fashion
                            </a>
                        </li>
                        <li class="<%= "Women".equals(request.getAttribute("selectedGenre")) ? "active" : "" %>">
                            <a href="/user/application/genre/Women" 
                               class="text-decoration-none"
                               onclick="console.log('Women link clicked')">
                                <i class="fas fa-female"></i>Women
                            </a>
                        </li>
                        <li class="<%= "Health".equals(request.getAttribute("selectedGenre")) ? "active" : "" %>">
                                <a href="/user/application/genre/Health" 
                               class="text-decoration-none"
                               onclick="console.log('Health link clicked')">
                                <i class="fas fa-heartbeat"></i>Health
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="container mt-4">
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="alert alert-danger">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                <% } %>
                
                <div class="d-flex align-items-center mb-4">
                    <h2 class="mb-0"><%= request.getAttribute("selectedGenre") %> Applications</h2>
                    <% 
                    List<ApplicationDTO> applications = (List<ApplicationDTO>)request.getAttribute("applications");
                    if (applications != null) {
                    %>
                        <span class="ms-3 badge bg-primary"><%= applications.size() %> apps</span>
                    <% } %>
                </div>
                <div class="app-grid">
                    <% 
                    if (applications != null && !applications.isEmpty()) {
                        for (ApplicationDTO app : applications) {
                    %>
                        <div class="app-card" onclick="window.location.href='/user/application/<%= app.getId() %>';" style="cursor: pointer;">
                            <% if (app.getLogoUrl() != null && !app.getLogoUrl().isEmpty()) { %>
                                <img src="<%= app.getLogoUrl() %>" alt="<%= app.getName() %>" class="app-icon">
                            <% } else { %>
                                <div class="app-icon d-flex align-items-center justify-content-center bg-light">
                                    <i class="fas fa-mobile-alt fa-2x text-primary"></i>
                                </div>
                            <% } %>
                            
                            <div class="app-info">
                                <h5 class="app-name"><%= app.getName() %></h5>
                                <div class="app-meta">
                                    <span class="category-badge"><%= app.getGenre() %></span>
                                    <div class="app-rating">
                                        <% Double avgRating = (Double) request.getAttribute("averageRating_" + app.getId()); %>
                                        <% if (avgRating != null) { %>
                                            <span class="stars">
                                                <% for (int i = 1; i <= 5; i++) { %>
                                                    <i class="fas fa-star <%= i <= avgRating ? "text-warning" : "text-muted" %>"></i>
                                                <% } %>
                                            </span>
                                            <span class="rating-value">(<%= String.format("%.1f", avgRating) %>)</span>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                            <button class="details-btn">
                                <i class="fas fa-info-circle me-2"></i>View Details
                            </button>
                        </div>
                    <% 
                        }
                    } else {
                    %>
                        <div class="col-12 text-center py-5">
                            <i class="fas fa-box-open fa-3x text-muted mb-3"></i>
                            <h5 class="text-muted">No applications available</h5>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const mainContent = document.querySelector('.main-content');
        
        document.querySelectorAll('.menu-items a').forEach(link => {
            link.addEventListener('click', function(e) {
                // Show loading state
                mainContent.style.opacity = '0.5';
                mainContent.style.pointerEvents = 'none';
                // Let the normal navigation happen
            });
        });
    });
    </script>
</body>
</html>
