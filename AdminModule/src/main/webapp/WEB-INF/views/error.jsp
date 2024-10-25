<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <div class="card">
            <div class="card-header">
                <h2 class="mb-0">An error occurred</h2>
            </div>
            <div class="card-body">
                <h5 class="card-title text-danger">
                    <%= request.getAttribute("errorTitle") != null ? 
                        request.getAttribute("errorTitle") : "An unexpected error occurred" %>
                </h5>
                <p class="card-text">
                    <%= request.getAttribute("errorMessage") != null ? 
                        request.getAttribute("errorMessage") : "Please try again later." %>
                </p>
                <p class="card-text">
                    <small class="text-muted">
                        Requested URL: <%= request.getAttribute("path") != null ? 
                            request.getAttribute("path") : request.getRequestURI() %>
                    </small>
                </p>
                <a href="/admin/home" class="btn btn-primary">
                    <i class="fas fa-home"></i> Return to Home
                </a>
            </div>
        </div>
    </div>
</body>
</html>
