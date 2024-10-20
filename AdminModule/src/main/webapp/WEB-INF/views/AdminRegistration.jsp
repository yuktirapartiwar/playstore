<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Admin Registration - PlayStore</title>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
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
			background-color: #007bff;
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
			background-color: #007bff;
			border: none;
			width: 100%;
			padding: 12px;
			font-size: 18px;
			font-weight: 600;
			margin-top: 20px;
		}
		.btn-primary:hover {
			background-color: #0056b3;
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
				<h2 class="mb-0">PlayStore Admin Registration</h2>
			</div>
			<div class="card-body">
				<% if (request.getAttribute("errorMessage") != null) { %>
					<div class="alert alert-danger" role="alert">
						<%= request.getAttribute("errorMessage") %>
					</div>
				<% } %>
				<form action="/admin/register" method="post">
					<div class="mb-3">
						<label for="username" class="form-label">Username</label>
						<div class="input-group">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
							<input type="text" id="username" name="username" class="form-control" required>
						</div>
					</div>
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
					<div class="mb-3">
						<label class="form-label">Role</label>
						<div class="form-check">
							<input type="radio" id="admin" name="role" value="Admin" required class="form-check-input" checked>
							<label class="form-check-label" for="admin">Admin</label>
						</div>
					</div>
					<button type="submit" class="btn btn-primary">Register</button>
				</form>
			</div>
		</div>
		<div class="footer">
			<p>Already have an account? <a href="/admin/login">Login here</a></p>
			<p>Are you a user? <a href="http://localhost:8082/user/register">Register as User</a></p>
		</div>
	</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
