<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Security: Redirect to login if session is invalid
    if (session.getAttribute("name") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Donor Results - BloodBridge</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 { color: #d32f2f; margin-bottom: 20px; }

        .container {
            width: 90%;
            max-width: 900px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th {
            background-color: #d32f2f;
            color: white;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            color: #333;
        }

        tr:hover { background-color: #f1f1f1; }

        .no-data {
            padding: 20px;
            color: #777;
            font-style: italic;
        }

        .btn-back {
            margin-top: 20px;
            display: inline-block;
            padding: 10px 20px;
            background-color: #0d47a1;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s;
        }

        .btn-back:hover { background-color: #1565c0; }
        
        .blood-tag {
            background: #ffebee;
            color: #c62828;
            padding: 4px 8px;
            border-radius: 4px;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <h2>Donor Match Results 🩸</h2>

    <div class="container">
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Age</th>
                    <th>Blood Group</th>
                    <th>City</th>
                    <th>Contact</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Retrieve the list forwarded from MatchServlet
                    List<Map<String, Object>> donorList = (List<Map<String, Object>>) request.getAttribute("donorList");

                    if (donorList != null && !donorList.isEmpty()) {
                        for (Map<String, Object> donor : donorList) {
                %>
                    <tr>
                        <td><%= donor.get("name") %></td>
                        <td><%= donor.get("age") %></td>
                        <td><span class="blood-tag"><%= donor.get("blood_group") %></span></td>
                        <td><%= donor.get("address") %></td>
                        <td><strong><%= donor.get("phone") %></strong></td>
                    </tr>
                <% 
                        }
                    } else { 
                %>
                    <tr>
                        <td colspan="5" class="no-data">No donors found matching your search criteria.</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <a href="search.jsp" class="btn-back">← Search Again</a>
    <a href="dashboard.jsp" class="btn-back" style="background:#444;">Dashboard</a>

</body>
</html>