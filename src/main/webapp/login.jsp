<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - BloodBridge</title>
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
            width: 320px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            text-align: center;
        }

        h2 {
            color: #0d47a1;
            margin-bottom: 20px;
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            /* Prevents inputs from expanding outside the card */
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
            transition: background 0.3s;
        }

        button:hover {
            background: #1565c0;
        }

        .links {
            margin-top: 15px;
            font-size: 14px;
        }

        a {
            text-decoration: none;
            color: #0d47a1;
            font-weight: bold;
        }

        .error-msg {
            color: #d32f2f;
            font-size: 13px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="card">
    <h2>Login</h2>

    <% if(request.getParameter("error") != null) { %>
        <div class="error-msg">Invalid Email or Password ❌</div>
    <% } %>

    <form action="LoginServlet" method="post">
        <input type="email" name="email" placeholder="Enter Email" required>
        <input type="password" name="password" placeholder="Enter Password" required>
        <button type="submit">Login</button>
    </form>

    <div class="links">
        <a href="register.jsp">New User? Register</a>
    </div>
</div>

</body>
</html>