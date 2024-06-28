<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.hrms.ProjectDetails"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project Details</title>
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
            color: #343a40; /* Dark color font */
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
        /* New styles for transparent div */
        .transparent-div {
            background-color: rgba(255, 255, 255, 0.7); /* Semi-transparent white background */
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd; /* Add bottom border */
        }
        th {
            background-color: #103358; /* Dark blue background for table headers */
            color: white; /* White font color */
            font-weight: bold;
        }
        tr:hover {
            background-color: #f2f2f2; /* Light gray background on hover */
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
    <!-- Transparent div containing the table -->
    <div class="container">
        <div class="transparent-div">
            <h1 class="text-center">PROJECT DETAILS</h1>
            <table border="1">
                <tr>
                    <th>Project Name</th>
                    <th>Project Description</th>
                    <th>Employee</th>
                    <th>Document Name</th>
                </tr>
                <% List<ProjectDetails> projectList = (List<ProjectDetails>) request.getAttribute("projects");
                if (projectList != null) {
                    for (ProjectDetails project : projectList) { %>
                <tr>
                    <td><%= project.getProjectName() %></td>
                    <td><%= project.getProjectDescription() %></td>
                    <td><%= project.getEmployee() %></td>
                    <td><a href="DownloadDocument?documentId=<%= project.getFileId() %>" target="_blank"><%= project.getFileName() %></a></td>
                </tr>
                <% }
                } %>
            </table>
        </div>
    </div>
    <!-- Include Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
