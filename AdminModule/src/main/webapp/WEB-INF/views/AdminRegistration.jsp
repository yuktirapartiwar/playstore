<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Registration</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
<style>
body {
	background-color: #f0f2f5;
	font-family: Arial, sans-serif;
}

.container {
	margin-top: 50px;
}

.card {
	border-radius: 12px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.welcome-text {
	text-align: center;
	margin-bottom: 20px;
	font-size: 1.5rem;
}

        .prompt-text {
            color: #333; /* Neutral color */
            font-size: 1.2rem;
            margin-bottom: 20px;
            text-align: center;
        }

.form-label {
	font-weight: normal;
}

.btn-primary {
	background-color: #007bff;
	border: none;
}

.btn-primary:hover {
	background-color: #0056b3;
}

.footer {
	position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            text-align: center;
}
</style>
<script>
	function handleRoleChange(role) {
		if (role === 'User') {
			window.location.href = 'http://localhost:8082/user/register'; // Redirect to UserRegistration page
		}
	}
</script>
</head>
<body>

	<div class="container">
		<div class="welcome-text">
			<h1>PlayStore</h1>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<div class="card text-black">
					<div class="card-body p-4">
					
						<form action="/admin/register" method="post">

							<div class="mb-4">
								<label class="form-label me-2">Role</label>
								<div class="form-check form-check-inline">
									<input type="radio" id="admin" name="role" value="Admin"
										required onclick="handleRoleChange(this.value)" class="form-check-input" /> 
										<label class="form-check-label" for="admin">Admin</label> 
										</div>
										<div class="form-check form-check-inline">
										<input
										type="radio" id="user" name="role" value="User" required
										onclick="handleRoleChange(this.value)" class="form-check-input"/> <label
										class="form-check-label" for="user">User</label>
								</div>
							</div>
							
							<p class="prompt-text">Create a new Admin Account</p>

							<div class="mb-3">
								<label class="form-label" for="username">Username</label>
								<div class="input-group">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
									<input type="text" id="username" name="username"
										class="form-control" required />
								</div>
							</div>

							<div class="mb-3">
								<label class="form-label" for="email">Your Email</label>
								<div class="input-group">
									<span class="input-group-text"><i
										class="fas fa-envelope"></i></span> <input type="email" id="email"
										name="email" class="form-control" required />
								</div>
							</div>

							<div class="mb-3">
								<label class="form-label" for="password">Password</label>
								<div class="input-group">
									<span class="input-group-text"><i class="fas fa-lock"></i></span>
									<input type="password" id="password" name="password"
										class="form-control" required />
								</div>
							</div>

							<div class="d-flex justify-content-center">
								<button type="submit" class="btn btn-primary btn-lg">Register</button>
							</div>

						</form>

						<div class="text-center mt-3">
							<p>
								Already registered? <a href="/admin/login" class="text-primary">Login
									here</a>
							</p>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<p>&copy; 2024 PlayStore. All Rights Reserved.</p>
	</div>

</body>
</html>