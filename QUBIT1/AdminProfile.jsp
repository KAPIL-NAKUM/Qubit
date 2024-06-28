<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
        /* Main content area */
        .main-content {
            background-color: #fff; /* White background */
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Box shadow for a subtle effect */
            height: 180px; /* Set height for squares */
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 10px; /* Add margin for space between squares */
            transition: background-color 0.3s; /* Smooth transition for background color change */
            font-weight: bold; /* Set font weight to bold */
            color: #fff; /* Set font color to white */
        }
        /* Assign different background colors for each field */
        #assignProjectForm {
            background-color: #103358; /* Yellow */
        }
        #assignSalaryForm {
            background-color: #103358; /* Green */
        }
        #approveLeaveRequests {
            background-color: #103358; /* Blue */
        }
        #viewProjectDetails {
            background-color: #103358; /* Red */
        }
        /* Hover effect */
        .main-content:hover {
            transform: scale(1.05); /* Enlarge by 5% on hover */
            background-color: #000; /* Change background color to black on hover */
            cursor: pointer;
            color: #000; /* Change font color to black on hover */
        }
        .main-content { 
            background-color: inherit; 
        } 
        #assignProjectForm:hover { 
            background-color: #fff; 
            cursor: pointer; 
        } 
        #assignSalaryForm:hover { 
            background-color: #fff; 
            cursor: pointer; 
        } 
        #approveLeaveRequests:hover { 
            background-color: #fff; 
            cursor: pointer; 
        } 
        #viewProjectDetails:hover { 
            background-color: #fff; 
            cursor: pointer; 
        } 
        /* ... and so on for other elements */
        .bg-custom {
            background-color: #103358 !important; /* Custom background color */
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp"><i class="fas fa-home"></i> Home</a>
            <a class="navbar-brand" href="AdminLogin.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </nav>

    <div class="container">
        <!-- Main content area -->
        <div class="row mt-4">
            <!-- Main content area -->
            <div class="col-md-12">
                <div class="row">
                    <!-- Assign Project Form -->
                    <div class="col-md-6">
                       <a href="AssignProjects.jsp">
                        <div id="assignProjectForm" class="main-content">
                        <h3>Assign Project</h3>
            <!-- Any additional content you want to display -->
                        </div>
                        </a>
                       </div>
                    
                    
                    <!-- Assign Salary Form -->
                    <div class="col-md-6">
                       <a href="AssignSalary.jsp">
                        <div id="assignSalaryForm" class="main-content">
                            <h3>Assign Salary</h3>
                            <form>
                                <!-- Form fields for assigning salary -->
                            </form>
                           
                        </div>
                        </a> 
                        
                        
                    </div>
                </div>

                <div class="row">
                    <!-- Approve Leave Requests -->
                    <div class="col-md-6">
                        <div id="approveLeaveRequests" class="main-content">
                            <h3>Approve Leave Requests</h3>
                            <!-- Only display the title -->
                        </div>
                    </div>

                    <!-- View Project Details -->
                    <div class="col-md-6">
                    <a href="Project">
                        <div id="viewProjectDetails" class="main-content">
                            <h3>View Project Details</h3>
                            <!-- Display project details here -->
                        </div>
                        </a>      
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Include Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>

    