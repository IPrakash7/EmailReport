<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<%
    // Check if user is logged in
    String userName = (String) session.getAttribute("userName");
    if (userName == null) {
        // Redirect to login if no session
        response.sendRedirect("login.jsp?msg=loginFirst");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Email Management and Visualization</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

    <!-- Welcome Message -->
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center">
            <h4 class="text-success"> Welcome, <%= userName %>!</h4>
            <a href="logout.jsp" class="btn btn-outline-danger btn-sm"> Logout</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container mt-5">
        <div class="text-center mb-4">
            <h1 class="text-primary"> Email Management and Visualization</h1>
            <p class="text-muted">Manage, view, and visualize emails stored in Oracle DB</p>
        </div>

        <!-- First Row -->
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card shadow-lg rounded-3 mb-4">
                    <div class="card-body text-center">
                        <h4 class="card-title">Add Email</h4>
                        <p class="card-text">Insert a new email into the database.</p>
                        <a href="addemail.html" class="btn btn-success"> Add Email</a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card shadow-lg rounded-3 mb-4">
                    <div class="card-body text-center">
                        <h4 class="card-title">View Emails</h4>
                        <p class="card-text">Check all emails with details.</p>
                        <a href="viewemail.jsp" class="btn btn-primary"> View Emails</a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card shadow-lg rounded-3 mb-4">
                    <div class="card-body text-center">
                        <h4 class="card-title">Visualize Emails</h4>
                        <p class="card-text">See charts of emails by sender.</p>
                        <a href="charts.jsp" class="btn btn-warning"> View Charts</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Second Row -->
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card shadow-lg rounded-3 mb-4">
                    <div class="card-body text-center">
                        <h4 class="card-title">Visualize Email Content</h4>
                        <p class="card-text">Search and analyze email content.</p>
                        <a href="searchdata.jsp" class="btn btn-secondary"> View Contents</a>
                    </div>
                </div>
            </div>
        
            <div class="col-md-4">
                <div class="card shadow-lg rounded-3 mb-4">
                    <div class="card-body text-center">
                        <h4 class="card-title">Visualize Email Subject</h4>
                        <p class="card-text">Search and analyze email Subject.</p>
                        <a href="searchsubject.jsp" class="btn btn-danger"> View Contents</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-lg rounded-3 mb-4">
                    <div class="card-body text-center">
                        <h4 class="card-title">Visualize Date Wise Email</h4>
                        <p class="card-text">Date Wise Email</p>
                        <a href="analysis.jsp" class="btn btn-success"> View Analysis</a>
                    </div>
                </div>
            </div>
        </div>
   </div> 
</body>
</html>
