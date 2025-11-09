<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="db.jsp" %>
<%@ include file="header.jsp" %>
<%@ page import="java.util.*" %>
<%
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT SENDER, COUNT(*) AS TOTAL FROM EMAILS GROUP BY SENDER");
    String data = "";
    while (rs.next()) {
        data += "['" + rs.getString("SENDER") + "', " + rs.getInt("TOTAL") + "],";
    }
    con.close();
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Email Visualization</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Google Charts -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Sender', 'Emails'],
                <%= data %>
            ]);

            var options = {
                title: ' Emails per Sender',
                titleTextStyle: { fontSize: 20, bold: true },
                is3D: true,
                legend: { position: 'right', textStyle: { fontSize: 14 } }
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));
            chart.draw(data, options);
        }

        // Print function
        function printPage() {
            window.print();
        }
    </script>
</head>

<body class="bg-light">

    <div class="container mt-5">
        <div class="text-center mb-4">
            <h1 class="text-primary"> Email Visualization</h1>
            <p class="text-muted">Pie chart of emails grouped by sender</p>
        </div>

        <div class="card shadow-lg rounded-3">
            <div class="card-body">
                <div id="piechart" style="width: 100%; height: 500px;"></div>
            </div>
        </div>

        <div class="text-center mt-4">
            <a href="viewemail.jsp" class="btn btn-outline-primary me-2"> View Emails</a>
            <a href="welcome.jsp" class="btn btn-outline-secondary me-2"> Back to Home</a>
            <button onclick="printPage()" class="btn btn-success"> Print</button>
        </div>
    </div>

</body>
</html>
