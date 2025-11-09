<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Email Save Result</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow-lg rounded-3">
                <div class="card-body text-center">
                    <%
                        int sl=0;
                        String sender = request.getParameter("sender");
                        String receiver = request.getParameter("receiver");
                        String subject = request.getParameter("subject");
                        String body = request.getParameter("body");
                        PreparedStatement ps1 = con.prepareStatement("select email_id from emails order by email_id desc");
                        ResultSet rs=ps1.executeQuery();
                        if (rs.next())
                        	sl=rs.getInt(1)+1;
                        else
                        	sl=1;
                        PreparedStatement ps = con.prepareStatement(
                                "INSERT INTO EMAILS (email_id,SENDER, RECEIVER, SUBJECT, BODY, SENT_DATE) VALUES (?,?, ?, ?, ?, NOW())" ); // <--- FIX IS HERE
                            ps.setInt(1, sl);
                            ps.setString(2, sender);
                        
                        ps.setString(3, receiver);
                        ps.setString(4, subject);
                        ps.setString(5, body);
                        int i=ps.executeUpdate();
                        if (i > 0) {
                    %>
                        <h2 class="text-success"> Email Saved Successfully!</h2>
                        <p class="text-muted">Your email has been stored in the database.</p>
                    <%
                        } else {
                    %>
                        <h2 class="text-danger"> Error Saving Email</h2>
                        <p class="text-muted">Something went wrong. Please try again.</p>
                    <%
                        }
                        con.close();
                    %>

                    <!-- Buttons -->
                    <div class="mt-4">
                        <a href="addemail.html" class="btn btn-success me-2"> Add Another</a>
                        <a href="viewemail.jsp" class="btn btn-primary me-2"> View Emails</a>
                        <a href="welcome.jsp" class="btn btn-outline-secondary"> Home</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>
