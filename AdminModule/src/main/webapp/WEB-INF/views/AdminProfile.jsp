<%@page import="com.playstore.AdminModule.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Profile</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
</head>
<body>
<div class="container my-5">
        <h1 class="text-center">Profile</h1>

        <form id="profileForm" action="/admin/profile/update" method="post">
        <% Admin admin =(Admin)request.getSession(false).getAttribute("Admin") ;%>
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" value="<%=admin.getUsername()%>" readonly>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="<%=admin.getEmail()%>" readonly>
            </div>
            <div class="mb-3">
                <label for="role" class="form-label">Role</label>
                <input type="text" class="form-control" id="role" name="role" value="<%=admin.getRole()%>" readonly>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" value="<%=admin.getPassword()%>" readonly>
            </div>

            <button type="button" class="btn btn-primary" id="editBtn">Edit</button>
            <button type="submit" class="btn btn-success" id="saveBtn" style="display:none;">Save</button>
            
        </form>
        <a href="/admin/profile/delete" class="btn btn-danger">Delete</a>
    </div>

    <script>
        document.getElementById("editBtn").onclick = function() {
            // Enable all inputs for editing
            document.getElementById("username").removeAttribute("readonly");
            document.getElementById("email").removeAttribute("readonly");
            document.getElementById("password").removeAttribute("readonly");

            // Hide Edit button and show Save button
            document.getElementById("editBtn").style.display = "none";
            document.getElementById("saveBtn").style.display = "inline-block";
        };
    </script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>