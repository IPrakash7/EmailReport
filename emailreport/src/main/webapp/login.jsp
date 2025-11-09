<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="db.jsp" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow-lg rounded-3">
                <div class="card-header bg-primary text-white text-center">
                    <h3> Login</h3>
                </div>
                <div class="card-body">
                    <form action="loginaction.jsp" method="post">
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" class="form-control" name="password" required>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Login</button>
                        </div>
                    </form>
                    <div class="text-center mt-3">
                        <p>Don't have an account? <a href="register.jsp">Register here</a></p>
                    </div>
                    <%
                        String msg = request.getParameter("msg");
                        if ("invalid".equals(msg)) {
                            out.println("<p class='text-danger text-center mt-2'> Invalid Credentials</p>");
                        } else if ("success".equals(msg)) {
                            out.println("<p class='text-success text-center mt-2'> Registered Successfully! Please Login.</p>");
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
