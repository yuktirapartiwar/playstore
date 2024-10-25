<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login - PlayStore</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        :root {
            --primary-color: #1a73e8;
            --danger-color: #dc3545;
            --footer-height: 56px;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1.5rem;
            padding-bottom: calc(var(--footer-height) + 1.5rem);
        }

        .login-container {
            width: 100%;
            max-width: 900px;
            display: flex;
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 24px rgba(0, 0, 0, 0.08);
            overflow: hidden;
        }

        .login-sidebar {
            background-color: var(--primary-color);
            padding: 2rem;
            color: white;
            width: 40%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .login-main {
            padding: 2rem;
            width: 60%;
        }

        .login-logo {
            width: 80px;
            height: 80px;
            background-color: white;
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .login-logo i {
            font-size: 40px;
            color: var(--primary-color);
        }

        .login-title {
            font-size: 2rem;
            font-weight: 600;
            color: white;
            margin-bottom: 1rem;
        }

        .login-subtitle {
            color: rgba(255, 255, 255, 0.95);
            font-size: 1.1rem;
            line-height: 1.5;
        }

        .form-control {
            border-radius: 8px;
            padding: 0.625rem;
            border: 1px solid #e0e0e0;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(26, 115, 232, 0.1);
        }

        .form-label {
            font-weight: 500;
            color: #555;
        }

        .btn-primary {
            background-color: var(--primary-color);
            border: none;
            padding: 0.875rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
            width: 100%;
            margin-top: 1rem;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #1557b0;
            transform: translateY(-1px);
        }

        .alert {
            border-radius: 8px;
            margin-bottom: 1.5rem;
        }

        .register-link {
            text-align: center;
            margin-top: 1.5rem;
        }

        .register-link a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        /* Adjust responsive behavior */
        @media (max-width: 768px) {
            .login-container {
                flex-direction: column;
                max-width: 420px;
            }

            .login-sidebar {
                width: 100%;
                padding: 1.5rem;
            }

            .login-main {
                width: 100%;
            }
        }

        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            height: var(--footer-height);
            background-color: white;
            border-top: 1px solid #eee;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #6c757d;
            z-index: 1030;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-sidebar">
            <div class="login-logo">
                <i class="fas fa-user"></i>
            </div>
            <h1 class="login-title">Welcome Back!</h1>
            <p class="login-subtitle">Sign in to continue to PlayStore</p>
        </div>

        <div class="login-main">
            <!-- <h2 class="mb-4">Sign In</h2> -->
            
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-danger" role="alert">
                    <i class="fas fa-exclamation-circle me-2"></i>
                    <%= request.getAttribute("errorMessage") %>
                </div>
            <% } %>
            
            <% if (request.getAttribute("successMessage") != null) { %>
                <div class="alert alert-success" role="alert">
                    <i class="fas fa-check-circle me-2"></i>
                    <%= request.getAttribute("successMessage") %>
                </div>
            <% } %>

            <form action="/user/login" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-primary">Sign In</button>
            </form>

            <div class="register-link">
                <p>Don't have an account? <a href="/user/register">Register now</a></p>
                <p>Want to login as admin? <a href="/admin/login">Login as Admin</a></p>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <footer class="footer">
        <p class="mb-0">&copy; 2024 PlayStore. All rights reserved.</p>
    </footer>
</body>
</html>
