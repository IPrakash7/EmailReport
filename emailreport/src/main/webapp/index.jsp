<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Email Management and Visualization</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background: linear-gradient(135deg, #007bff, #00c6ff);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .welcome-card {
        background: white;
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.2);
        text-align: center;
        max-width: 600px;
        width: 100%;
    }
</style>
</head>
<body>

<div class="welcome-card">
    <h1 class="text-primary fw-bold"> Email Management and Visualization</h1>
    <p class="text-muted mb-4">Manage, store, and visualize your emails with ease!</p>
    
    <div class="d-grid gap-3">
        <a href="login.jsp" class="btn btn-primary btn-lg"> Login</a>
        <a href="register.jsp" class="btn btn-success btn-lg"> Register</a>
    </div>
</div>

</body>
</html>
