<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login - PlayStore</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .container {
            max-width: 500px;
            margin-top: 50px;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #28a745;
            color: white;
            text-align: center;
            border-radius: 15px 15px 0 0;
            padding: 20px;
        }
        .card-body {
            padding: 30px;
        }
        .form-label {
            font-weight: 600;
        }
        .btn-primary {
            background-color: #28a745;
            border: none;
            width: 100%;
            padding: 12px;
            font-size: 18px;
            font-weight: 600;
            margin-top: 20px;
        }
        .btn-primary:hover {
            background-color: #218838;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2 class="mb-0">PlayStore User Login</h2>
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
                <form action="/user/login" method="post">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                            <input type="email" id="email" name="email" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            <input type="password" id="password" name="password" class="form-control" required>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Login</button>
                </form>
            </div>
        </div>
        <div class="footer">
            <p>Don't have an account? <a href="/user/register">Register here</a></p>
            <p>Are you an admin? <a href="http://localhost:8081/admin/login">Login as Admin</a></p>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<<<<<<< Updated upstream
=======
    <script>
    document.getElementById('loginForm').addEventListener('submit', function(e) {
        e.preventDefault();
        
        const formData = new FormData(this);
        
        // First try the MVC endpoint
        fetch('/user/login', {
            method: 'POST',
            body: formData
        })
        .then(response => {
            if (response.redirected) {
                window.location.href = response.url;
                return Promise.reject('Redirected'); // Stop the chain
            }
            return response.json(); // Try to parse JSON response
        })
        .catch(error => {
            if (error === 'Redirected') return; // If redirected, stop here
            
            // If MVC endpoint failed, try the REST endpoint
            return fetch('/api/auth/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    email: document.getElementById('email').value,
                    password: document.getElementById('password').value
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.token) {
                    localStorage.setItem('jwtToken', data.token);
                    window.location.href = '/user/home';
                } else if (data.error) {
                    throw new Error(data.error);
                }
            });
        })
        .catch(error => {
            if (error === 'Redirected') return; // Ignore redirected "error"
            console.error('Error:', error);
            alert('Invalid email or password');
        });
    });
    </script>
>>>>>>> Stashed changes
</body>
</html>
