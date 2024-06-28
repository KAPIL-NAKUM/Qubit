<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.hrms.*" %>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.util.Base64"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Home Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> <!-- Font Awesome CSS -->
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
  #content table {
    width: 100%;
    max-width: 950px;
    margin: 0 auto;
    background-color: #f0f0f0;
    padding: 20px;
    border-radius: 5px;
    border-collapse: collapse;
  }
  #content table th,
  #content table td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }
  #content table th {
    background-color: #2B2B2C;
    color: white;
  }
  </style>
</head>
<body>

<div id="navbar">
  <a href="#" class="logo">Qubit</a>
</div>

<div id="features">
  <a href="#">
    <i class="fas fa-money-bill" style="font-size: 36px;"></i>
    <span>View Salary Details</span>
  </a>
  <a href="EmployeeViewProjectDetails.jsp">
    <i class="fas fa-project-diagram" style="font-size: 36px;"></i>
    <span>View Project Details</span>
  </a>
  <a href="EmployeeLeaveRequest.jsp">
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
    <img src="data:image/jpg;base64,<%= imgBase64 %>" alt="Employee Avatar">
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

<div id="content">
  <h2>Employee Credentials </h2>
  <%
    // JDBC URL, username, and password of MySQL server
    String jdbcURL = "jdbc:mysql://localhost:3306/Qubit";
    String dbUser = "root";
    String dbPassword = "root";

    // Initialize variables to store employee details
    String name = "";
    String email = "";
    int age = 0;
    String contact = "";
    int empId = 0;

    // Database connection and query
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        String userEmail = (String) session.getAttribute("email");
        String sql = "SELECT emp_id, name, email, age, contact FROM emplregis WHERE email = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, userEmail);

        ResultSet result = statement.executeQuery();

        if (result.next()) {
            empId = result.getInt("emp_id");
            name = result.getString("name");
            email = result.getString("email");
            age = result.getInt("age");
            contact = result.getString("contact");
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }
  %>
  <form>
    <label>
        <span>Name:</span>
        <input type="text" name="name" value="<%= name %>" readonly>
    </label>
    <label>
        <span>Employee ID:</span>
        <input type="text" name="empId" value="<%= empId %>" readonly>
    </label>
  </form>

  <h2>Salary Details</h2>
  <%
    // Initialize variables to store salary details
    double baseSalary = 0, lta = 0, hra = 0, medical = 0, pf = 0, incomeTax = 0, totalSalary = 0, netSalary = 0, da = 0, ca = 0, bonus = 0;
    String benefits = "";

    // Database connection and query
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        String sql = "SELECT * FROM AssignSalary WHERE emp_id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, empId);

        ResultSet result = statement.executeQuery();

        if (result.next()) {
            baseSalary = result.getDouble("BaseSalary");
            lta = result.getDouble("LTA");
            hra = result.getDouble("HRA");
            medical = result.getDouble("Medical");
            pf = result.getDouble("PF");
            incomeTax = result.getDouble("IncomeTax");
            totalSalary = result.getDouble("TotalSalary");
            netSalary = result.getDouble("NetSalary");
            da = result.getDouble("DA");
            ca = result.getDouble("CA");
            bonus = result.getDouble("Bonus");
            benefits = result.getString("Benefits");
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }
  %>
  <table>
    <tr>
      <th>Component</th>
      <th>Amount (in ₹)</th>
    </tr>
    <tr>
      <td>Base Salary</td>
      <td><%= baseSalary %></td>
    </tr>
    <tr>
      <td>LTA</td>
      <td><%= lta %></td>
    </tr>
    <tr>
      <td>HRA</td>
      <td><%= hra %></td>
    </tr>
    <tr>
      <td>Medical</td>
      <td><%= medical %></td>
    </tr>
    <tr>
      <td>PF</td>
      <td><%= pf %></td>
    </tr>
    <tr>
      <td>Income Tax</td>
      <td><%= incomeTax %></td>
    </tr>
    <tr>
      <td>Total Salary</td>
      <td><%= totalSalary %></td>
    </tr>
    <tr>
      <td>Net Salary</td>
      <td><%= netSalary %></td>
    </tr>
    <tr>
      <td>DA</td>
      <td><%= da %></td>
    </tr>
    <tr>
      <td>CA</td>
      <td><%= ca %></td>
    </tr>
    <tr>
      <td>Bonus</td>
      <td><%= bonus %></td>
    </tr>
    <tr>
      <td>Benefits</td>
      <td><%= benefits %></td>
    </tr>
  </table>
</div>
</body>    
</html>
