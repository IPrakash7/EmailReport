<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="db.jsp" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Emails</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-primary"> All Emails</h2>
        <a href="charts.jsp" class="btn btn-warning"> View Charts</a>
    </div>

    <div class="card shadow-lg rounded-3">
        <div class="card-body">
            <table class="table table-striped table-hover table-bordered align-middle">
                <thead class="table-dark text-center">
                    <tr>
                        <th>ID</th>
                        <th>Sender</th>
                        <th>Receiver</th>
                        <th>Subject</th>
                        <th>Body</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM EMAILS ORDER BY SENT_DATE DESC");
                    boolean hasData = false;
                    while (rs.next()) {
                        hasData = true;
                %>
                    <tr>
                        <td class="text-center"><%= rs.getInt("EMAIL_ID") %></td>
                        <td><%= rs.getString("SENDER") %></td>
                        <td><%= rs.getString("RECEIVER") %></td>
                        <td><strong><%= rs.getString("SUBJECT") %></strong></td>
                        <td><%= rs.getString("BODY") %></td>
                        <td><%= rs.getDate("SENT_DATE") %></td>
                    </tr>
                <%
                    }
                    if (!hasData) {
                %>
                    <tr>
                        <td colspan="6" class="text-center text-muted">No emails found.</td>
                    </tr>
                <%
                    }
                    con.close();
                %>
                </tbody>
            </table>
        </div>
    </div>

    <div class="text-center mt-3">
        <a href="welcome.jsp" class="btn btn-outline-primary"> Back to Home</a>
    </div>
</div>

</body>
</html>
