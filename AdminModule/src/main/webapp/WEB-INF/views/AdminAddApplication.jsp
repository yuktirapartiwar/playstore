<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Application - PlayStore Admin</title>
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
    background-color: #f8f9fa;
    min-height: 100vh;
    padding-bottom: var(--footer-height);
    position: relative;
}

.navbar {
    background-color: var(--primary-color);
    padding: 0.5rem 1rem;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.page-title {
    color: #333;
    margin-bottom: 1.5rem;
    font-weight: 600;
}

.form-card {
    background: white;
    border-radius: 15px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    padding: 2rem;
    margin-bottom: 2rem;
}

.form-label {
    font-weight: 500;
    color: #555;
    margin-bottom: 0.5rem;
}

.form-control {
    border-radius: 8px;
    border: 1px solid #e0e0e0;
    padding: 0.625rem;
    transition: all 0.3s ease;
}

.form-control:focus {
    border-color: var(--primary-color);
    box-shadow: 0 0 0 3px rgba(26, 115, 232, 0.1);
}

.btn-submit {
    background-color: var(--primary-color);
    color: white;
    border: none;
    padding: 0.625rem 1.25rem;
    border-radius: 8px;
    font-weight: 500;
    transition: all 0.3s ease;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.btn-submit:hover {
    background-color: #1557b0;
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.15);
}

.btn-cancel {
    background-color: #f8f9fa;
    color: #333;
    border: 1px solid #ddd;
    padding: 0.625rem 1.25rem;
    border-radius: 8px;
    font-weight: 500;
    transition: all 0.3s ease;
    margin-right: 1rem;
}

.btn-cancel:hover {
    background-color: #e9ecef;
    border-color: #ccc;
}

.footer {
    position: absolute;
    bottom: 0;
    width: 100%;
    height: var(--footer-height);
    background-color: white;
    border-top: 1px solid #eee;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #6c757d;
}

.required-field::after {
    content: "*";
    color: var(--danger-color);
    margin-left: 4px;
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

<!-- Main Content -->
<div class="container mt-4">
    <h2 class="page-title">Add New Application</h2>
    
    <div class="form-card">
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="alert alert-danger" role="alert">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>

        <form action="/admin/application/add" method="post" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="name" class="form-label required-field">Application Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="version" class="form-label required-field">Version</label>
                    <input type="text" class="form-control" id="version" name="version" required>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="genre" class="form-label required-field">Genre</label>
                    <select class="form-control" id="genre" name="genre" required>
                        <option value="">Select Genre</option>
                        <option value="Games">Games</option>
                        <option value="Education">Education</option>
                        <option value="Business">Business</option>
                        <option value="Lifestyle">Lifestyle</option>
                        <option value="Entertainment">Entertainment</option>
                        <option value="Social">Social</option>
                        <option value="Productivity">Productivity</option>
                    </select>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="releaseDate" class="form-label required-field">Release Date</label>
                    <input type="date" class="form-control" id="releaseDate" name="releaseDate" required>
                </div>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label required-field">Description</label>
                <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
            </div>

            <div class="mb-3">
                <label for="appFile" class="form-label required-field">Application File</label>
                <input type="file" class="form-control" id="appFile" name="appFile" accept=".apk,.ipa" required>
            </div>

            <div class="mb-3">
                <label for="appIcon" class="form-label required-field">Application Icon</label>
                <input type="file" class="form-control" id="appIcon" name="appIcon" accept="image/*" required>
            </div>

            <div class="mb-3">
                <label for="screenshots" class="form-label">Screenshots (Max 5)</label>
                <input type="file" class="form-control" id="screenshots" name="screenshots" accept="image/*" multiple>
            </div>

            <div class="mt-4">
                <a href="/admin/application/list" class="btn btn-cancel">Cancel</a>
                <button type="submit" class="btn btn-submit">
                    <i class="fas fa-plus-circle me-2"></i>Add Application
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <p class="mb-0">&copy; 2024 PlayStore. All Rights Reserved.</p>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>
    // Preview uploaded images
    document.getElementById('appIcon').addEventListener('change', function(e) {
        // Add preview logic if needed
    });

    document.getElementById('screenshots').addEventListener('change', function(e) {
        if (e.target.files.length > 5) {
            alert('You can only upload a maximum of 5 screenshots');
            e.target.value = '';
        }
    });
</script>
</body>
</html>