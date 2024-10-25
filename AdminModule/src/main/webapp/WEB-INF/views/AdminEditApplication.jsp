<%@page import="com.playstore.AdminModule.DTO.ApplicationDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Application - PlayStore Admin</title>
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
            background-color: #f8f9fa;
            min-height: 100vh;
            padding-top: var(--navbar-height);
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
        }

        .form-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .page-title {
            color: #333;
            font-weight: 600;
        }

        .form-label {
            font-weight: 500;
            color: #555;
            margin-bottom: 0.5rem;
        }

        .required-field::after {
            content: "*";
            color: var(--danger-color);
            margin-left: 4px;
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

        .app-icon {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            background-color: rgba(26, 115, 232, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .app-icon i {
            font-size: 24px;
            color: var(--primary-color);
        }

        .form-switch {
            padding-left: 2.5rem;
        }

        .form-check-input {
            width: 2.5rem;
            height: 1.25rem;
            cursor: pointer;
            margin-left: 0;
        }

        .form-check-input:checked {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .form-check-label {
            cursor: pointer;
            padding-left: 0.5rem;
        }
    </style>
</head>
<body>
    <% ApplicationDTO app = (ApplicationDTO)request.getAttribute("application"); %>
    
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

    <!-- Main Content -->
    <div class="container mt-4">
        <div class="form-card">
            <div class="d-flex align-items-center mb-4">
                <div class="app-icon me-3">
                    <i class="fas fa-mobile-alt"></i>
                </div>
                <div>
                    <h2 class="page-title mb-0">Edit Application</h2>
                    <p class="text-muted mb-0">Update application information</p>
                </div>
            </div>

            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-danger" role="alert">
                    <%= request.getAttribute("errorMessage") %>
                </div>
            <% } %>

            <form action="/admin/application/edit/<%= app.getId() %>" method="post">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="name" class="form-label required-field">Name</label>
                        <input type="text" class="form-control" id="name" name="name" 
                               value="<%= app.getName() %>" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="genre" class="form-label required-field">Genre</label>
                        <input type="text" class="form-control" id="genre" name="genre" 
                               value="<%= app.getGenre() %>" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="description" class="form-label required-field">Description</label>
                    <textarea class="form-control" id="description" name="description" 
                              rows="4" required><%= app.getDescription() %></textarea>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="version" class="form-label required-field">Version</label>
                        <input type="text" class="form-control" id="version" name="version" 
                               value="<%= app.getVersion() %>" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="releaseDate" class="form-label required-field">Release Date</label>
                        <input type="date" class="form-control" id="releaseDate" name="releaseDate" 
                               value="<%= app.getReleaseDate() %>" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="url" class="form-label required-field">Download URL</label>
                    <input type="url" class="form-control" id="url" name="url" 
                           value="<%= app.getUrl() %>" required>
                </div>

                <div class="mb-3">
                    <label for="logoUrl" class="form-label required-field">Logo URL</label>
                    <input type="url" class="form-control" id="logoUrl" name="logoUrl" 
                           value="<%= app.getLogoUrl() %>" required>
                    <div class="form-text">Direct URL to the application logo</div>
                    <% if (app.getLogoUrl() != null) { %>
                        <img src="<%= app.getLogoUrl() %>" 
                             alt="Current Logo" 
                             class="mt-2"
                             style="width: 100px; height: 100px; object-fit: cover; border-radius: 12px;"
                             onerror="this.style.display='none'">
                    <% } %>
                </div>

                <div class="mb-3">
                    <label for="visibility" class="form-label">Visibility</label>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" 
                               id="visibility" name="visibility" 
                               <%= app.getVisibility() ? "checked" : "" %>>
                        <label class="form-check-label" for="visibility">
                            <span class="text-success" id="visibilityStatus">
                                <%= app.getVisibility() ? "Visible" : "Hidden" %>
                            </span>
                        </label>
                    </div>
                    <div class="form-text">Toggle to control application visibility in the store</div>
                </div>

                <input type="hidden" name="ownerId" value="<%= app.getOwnerId() %>">
                <input type="hidden" name="downloadCount" value="<%= app.getDownloadCount() %>">

                <div class="d-flex justify-content-end mt-4">
                    <a href="/admin/application/list" class="btn btn-cancel">Cancel</a>
                    <button type="submit" class="btn btn-submit">
                        <i class="fas fa-save me-2"></i>Update Application
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script>
        // Update visibility status text when toggle changes
        document.getElementById('visibility').addEventListener('change', function() {
            const statusElement = document.getElementById('visibilityStatus');
            if (this.checked) {
                statusElement.textContent = 'Visible';
                statusElement.className = 'text-success';
            } else {
                statusElement.textContent = 'Hidden';
                statusElement.className = 'text-danger';
            }
        });
    </script>
</body>
</html>
