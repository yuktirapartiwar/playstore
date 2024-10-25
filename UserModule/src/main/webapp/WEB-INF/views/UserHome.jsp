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
        
        .download-btn {
            width: 100%;
            background-color: #28a745;
            border: none;
            padding: 0.5rem;
            border-radius: 8px;
            color: white;
            font-weight: 500;
            transition: background-color 0.3s ease;
        }
        
        .download-btn:hover {
            background-color: #218838;
            color: white;
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
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">My Apps</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Browse</a>
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

    <div class="container mt-4">
        <h2 class="mb-4">Featured Applications</h2>
        
        <div class="app-grid">
            <% 
            List<ApplicationDTO> applications = (List<ApplicationDTO>)request.getAttribute("applications");
            if (applications != null && !applications.isEmpty()) {
                for (ApplicationDTO app : applications) {
            %>
                <div class="app-card">
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
                                <i class="fas fa-star text-warning"></i>
                                <span>4.5</span>
                            </div>
                        </div>
                        <button class="download-btn">
                            <i class="fas fa-download me-2"></i>Download
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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
