<%@page import="com.playstore.AdminModule.DTO.ApplicationDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Applications - PlayStore Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <style>
        /* Root Variables */
        :root {
            --primary-color: #1a73e8;
            --secondary-color: #34a853;
            --danger-color: #ea4335;
            --warning-color: #fbbc05;
            --navbar-height: 60px;
            --footer-height: 56px;
            --sidebar-width: 250px;
        }

        /* Base Layout Styles */
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            overflow-x: hidden;
        }

        .page-container {
            padding-top: var(--navbar-height);
            min-height: calc(100vh - var(--navbar-height));
            display: flex;
        }

        /* Navbar Styles */
        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: var(--navbar-height);
            background-color: var(--primary-color);
            padding: 0.5rem 1rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            z-index: 1030;
        }

        /* Sidebar Styles */
        .sidebar {
            position: fixed;
            top: var(--navbar-height);
            left: 0;
            width: var(--sidebar-width);
            height: calc(100vh - var(--navbar-height) - var(--footer-height));
            overflow-y: auto;
            display: none;  /* Hide on mobile */
        }

        .search-box {
            padding: 1.25rem 1rem;
            border-bottom: 1px solid #eee;
        }

        .search-input {
            width: 100%;
            padding: 0.5rem 1rem;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 0.9rem;
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

        .search-input::placeholder {
            color: #999;
            font-size: 0.9rem;
        }

        .sidebar-menu {
            padding: 1rem 0;
        }

        .menu-title {
            padding: 0 1rem;
            margin-bottom: 0.5rem;
            font-size: 0.8rem;
            font-weight: 600;
            text-transform: uppercase;
            color: #666;
        }

        .menu-items {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .menu-items li {
            padding: 0.5rem 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            color: #333;
        }

        .menu-items li:hover {
            background-color: #f8f9fa;
            color: var(--primary-color);
        }

        .menu-items li i {
            width: 20px;
            margin-right: 10px;
            font-size: 1rem;
        }

        /* Main Content Styles */
        .main-content {
            flex: 1;
            margin-left: var(--sidebar-width);
            padding: 2rem;
            background-color: #f8f9fa;
        }

        /* Table Styles */
        .table-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
            margin-bottom: 2rem;
        }

        .table {
            margin-bottom: 0;
        }

        .table thead th {
            background-color: #f8f9fa;
            border-bottom: 2px solid #e9ecef;
            color: #495057;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            padding: 1rem;
            text-align: center; /* Center align headers */
        }

        .table tbody td {
            padding: 1rem;
            vertical-align: middle;
            color: #333;
            border-bottom: 1px solid #e9ecef;
            text-align: center; /* Center align all data */
        }

        .table tbody tr:last-child td {
            border-bottom: none;
        }

        .table tbody tr:hover {
            background-color: #f8f9fa;
        }

        /* App Name Column */
        .app-name {
            font-weight: 500;
            color: var(--primary-color);
        }

        /* Rating Stars */
        .rating {
            display: flex;
            align-items: center;
            justify-content: center; /* Center the rating container */
            gap: 0.5rem;
        }

        .stars {
            color: var(--warning-color);
        }

        /* Visibility Toggle */
        .form-switch {
            padding-left: 2.5rem;
            display: flex;
            justify-content: center; /* Center the switch */
        }

        .form-check-input {
            width: 2.5rem;
            height: 1.25rem;
            cursor: pointer;
            margin-left: 0; /* Reset margin for better centering */
        }

        .form-check-input:checked {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        /* Action Buttons */
        .action-buttons {
            display: flex;
            gap: 0.5rem;
            justify-content: center; /* Center the action buttons */
        }

        .btn-action {
            width: 32px;
            height: 32px;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .btn-action:hover {
            transform: translateY(-2px);
        }

        .download-count {
            font-weight: 500;
            color: var(--secondary-color);
            display: flex;
            align-items: center;
            justify-content: center; /* Center download count and icon */
            gap: 0.5rem;
        }

        .genre-badge {
            background-color: #e9ecef;
            color: #495057;
            padding: 0.4rem 0.8rem;
            border-radius: 6px;
            font-size: 0.85rem;
            font-weight: 500;
            display: inline-block; /* Helps with centering */
        }

        /* Add New Application Button */
        .btn-add {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 0.625rem 1.25rem;
            border-radius: 8px;
            font-size: 0.95rem;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .btn-add:hover {
            background-color: #1557b0;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
        }

        /* Responsive Design */
        @media (max-width: 991px) {
            .sidebar {
                display: none;
            }

            .main-content {
                margin-left: 0;
            }
        }

        .navbar-brand {
            font-size: 1.25rem;
            font-weight: 500;
        }

        .navbar-dark .navbar-nav .nav-link {
            color: rgba(255,255,255,0.9) !important;
        }
    </style>
</head>
<body>
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
                <!-- Desktop Menu -->
                <ul class="navbar-nav ms-auto d-none d-lg-flex">
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/home"><i class="fas fa-home me-1"></i>Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/application/list"><i class="fas fa-mobile-alt me-1"></i>Applications</a>
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

    <div class="page-container">
        <!-- Sidebar -->
        <div class="sidebar d-none d-lg-block">
            <div class="search-box">
                <input type="text" class="search-input" placeholder="Search applications...">
            </div>
            <div class="sidebar-menu">
                <div class="menu-title">Categories</div>
                <ul class="menu-items">
                    <li>
                        <i class="fas fa-gamepad"></i>Games
                    </li>
                    <li>
                        <i class="fas fa-spa"></i>Beauty
                    </li>
                    <li>
                        <i class="fas fa-tshirt"></i>Fashion
                    </li>
                    <li>
                        <i class="fas fa-female"></i>Women
                    </li>
                    <li>
                        <i class="fas fa-heartbeat"></i>Health
                    </li>
                </ul>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Add New Application Button -->
            <div class="d-flex justify-content-end mb-4">
                <a href="/admin/application/add" class="btn btn-add">
                    <i class="fas fa-plus-circle me-2"></i>Add New Application
                </a>
            </div>

            <!-- Applications Table -->
            <div class="table-card">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Application</th>
                                <th>Version</th>
                                <th>Genre</th>
                                <th>Release Date</th>
                                <th>Downloads</th>
                                <th>Rating</th>
                                <th>Visibility</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                            List<ApplicationDTO> applications = (List<ApplicationDTO>)request.getAttribute("applications");
                            if (applications != null && !applications.isEmpty()) {
                                for (ApplicationDTO app : applications) {
                            %>
                                <tr>
                                    <td>
                                        <span class="app-name"><%= app.getName() %></span>
                                    </td>
                                    <td><%= app.getVersion() %></td>
                                    <td><span class="genre-badge"><%= app.getGenre() %></span></td>
                                    <td><%= app.getReleaseDate() %></td>
                                    <td>
                                        <span class="download-count">
                                            <i class="fas fa-download"></i>
                                            <%= String.format("%,d", app.getDownloadCount()) %>
                                        </span>
                                    </td>
                                    <td>
                                        <div class="rating">
                                            <span>5.0</span>
                                            <div class="stars">
                                                <i class="fas fa-star"></i>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" 
                                                   id="visibility_<%= app.getId() %>" 
                                                   <%= app.getVisibility() ? "checked" : "" %>
                                                   onchange="updateVisibility(<%= app.getId() %>, this.checked)">
                                        </div>
                                    </td>
                                    <td>
                                        <div class="action-buttons">
                                            <a href="/admin/application/edit/<%= app.getId() %>" 
                                               class="btn btn-action btn-primary" 
                                               title="Edit Application">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <a href="/admin/application/delete/<%= app.getId() %>" 
                                               class="btn btn-action btn-danger" 
                                               onclick="return confirmDelete()"
                                               title="Delete Application">
                                                <i class="fas fa-trash"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            <%
                                }
                            } else {
                            %>
                                <tr>
                                    <td colspan="8" class="text-center py-4">
                                        <div class="d-flex flex-column align-items-center">
                                            <i class="fas fa-box-open fa-3x text-muted mb-3"></i>
                                            <h5 class="text-muted">No applications found</h5>
                                            <p class="text-muted">Add your first application to get started</p>
                                        </div>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
