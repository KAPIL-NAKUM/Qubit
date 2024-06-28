<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Session Invalid</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #222;
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .content {
            text-align: center;
            padding: 20px;
        }
        .message {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .image {
            margin-bottom: 20px;
        }
        .button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="content">
        <div class="message">Session invalid</div>
        <div class="image">
            <img src="assets/images/session_invalid_image.jpg" alt="Session Invalid Image" width="200">
        </div>
        <div class="button">
            <a href="EmployeeLogin.jsp" style="color: inherit; text-decoration: none;">Click here to Re-login</a>
        </div>
    </div>
</body>
</html>
    