<%@page import="com.playstore.AdminModule.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Profile - PlayStore</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <!-- Styles for the admin profile page -->
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
<!-- Navigation bar for admin pages -->
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">PlayStore Admin</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Applications</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Updates</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/admin/profile">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/logout">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Admin profile information card -->
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2 class="mb-0">Admin Profile</h2>
            </div>
            <!-- Form for displaying and editing admin profile information -->
            <div class="card-body">
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="alert alert-danger" role="alert">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                <% } %>
                <form id="profileForm" action="/admin/profile/update" method="post">
                    <% Admin admin = (Admin)request.getSession(false).getAttribute("Admin"); %>
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" name="username" value="<%=admin.getUsername()%>" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="<%=admin.getEmail()%>" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="role" class="form-label">Role</label>
                        <input type="text" class="form-control" id="role" name="role" value="<%=admin.getRole()%>" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" value="<%=admin.getPassword()%>" readonly>
                    </div>
                    <!-- Buttons for editing and saving profile information -->
                    <div class="d-flex justify-content-between">
                        <button type="button" class="btn btn-primary" id="editBtn">Edit Profile</button>
                        <button type="submit" class="btn btn-success" id="saveBtn" style="display:none;">Save Changes</button>
                    </div>
                </form>
                <!-- Button for deleting the admin account -->
                <div class="mt-3">
                    <a href="/admin/profile/delete" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete your account? This action cannot be undone.')">Delete Account</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer section -->
    <div class="footer">
        <p>&copy; 2024 PlayStore. All Rights Reserved.</p>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <!-- JavaScript for handling profile editing functionality -->
    <!-- <script>
        const form = document.getElementById('profileForm');
        const editBtn = document.getElementById('editBtn');
        const saveBtn = document.getElementById('saveBtn');
        const inputs = form.querySelectorAll('input:not([name="role"])');

        editBtn.addEventListener('click', function() {
            inputs.forEach(input => input.removeAttribute('readonly'));
            editBtn.style.display = 'none';
            saveBtn.style.display = 'block';
        });

        form.addEventListener('submit', function(e) {
            if (!confirm('Are you sure you want to save these changes?')) {
                e.preventDefault();
            }
        });
    </script> -->
    <script>
        document.getElementById("editBtn").onclick = function() {
            document.getElementById("username").removeAttribute("readonly");
            document.getElementById("email").removeAttribute("readonly");
            document.getElementById("password").removeAttribute("readonly");
            document.getElementById("editBtn").style.display = "none";
            document.getElementById("saveBtn").style.display = "inline-block";
        };
    </script> 
</body>
</html>
