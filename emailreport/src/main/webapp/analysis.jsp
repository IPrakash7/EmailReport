<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="db.jsp" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Email Charts</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .chart-box {
            max-width: 600px;   /* limit width */
            margin: auto;       /* center align */
        }
        canvas {
            max-height: 300px;  /* smaller height */
        }
        @media print {
            .no-print, .btn, a { display: none !important; }
        }
        .home-btn {
    position: fixed;
    bottom: 20px;
    right: 20px;
    background: #0d6efd;   /* Bootstrap primary blue */
    color: #fff;
    padding: 12px 18px;
    border-radius: 50px;
    text-decoration: none;
    font-weight: bold;
    box-shadow: 0 4px 8px rgba(0,0,0,0.3);
    transition: 0.3s;
    z-index: 9999;
}
.home-btn:hover {
    background: #0b5ed7;
    transform: scale(1.05);
}
    </style>
</head>
<body class="bg-light">

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-primary">Email Statistics</h2>
        <button onclick="window.print()" class="btn btn-outline-dark no-print"> Print Charts</button>
    </div>

    <!-- Total Emails by Date -->
    <div class="card shadow-lg mb-4 chart-box">
        <div class="card-body">
            <h5 class="text-center text-success">Total Emails by Date</h5>
            <canvas id="totalEmailsChart"></canvas>
        </div>
    </div>

    <!-- Emails by Sender -->
    <div class="card shadow-lg chart-box">
        <div class="card-body">
            <h5 class="text-center text-warning">Emails by Sender (Date-wise)</h5>
            <canvas id="senderEmailsChart"></canvas>
        </div>
    </div>

    <div class="text-center mt-4 no-print">
        <a href="welcome.jsp" class="btn btn-outline-primary">Back to Home</a>
    </div>
</div>
<!-- Floating Home Button -->
<a href="welcome.jsp" class="home-btn">
     Home
</a>
<%
    // Query 1: Total emails per date
    Statement st1 = con.createStatement();
    ResultSet rs1 = st1.executeQuery(
        "SELECT DATE_FORMAT(SENT_DATE, '%Y-%m-%d') AS EMAIL_DATE, COUNT(*) AS TOTAL " +
        "FROM EMAILS GROUP BY DATE_FORMAT(SENT_DATE, '%Y-%m-%d') ORDER BY EMAIL_DATE"
    );
    StringBuilder dates = new StringBuilder("[");
    StringBuilder totals = new StringBuilder("[");
    while (rs1.next()) {
        dates.append("'").append(rs1.getString("EMAIL_DATE")).append("',");
        totals.append(rs1.getInt("TOTAL")).append(",");
    }
    if (dates.length() > 1) dates.setLength(dates.length() - 1);
    if (totals.length() > 1) totals.setLength(totals.length() - 1);
    dates.append("]");
    totals.append("]");
    rs1.close(); st1.close();

    // Query 2: Emails by sender per date MySQL 
    Statement st2 = con.createStatement();
    ResultSet rs2 = st2.executeQuery(
        "SELECT DATE_FORMAT(SENT_DATE, '%Y-%m-%d') AS EMAIL_DATE, SENDER, COUNT(*) AS TOTAL " +
        "FROM EMAILS GROUP BY DATE_FORMAT(SENT_DATE, '%Y-%m-%d'), SENDER " +
        "ORDER BY EMAIL_DATE"
    );
    java.util.Map<String, java.util.Map<String, Integer>> dataMap = new java.util.LinkedHashMap<>();
    java.util.Set<String> senders = new java.util.LinkedHashSet<>();
    while (rs2.next()) {
        String date = rs2.getString("EMAIL_DATE");
        String sender = rs2.getString("SENDER");
        int total = rs2.getInt("TOTAL");
        senders.add(sender);
        if (!dataMap.containsKey(date)) {
            dataMap.put(date, new java.util.HashMap<String, Integer>());
        }
        dataMap.get(date).put(sender, total);
    }
    rs2.close(); st2.close(); con.close();

    String[] colors = {"#FF6384", "#36A2EB", "#FFCE56", "#4BC0C0", "#9966FF", "#FF9F40"};
    int colorIndex = 0;
%>

<script>
    // Total Emails Chart
    new Chart(document.getElementById('totalEmailsChart'), {
        type: 'bar',
        data: {
            labels: <%= dates.toString() %>,
            datasets: [{
                label: 'Total Emails',
                data: <%= totals.toString() %>,
                backgroundColor: '#36A2EB'
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { display: false } },
            scales: { y: { beginAtZero: true } }
        }
    });

    // Emails by Sender
    new Chart(document.getElementById('senderEmailsChart'), {
        type: 'bar',
        data: {
            labels: <%= dates.toString() %>,
            datasets: [
                <% for (String sender : senders) { %>
                {
                    label: '<%= sender %>',
                    data: [
                        <% for (String d : dataMap.keySet()) { %>
                            <%= dataMap.get(d).getOrDefault(sender, 0) %>,
                        <% } %>
                    ],
                    backgroundColor: "<%= colors[colorIndex % colors.length] %>"
                },
                <% colorIndex++; } %>
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { position: 'top' } },
            scales: { y: { beginAtZero: true } }
        }
    });
</script>

</body>
</html>
