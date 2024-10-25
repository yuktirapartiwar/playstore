<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
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
</style>
</head>
<body>
    <div class="container mt-5">
        <h1>An error occurred</h1>
        <p><%= request.getAttribute("exception") %></p>
        <p>Requested URL: <%= request.getAttribute("url") %></p>
        <a href="javascript:history.back()" class="btn btn-primary">Go Back</a>
    </div>
</body>
</html>
