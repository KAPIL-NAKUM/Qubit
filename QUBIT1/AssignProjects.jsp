<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.naming.*" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assign Projects</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Include Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Custom CSS -->
    <style>
        /* Custom CSS styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa; /* Light gray background */
            background-image: url("assets/images/hector-j-rivas-1FxMET2U5dU-unsplash (1).jpg"); /* Add path to your image here */
            background-size: cover; /* Resize image to cover the entire background */
            background-position: center; /* Center the image horizontally and vertically */
            background-repeat: no-repeat; /* Prevent image from repeating */
        }
        .navbar {
            border-radius: 0;
        }
        .list-group-item {
            border-radius: 0;
        }
        .list-group-item.active {
            background-color: #007bff;
            border-color: #007bff;
        }
        .bg-custom {
            background-color: #103358 !important; /* Custom background color */
        }
        .form-group {
            margin-bottom: 20px;
        }
        .card {
            background: rgba(255, 255, 255, 0.5); /* Transparent white background */
            border: none; /* Remove border */
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-custom">
        <div class="container-fluid">
            <a class="navbar-brand mr-4" href="index.jsp"><i class="fas fa-home"></i> Home</a>
            <a class="navbar-brand" href="AdminProfile.jsp"><i class="fas fa-user-circle mr-1"></i> Profile</a>
            <a class="navbar-brand" href="AdminLogin.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title text-center">Assign Projects</h5>
                        <form action="AssignProject" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="projectName">Project Name</label>
                                <input type="text" class="form-control" id="projectName" name="projectName" required>
                            </div>
                            <div class="form-group">
                                <label for="projectDescription">Project Description</label>
                                <textarea class="form-control" id="projectDescription" name="projectDescription" rows="3" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="document">Upload Document(PDF only)</label>
                                <input type="file" class="form-control-file" id="document" name="document" required>
                            </div>
                            <div class="form-group">
                                <label for="employee">Select Employee</label>
                                <select class="form-control" id="employee" name="employee" required>
                                    <!-- Option list of all employees fetched from the database -->
                                    <% 
                                        Connection connection = null;
                                        PreparedStatement statement = null;
                                        ResultSet resultSet = null;
                                        try {
                                            // Establish connection to the database
                                            Class.forName("com.mysql.jdbc.Driver");
                                            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Qubit", "root", "root");
                                            
                                            // SQL query to fetch names of employees
                                            String sql = "SELECT name FROM emplregis";
                                            statement = connection.prepareStatement(sql);
                                            
                                            // Execute the query
                                            resultSet = statement.executeQuery();
                                            
                                            // Process the result set
                                            while (resultSet.next()) {
                                                String name = resultSet.getString("name");
                                                out.println("<option>" + name + "</option>");
                                            }
                                        } catch (ClassNotFoundException | SQLException e) {
                                            e.printStackTrace();
                                        } finally {
                                            // Close JDBC objects
                                            try {
                                                if (resultSet != null) resultSet.close();
                                                if (statement != null) statement.close();
                                                if (connection != null) connection.close();
                                            } catch (SQLException e) {
                                                e.printStackTrace();
                                            }
                                        }
                                    %>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Assign</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Include Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
