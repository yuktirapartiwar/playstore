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
        body { background-color: #f8f9fa; }
        .navbar { background-color: #007bff; }
        .card { border-radius: 15px; box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); }
        .card-header { background-color: #007bff; color: white; }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">PlayStore Admin</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/logout">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="card">
            <div class="card-header">
                <h2 class="mb-0">Applications List</h2>
            </div>
            <div class="card-body">
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="alert alert-danger" role="alert">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                <% } %>
                
                <% if (request.getAttribute("successMessage") != null) { %>
                    <div class="alert alert-success" role="alert">
                        <%= request.getAttribute("successMessage") %>
                    </div>
                <% } %>

                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Version</th>
                                <th>Genre</th>
                                <th>Release Date</th>
                                <th>Downloads</th>
                                <th>Status</th>
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
                                    <td><%= app.getName() %></td>
                                    <td><%= app.getVersion() %></td>
                                    <td><%= app.getGenre() %></td>
                                    <td><%= app.getReleaseDate() %></td>
                                    <td><%= app.getDownloadCount() %></td>
                                    <%-- <td>
                                        <span class="badge <%= app.isVisibility() ? "bg-success" : "bg-danger" %>">
                                            <%= app.isVisibility() ? "Visible" : "Hidden" %>
                                        </span>
                                    </td> --%>
                                    <td>
                                        <a href="/admin/application/edit/<%= app.getId() %>" class="btn btn-sm btn-primary">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="/admin/application/delete/<%= app.getId() %>" 
                                           class="btn btn-sm btn-danger" 
                                           onclick="return confirmDelete()"
                                           title="Delete Application">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            <%
                                }
                            } else {
                            %>
                                <tr>
                                    <td colspan="7" class="text-center">No applications found</td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script>
        function confirmDelete() {
            return confirm('Are you sure you want to delete this application? This action cannot be undone.');
        }
    </script>
</body>
</html>
