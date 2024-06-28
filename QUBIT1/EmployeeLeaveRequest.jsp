<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.hrms.*" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leave Request</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
         #navbar {
    width: 100%;
    background-color: #2B2B2C;
    overflow: hidden;
    position: relative;
    z-index: 2; /* Ensure the navbar is above the sidebar */
    box-shadow: 0 2px 4px rgba(0,0,0,0.9); /* Added shadow effect */
  }
  #navbar a {
    float: left;
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
  }
  #navbar a.logo {
    margin-right: 15px;
    font-size: 24px;
    font-weight: bold;
    color: white;
  }
  #navbar a.logo:hover {
    background-color: transparent;
  }
  #features {
    background-color: #f0f0f0;
    padding: 10px 0;
    text-align: center;
    white-space: nowrap; /* Prevent line breaks */
  }
  #features a {
    margin: 20px;
    color: #2B2B2C;
    text-decoration: none;
    display: inline-block;
    vertical-align: top; /* Align the features at the top */
  }
  #features a i {
    font-size: 36px; /* Reduced the icon size */
    margin-bottom: 1px; /* Reduced the space below the icon */
  }
  #features a span {
    display: block;
    margin-top: 5px; /* Added space between icon and text */
  }
  #features a:hover {
    color: #333;
  }
  #sidebar {
    width: 250px;
    height: 100%;
    background-color: #2B2B2C;
    position: fixed;
    top: 0;
    left: 0;
    overflow-x: hidden;
    padding-top: 80px; /* Adjusted to accommodate the navbar */
    z-index: 1; /* Ensure the sidebar is below the navbar */
  }
  #sidebar img {
    display: block;
    margin: 0 auto 20px; /* Pushed the image down */
    width: 100px;
    height: 100px;
    border-radius: 50%;
  }
  #sidebar .name {
    text-align: center;
    color: white;
    margin-bottom: 10px;
  }
  #sidebar hr {
    border: 0;
    border-top: 1px solid white;
    margin: 20px 0;
  }
  #sidebar a {
    padding: 10px;
    text-decoration: none;
    color: white;
    display: flex;
    align-items: center;
  }
  #sidebar a i {
    margin-right: 20px; /* Added margin to the right of icons */
  }
  #content {
    margin-left: 250px;
    padding: 20px;
  }
  #content form {
    width: 100%; /* Make the form take the full width */
    max-width: 950px; /* Limit the maximum width */
    margin: 0 auto;
    background-color: #f0f0f0;
    padding: 20px;
    border-radius: 5px;
    display: table;
  }
  #content form label {
    display: table-row;
    padding: 10px 0; /* Increased space between label and input */
  }
  #content form label span {
    display: table-cell;
    padding-right: 150px; /* Decreased space between label and input */
    text-align: left;
    width: 30%; /* Adjust label width */
  }
  #content form input[type="text"],
  #content form input[type="number"],
  #content form input[type="email"] {
    width: calc(100% - 120px); /* Adjusted width to shift input boxes to the left */
    padding: 10px;
    margin-bottom: 10px;
    margin-left: -140px; /* Added margin to move input boxes to the left */
    box-sizing: border-box;
  }
        .container {
            margin-left: 250px;
            padding: 20px;
        }
        form {
            width: 100%;
            max-width: 950px;
            margin: 0 auto;
            background-color: #f0f0f0;
            padding: 20px;
            border-radius: 5px;
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        input[type="text"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }
        textarea {
            height: 100px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div id="navbar">
  <a href="#" class="logo">Qubit</a>
</div>

<div id="features">
  <a href="EmployeeViewSalaryDetails.jsp">
    <i class="fas fa-money-bill" style="font-size: 36px;"></i>
    <span>View Salary Details</span>
  </a>
  <a href="EmployeeViewProjectDetails.jsp">
    <i class="fas fa-project-diagram" style="font-size: 36px;"></i>
    <span>View Project Details</span>
  </a>
  <a href="#">
    <i class="fas fa-calendar-alt" style="font-size: 36px;"></i>
    <span>Leave Request</span>
  </a>
</div>

<div id="sidebar">
    <% 
        try {
            // JDBC URL, username, and password of MySQL server
            String jdbcURL = "jdbc:mysql://localhost:3306/Qubit";
            String dbUser = "root";
            String dbPassword = "root";

            // Database connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            
            // Query to fetch employee name and image
            String userEmail = (String) session.getAttribute("email");
            String sql = "SELECT name, image FROM emplregis WHERE email = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, userEmail);

            ResultSet result = statement.executeQuery();

            if (result.next()) {
                String empName = result.getString("name");
                Blob blob = result.getBlob("image");
                byte[] imgData = blob.getBytes(1, (int) blob.length());
                String imgBase64 = Base64.getEncoder().encodeToString(imgData);
    %>
    <img src="data:image/jpg;base64, <%= imgBase64 %>" alt="Employee Avatar">
    <div class="name"><%= empName %></div>
    <%
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    %>
    <hr>
    <a href="EmployeeProfile.jsp"><i class="fas fa-user"></i> Profile</a>
    <a href="#"><i class="fas fa-cog"></i> Settings</a>
    <a href="index.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
</div>



    <div class="container">
        <h2>Leave Request</h2>
        <form action="LeaveRequestServlet" method="post" enctype="multipart/form-data">
            <label for="empId">Employee ID:</label>
            <input type="text" id="empId" name="empId" required>
            <label for="empName">Employee Name:</label>
            <input type="text" id="empName" name="empName" required>
            <label for="startDate">Start Date:</label>
            <input type="date" id="startDate" name="startDate" required>
            <label for="endDate">End Date:</label>
            <input type="date" id="endDate" name="endDate" required>
            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea>
            <label for="document">Application or Medical Certificate:</label>
            <input type="file" id="document" name="document" accept=".pdf,.doc,.docx" required>
            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>
