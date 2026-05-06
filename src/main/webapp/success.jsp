<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration Success - BloodBridge</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #e3f2fd, #ffffff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .box {
            background: white;
            padding: 50px;
            width: 430px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, .12);
            text-align: center;
            /* Simple entrance animation */
            animation: fadeIn 0.6s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .icon {
            font-size: 60px;
            color: #43a047; /* Success Green */
            margin-bottom: 10px;
        }

        h1 {
            color: #0d47a1;
            margin-bottom: 15px;
        }

        p {
            font-size: 18px;
            color: #555;
            line-height: 1.6;
        }

        .btn {
            display: inline-block;
            margin-top: 25px;
            padding: 14px 30px;
            background: #0d47a1;
            color: white;
            text-decoration: none;
            border-radius: 10px;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background: #1565c0;
            box-shadow: 0 5px 15px rgba(13, 71, 161, 0.3);
            transform: scale(1.05);
        }
    </style>
</head>
<body>

    <div class="box">
        <div class="icon">✔</div>
        <h1>Registered Successfully!</h1>
        <p>Thank you for joining <strong>BloodBridge</strong>.<br> Your contribution could help save a life.</p>

        <a href="${pageContext.request.contextPath}/dashboard.jsp" class="btn">Back to Dashboard</a>
    </div>

</body>
</html>