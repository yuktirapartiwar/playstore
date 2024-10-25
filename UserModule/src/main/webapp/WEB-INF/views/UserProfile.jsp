<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.playstore.UserModule.model.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - PlayStore</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <style>
        :root {
            --primary-color: #1a73e8;
            --danger-color: #dc3545;
            --success-color: #28a745;
            --navbar-height: 60px;
        }

        body {
            background-color: #f8f9fa;
            min-height: 100vh;
            padding-top: var(--navbar-height);
        }

        /* Copy navbar styles from AdminProfile.jsp */
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

        .container {
            margin-top: 2rem;
        }

        .form-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .profile-icon {
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            background-color: rgba(26, 115, 232, 0.1);
        }

        .page-title {
            color: #333;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            font-weight: 500;
            color: #495057;
            margin-bottom: 0.5rem;
        }

        .form-control {
            padding: 0.75rem 1rem;
            border-radius: 8px;
            border: 1px solid #dee2e6;
            background-color: #f8f9fa;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(26,115,232,0.1);
            background-color: white;
        }

        .form-control[readonly] {
            background-color: #e9ecef;
            cursor: not-allowed;
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background-color: var(--primary-color);
            border: none;
        }

        .btn-primary:hover {
            background-color: #1557b0;
            transform: translateY(-1px);
        }

        .btn-danger {
            background-color: var(--danger-color);
            border: none;
        }

        .btn-danger:hover {
            background-color: #c82333;
            transform: translateY(-1px);
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }

        .alert {
            border-radius: 8px;
            margin-bottom: 1.5rem;
        }
    </style>
</head>
<body>
    <!-- Navbar with icons -->
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
                        <a class="nav-link" href="/user/home"><i class="fas fa-home me-1"></i>Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-mobile-alt me-1"></i>My Apps</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/user/profile"><i class="fas fa-user me-1"></i>Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/user/logout"><i class="fas fa-sign-out-alt me-1"></i>Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-4">
        <div class="form-card">
            <div class="d-flex align-items-center mb-4">
                <div class="profile-icon me-3">
                    <i class="fas fa-user-circle fa-3x text-primary"></i>
                </div>
                <div>
                    <% User user = (User)request.getSession(false).getAttribute("User"); %>
                    <h2 class="page-title mb-0">User Profile</h2>
                    <p class="text-muted mb-0">Manage your account information</p>
                </div>
            </div>

            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-danger" role="alert">
                    <i class="fas fa-exclamation-circle me-2"></i>
                    <%= request.getAttribute("errorMessage") %>
                </div>
            <% } %>

            <form id="profileForm" action="/user/profile/update" method="post">
                <div class="form-group">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" value="<%=user.getUsername()%>" readonly>
                </div>
                <div class="form-group">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%=user.getEmail()%>" readonly>
                </div>
                <div class="form-group">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" value="<%=user.getPassword()%>" readonly>
                </div>

                <div class="action-buttons">
                    <button type="button" class="btn btn-primary" id="editBtn">
                        <i class="fas fa-edit me-2"></i>Edit Profile
                    </button>
                    <button type="submit" class="btn btn-success" id="saveBtn" style="display:none;">
                        <i class="fas fa-save me-2"></i>Save Changes
                    </button>
                    <a href="/user/profile/delete" class="btn btn-danger">
                        <i class="fas fa-trash-alt me-2"></i>Delete Account
                    </a>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById('editBtn').addEventListener('click', function() {
            document.getElementById('email').readOnly = false;
            document.getElementById('password').readOnly = false;
            document.getElementById('editBtn').style.display = 'none';
            document.getElementById('saveBtn').style.display = 'block';
        });
    </script>
</body>
</html>
