<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.playstore.UserModule.DTO.ApplicationDTO"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Home - PlayStore</title>
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
            /* padding-top: var(--navbar-height); */
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
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 1rem;
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

        .navbar-brand, .nav-link {
            color: white !important;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #28a745;
            color: white;
            text-align: center;
            border-radius: 15px 15px 0 0;
            padding: 20px;
        }
        .card-body {
            padding: 30px;
        }
        .btn-primary {
            background-color: #28a745;
            border: none;
        }
        .btn-primary:hover {
            background-color: #218838;
        }
        .footer {
            text-align: center;
            margin-top: 50px;
            padding: 20px 0;
            background-color: #f8f9fa;
            color: #6c757d;
        }
        /* Keep existing styles from reference and add: */
        .app-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 1.5rem;
            padding: 1.5rem;
        }
        
        .app-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
            transition: transform 0.3s ease;
        }
        
        .app-card:hover {
            transform: translateY(-5px);
        }
        
        .app-icon {
            width: 80px;
            height: 80px;
            border-radius: 15px;
            object-fit: cover;
            margin: 0 auto 1rem;
            display: block;
        }
        
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
            margin-top: 0.5rem;
        }
        
        .app-rating .stars {
            display: inline-flex;
            align-items: center;
        }
        
        .app-rating .stars i {
            font-size: 0.9rem;
            margin-right: 1px;
        }
        
        .app-rating .rating-value {
            color: #6c757d;
            font-size: 0.9rem;
        }
       
        .search-box {
            display: flex;
            align-items: center;
            margin: 0 auto;
            border-radius: 8px;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }
        
        .search-input {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1rem;
            color: #333;
            background-color: #f8f9fa;
            transition: all 0.3s ease;
        }
        
        .search-input:focus {
            outline: none;
            border-color: var(--primary-color);
            background-color: white;
            box-shadow: 0 0 0 3px rgba(26, 115, 232, 0.1);
        }
        
        .main-content {
            height: calc(100vh - var(--navbar-height));
            width: 100%;
            padding: 2rem;
            background-color: #f8f9fa;
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .sidebar {
                display: none;
            }
            
            .main-content {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">PlayStore</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="mx-auto">
                    <div class="search-box">
                        <form action="/user/application/search" method="get" class="d-flex">
                            <input type="text" 
                                   name="query" 
                                   class="search-input" 
                                   placeholder="Search applications..." 
                                   required>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-search"></i>
                            </button>
                        </form>
                    </div>
                </div>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
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

    <!-- Add this after the navbar and before the main content
    <div class="page-container">
        Sidebar
        <div class="sidebar bg-white border-end">
            <div class="search-box">
                <form action="/user/application/search" method="get" class="d-flex">
                    <input type="text" 
                           name="query" 
                           class="search-input" 
                           placeholder="Search applications..." 
                           required>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
            </div> -->
            
            <!-- <div class="sidebar-menu">
                
                
                <div class="menu-section">
                    <div class="menu-title">CATEGORIES</div>
                    <ul class="menu-items">
                        <li class="<%= "Games".equals(request.getAttribute("selectedGenre")) ? "active" : "" %>">
                            <a href="/user/application/genre/Games" class="text-decoration-none">
                                <i class="fas fa-gamepad"></i>Games
                            </a>
                        </li>
                        <li class="<%= "Beauty".equals(request.getAttribute("selectedGenre")) ? "active" : "" %>">
                            <a href="/user/application/genre/Beauty" class="text-decoration-none">
                                <i class="fas fa-spa"></i>Beauty
                            </a>
                        </li>
                        <li class="<%= "Fashion".equals(request.getAttribute("selectedGenre")) ? "active" : "" %>">
                            <a href="/user/application/genre/Fashion" class="text-decoration-none">
                                <i class="fas fa-tshirt"></i>Fashion
                            </a>
                        </li>
                        <li class="<%= "Women".equals(request.getAttribute("selectedGenre")) ? "active" : "" %>">
                            <a href="/user/application/genre/Women" class="text-decoration-none">
                                <i class="fas fa-female"></i>Women
                            </a>
                        </li>
                        <li class="<%= "Health".equals(request.getAttribute("selectedGenre")) ? "active" : "" %>">
                            <a href="/user/application/genre/Health" class="text-decoration-none">
                                <i class="fas fa-heartbeat"></i>Health
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div> -->

        <!-- Main Content -->
        <div class="main-content">
            <div class="container mt-4">
                <div class="app-grid">
                    <% 
                    List<ApplicationDTO> applications = (List<ApplicationDTO>)request.getAttribute("applications");
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
                                        <% } else { %>
                                            <span class="text-muted small">No ratings</span>
                                        <% } %>
                                    </div>
                                </div>
                                <button class="details-btn">
                                    <i class="fas fa-info-circle me-2"></i>View Details
                                </button>
                            </div>
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

            <div class="footer">
                <p>&copy; 2024 PlayStore. All Rights Reserved.</p>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script>
    // function downloadApplication(url, applicationId) {
    //     // Open application URL in new tab
    //     window.open(url, '_blank');

    //     // Make AJAX call to increment download count
    //     fetch('/api/downloads/' + applicationId, {
    //         method: 'POST',
    //         headers: {
    //             'Content-Type': 'application/json'
    //         }
    //     })
    //     .then(response => {
    //         if (response.ok) {
    //             // Show success message
    //             const alertDiv = document.createElement('div');
    //             alertDiv.className = 'alert alert-success alert-dismissible fade show position-fixed top-0 start-50 translate-middle-x mt-3';
    //             alertDiv.innerHTML = `
    //                 <strong>Success!</strong> Download started successfully.
    //                 <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    //             `;
    //             document.body.appendChild(alertDiv);

    //             // Remove alert after 3 seconds
    //             setTimeout(() => {
    //                 alertDiv.remove();
    //             }, 3000);
    //         }
    //     })
    //     .catch(error => {
    //         console.error('Error:', error);
    //     });
    // }
    </script>
</body>
</html>
