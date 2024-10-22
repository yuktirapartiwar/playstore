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
    <div class="container mt-5">
        <h1>An error occurred</h1>
        <p>${exception}</p>
        <p>Requested URL: ${url}</p>
        <a href="javascript:history.back()" class="btn btn-primary">Go Back</a>
    </div>
</body>
</html>
