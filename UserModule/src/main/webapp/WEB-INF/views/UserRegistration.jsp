<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration - PlayStore</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <style>
        :root {
            --primary-color: #1a73e8;
            --secondary-color: #34a853;
            --danger-color: #ea4335;
            --warning-color: #fbbc05;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1.5rem;
            padding-bottom: calc(56px + 1.5rem);
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

        .form-label {
            font-weight: 500;
            color: #495057;
            margin-bottom: 0.5rem;
        }

        .form-control {
            padding: 0.625rem 1rem;
            border-radius: 8px;
            border: 1.5px solid #dee2e6;
            background-color: #f8f9fa;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(26, 115, 232, 0.1);
            background-color: white;
        }

        .btn-primary {
            background-color: var(--primary-color);
            border: none;
            padding: 0.75rem 1.5rem;
            font-weight: 500;
            width: 100%;
            margin-top: 1rem;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px rgba(26, 115, 232, 0.2);
        }

        .btn-primary:hover {
            background-color: #1557b0;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(26, 115, 232, 0.3);
        }

        .alert {
            border-radius: 8px;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 1rem;
        }

        .alert i {
            font-size: 1.25rem;
        }

        .footer {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 56px;
            background-color: white;
            border-top: 1px solid #eee;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #6c757d;
            z-index: 10;
        }

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
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-sidebar">
            <div class="login-logo">
                <i class="fas fa-user-plus"></i>
            </div>
            <h1 class="login-title">Create Account</h1>
            <p class="login-subtitle">Join PlayStore as a User</p>
        </div>

        <div class="login-main">
            <h2 class="mb-4">Sign Up</h2>
            
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-danger" role="alert">
                    <i class="fas fa-exclamation-circle"></i>
                    <span><%= request.getAttribute("errorMessage") %></span>
                </div>
            <% } %>

            <form action="/user/register" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-primary">Create Account</button>
            </form>

            <div class="mt-4 text-center">
                <p>Already have an account? <a href="/user/login">Sign In</a></p>
                <p>Want to register as admin? <a href="/admin/register">Register as Admin</a></p>
            </div>
        </div>
    </div>

    <footer class="footer">
        <p class="mb-0">&copy; 2024 PlayStore. All rights reserved.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
