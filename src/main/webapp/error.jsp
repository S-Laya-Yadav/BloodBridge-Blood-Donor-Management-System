<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error - BloodBridge</title>
    <style>
        body { font-family: sans-serif; text-align: center; padding: 50px; background: #fff5f5; }
        .error-card { background: white; padding: 30px; display: inline-block; border-radius: 10px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        h1 { color: #d32f2f; }
        a { color: #0d47a1; text-decoration: none; font-weight: bold; }
    </style>
</head>
<body>
    <div class="error-card">
        <h1>Oops! Something went wrong. ⚠️</h1>
        <p>There was an issue processing your request.</p>
        <p>Reason: <%= request.getParameter("msg") != null ? request.getParameter("msg") : "Unknown Database Error" %></p>
        <br>
        <a href="register.jsp">Try Registration Again</a>
    </div>
</body>
</html>