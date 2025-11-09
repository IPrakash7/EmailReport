<%@ include file="db.jsp" %>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO EMUSERS (NAME, EMAIL, PASSWORD) VALUES (?, ?, ?)"
    );
    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3, password);

    int i = ps.executeUpdate();
    if (i > 0) {
        response.sendRedirect("login.jsp?msg=success");
    } else {
        response.sendRedirect("register.jsp?msg=error");
    }
    con.close();
%>
