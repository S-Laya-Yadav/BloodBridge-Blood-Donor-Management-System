<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Find Donors - BloodBridge</title>
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
            width: 350px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #d32f2f; /* Using red for blood search theme */
            margin-bottom: 20px;
        }

        label {
            font-size: 14px;
            color: #555;
            display: block;
            margin-top: 10px;
        }

        input, select {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box; /* Keeps padding inside the width */
            font-size: 14px;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #d32f2f;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 15px;
            font-weight: bold;
            transition: background 0.3s;
        }

        button:hover {
            background: #b71c1c;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        a {
            text-decoration: none;
            color: #0d47a1;
        }
    </style>
</head>
<body>

<div class="card">
    <h2>Find Donors 🔎</h2>

    <form action="MatchServlet" method="get">
        
        <label>Required Blood Group:</label>
        <select name="blood" required>
            <option value="" disabled selected>Select Group</option>
            <option value="A+">A+</option>
            <option value="A-">A-</option>
            <option value="B+">B+</option>
            <option value="B-">B-</option>
            <option value="O+">O+</option>
            <option value="O-">O-</option>
            <option value="AB+">AB+</option>
            <option value="AB-">AB-</option>
        </select>

        <label>Location (City):</label>
        <input type="text" name="place" placeholder="e.g. Bengaluru">

        <button type="submit">Search Donors</button>
    </form>

    <div class="back-link">
        <a href="dashboard.jsp">← Back to Dashboard</a>
    </div>
</div>

</body>
</html>