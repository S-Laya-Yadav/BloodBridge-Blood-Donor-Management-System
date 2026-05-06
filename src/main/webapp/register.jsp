<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - BloodBridge</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #e3f2fd, #ffffff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .card {
            background: white;
            padding: 30px;
            width: 340px; /* Slightly wider for comfort */
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #0d47a1;
            margin-bottom: 20px;
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            /* CRITICAL: keeps padding inside the 100% width */
            box-sizing: border-box; 
        }

        button {
            width: 100%;
            padding: 12px;
            background: #0d47a1;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
            transition: background 0.3s;
        }

        button:hover {
            background: #1565c0;
        }

        .login-link {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

        a {
            text-decoration: none;
            color: #0d47a1;
            font-weight: bold;
        }

        .status-msg {
            text-align: center;
            font-size: 13px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="card">
    <h2>Create Account</h2>

    <% if(request.getParameter("error") != null) { %>
        <div class="status-msg" style="color: #d32f2f;">Registration failed. Try again. ❌</div>
    <% } %>

    <form action="RegisterServlet" method="post">
        <input type="text" name="name" placeholder="Full Name" required>
        <input type="email" name="email" placeholder="Email Address" required>
        <input type="password" name="password" placeholder="Create Password" required>

        <button type="submit">Register</button>
    </form>

    <div class="login-link">
        Already have an account? <a href="login.jsp">Login</a>
    </div>
</div>

</body>
</html>