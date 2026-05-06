<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Donor Registration</title>
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
            color: #0d47a1;
            margin-top: 0;
        }

        /* Improved input styling */
        input {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* Crucial: keeps padding inside the width */
        }

        button {
            width: 100%;
            padding: 12px;
            background: #0d47a1;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }

        button:hover {
            background: #1565c0;
        }
    </style>
</head>
<body>

<div class="card">
    <h2>Donor Registration</h2>

    <form action="DonorServlet" method="post">
        
        <input type="text" name="name" placeholder="Full Name" required>
        <input type="number" name="age" placeholder="Age" required>
        <input type="text" name="address" placeholder="City" required>
        <input type="tel" name="phone" placeholder="Phone Number" required>
        
        <input type="text" name="blood" placeholder="Blood Group (e.g. O+)" required>

        <button type="submit">Register as Donor</button>
    </form>
</div>

</body>
</html>