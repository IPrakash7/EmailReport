<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="db.jsp" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM EMUSERS WHERE EMAIL=? AND PASSWORD=?"
    );
    ps.setString(1, email);
    ps.setString(2, password);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        // Store user details in session
        session.setAttribute("userName", rs.getString("NAME"));
        session.setAttribute("userEmail", rs.getString("EMAIL"));

        // Redirect to Home Page
        response.sendRedirect("welcome.jsp");
    } else {
        // Redirect back to login with error message
        response.sendRedirect("login.jsp?msg=invalid");
    }
    con.close();
%>
