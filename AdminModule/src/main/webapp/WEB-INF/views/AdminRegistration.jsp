<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Registration - PlayStore</title>
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
            background-color: var(--primary-color);  /* Using the same color as the button */
            padding: 2rem;
            color: white;
            width: 40%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        /* Add subtle pattern overlay */
        .login-sidebar::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: radial-gradient(circle at center, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 60%);
            pointer-events: none;
        }

        .login-main {
            padding: 2rem;
            width: 60%;
        }

        .login-logo {
            width: 80px;
            height: 80px;
            background-color: white;  /* Changed to white */
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .login-logo i {
            font-size: 40px;
            color: var(--primary-color);  /* Changed to match sidebar color */
        }

        .login-title {
            font-size: 2rem;
            font-weight: 600;
            color: white;
            margin-bottom: 1rem;
        }

        .login-subtitle {
            color: rgba(255, 255, 255, 0.95);  /* High contrast for readability */
            font-size: 1.1rem;
            line-height: 1.5;
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
                padding: 1.5rem;
            }
        }

        .form-card {
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 24px rgba(0, 0, 0, 0.08);
            padding: 1.5rem;
        }

        .form-label {
            font-weight: 500;
            color: #495057;
            margin-bottom: 0.5rem;
        }

        .form-control, .input-group-text {
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

        .btn-login {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 0.875rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
            width: 100%;
            margin-top: 1rem;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px rgba(26, 115, 232, 0.2);
        }

        .btn-login:hover {
            background-color: #1557b0;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(26, 115, 232, 0.3);
        }

        .register-link {
            text-align: center;
            margin-top: 1rem;
            color: #6c757d;
        }

        .register-link a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .register-link div {
            margin-top: 0.5rem;
            color: #6c757d;
        }

        .register-link div:first-child {
            margin-top: 0;
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
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-sidebar">
            <div class="login-logo">
                <i class="fas fa-user-plus"></i>
            </div>
            <h1 class="login-title">Create Account</h1>
            <p class="login-subtitle">Join PlayStore as an Admin</p>
        </div>

        <div class="login-main">
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-danger" role="alert">
                    <i class="fas fa-exclamation-circle"></i>
                    <span><%= request.getAttribute("errorMessage") %></span>
                </div>
            <% } %>

            <form action="/admin/register" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="fas fa-user"></i>
                        </span>
                        <input type="text" class="form-control" id="username" name="username" 
                               placeholder="Enter your username" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="fas fa-envelope"></i>
                        </span>
                        <input type="email" class="form-control" id="email" name="email" 
                               placeholder="Enter your email" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="fas fa-lock"></i>
                        </span>
                        <input type="password" class="form-control" id="password" name="password" 
                               placeholder="Enter your password" required>
                    </div>
                </div>

                <button type="submit" class="btn btn-login">
                    <i class="fas fa-user-plus me-2"></i>Create Account
                </button>
            </form>

            <div class="register-link">
                Already have an account? <a href="/admin/login">Sign in</a>
                <div class="mt-2">
                    Want to register as a user? <a href="/user/register">Register as User</a>
                </div>
            </div>
        </div>
    </div>

    <footer class="footer">
        <p class="mb-0">&copy; 2024 PlayStore. All Rights Reserved.</p>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
