<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home - PlayStore</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <!-- Styles for the admin home page -->
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .navbar {
            background-color: #007bff;
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
            background-color: #007bff;
            color: white;
            text-align: center;
            border-radius: 15px 15px 0 0;
            padding: 20px;
        }
        .card-body {
            padding: 30px;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .footer {
            text-align: center;
            margin-top: 50px;
            padding: 20px 0;
            background-color: #f8f9fa;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <!-- Navigation bar for admin pages -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">PlayStore Admin</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- Collapsible navigation menu -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/application/list">Applications</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Updates</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/profile">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/logout">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <!-- Welcome message card -->
        <div class="card">
            <div class="card-header">
                <h2 class="mb-0">Welcome, Admin!</h2>
            </div>
            <!-- Dashboard content card -->
            <div class="card-body">
                <h5 class="card-title">Admin Dashboard</h5>
                <p class="card-text">Here you can manage applications, updates, and user accounts.</p>
                <div class="d-flex gap-2">
                    <a href="/admin/applications" class="btn btn-primary">
                        <i class="fas fa-list"></i> Manage Applications
                    </a>
                    <a href="/admin/application/add" class="btn btn-success">
                        <i class="fas fa-plus"></i> Add Application
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer section -->
    <div class="footer">
        <p>&copy; 2024 PlayStore. All Rights Reserved.</p>
    </div>

    <!-- Bootstrap JS bundle -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
