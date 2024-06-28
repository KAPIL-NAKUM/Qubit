<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assign Salary</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- Include Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        
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
        
        .container {
            margin-top: 50px;
            background: rgba(255, 255, 255, 0.5); /* Transparent white background */
        border-radius: 20px; /* Rounded corners */
        padding: 20px; /* Add padding for content */
        }
        .form-group {
            margin-bottom: 20px;
        }
        .benefit-button {
            margin-right: 10px;
            margin-bottom: 10px;
        }
        .selected-benefit {
            margin-right: 10px;
            margin-bottom: 10px;
            padding: 5px 10px;
            border: 1px solid #007bff;
            border-radius: 20px;
        }
        .assign-salary-heading {
            text-transform: uppercase; /* Convert text to uppercase */
            text-align: center; /* Center align the text */
            margin-top: 30px; /* Adjust top margin for centering */
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
    
    <div class="container">
            <h1 class="assign-salary-heading">Assign Salary</h1>
        <form action="Assign_Salary" method="post">
            
            
             <div class="form-group">
    <label for="empId">Employee ID:</label>
    <select class="form-control" id="empId" name="empId" onchange="displayEmployeeName()">
        <% 
            // Database connection
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                // Establish database connection
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Qubit", "root", "root");
                
                // Fetch employee IDs from the database
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT emp_id FROM emplregis");
                while (rs.next()) {
                    int empId = rs.getInt("emp_id");
        %>
                    <option value="<%= empId %>"><%= empId %></option>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close database resources
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </select>
</div>
             
            <div class="form-group">
                <label for="empName">Employee Name:</label>
                <input type="text" class="form-control" id="empName" name="empName" readonly>
            </div>
           
           
            <div class="form-group">
                <label for="baseSalary">Base Salary (Rs.):</label>
                <input type="number" class="form-control" id="baseSalary" name="baseSalary" required>
            </div>
            <div class="form-group">
                <h4>Benefits:</h4>
                <!-- Add predefined options for benefits -->
                <div id="benefitsContainer">
                    <!-- Dynamic benefit buttons will be added here -->
                </div>
            </div>
            <div id="selectedBenefits"></div>
            <!-- Hidden input fields to store selected benefits -->
            <input type="hidden" id="selectedBenefitsInput" name="selectedBenefits">
            <div class="form-group">
                <label for="bonus">Bonus (Rs.):</label>
                <input type="number" class="form-control" id="bonus" name="bonus">
            </div>
            <button type="submit" class="btn btn-success">Submit</button>
        </form>
    </div>

    <!-- Include Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JavaScript for adding dynamic benefit fields -->
    <script>
    
    function displayEmployeeName() {
        const empId = document.getElementById('empId').value;
        const empName = document.getElementById('empName');
        
        // Fetch employee name corresponding to the selected emp_id using AJAX
        const xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                empName.value = this.responseText;
            }
        };
        xhttp.open("GET", "FetchEmployeeNameServlet?empId=" + empId, true);
        xhttp.send();
    }


       
        
        function addBenefitField() {
            const container = document.getElementById('benefitsContainer');
            const predefinedBenefits = ['Health Insurance', 'Life Insurance', 'Stocks', 'Mutual Fund', 'Car', 'House'];
            predefinedBenefits.forEach(benefit => {
                const button = document.createElement('button');
                button.type = 'button';
                button.className = 'btn btn-primary benefit-button';
                button.textContent = benefit;
                button.onclick = function() {
                    addSelectedBenefit(benefit);
                };
                container.appendChild(button);
            });
        }

        function addSelectedBenefit(benefit) {
            const selectedBenefitsContainer = document.getElementById('selectedBenefits');
            const selectedBenefit = document.createElement('span');
            selectedBenefit.className = 'selected-benefit';
            selectedBenefit.textContent = benefit;
            selectedBenefit.onclick = function() {
                removeSelectedBenefit(selectedBenefit);
            };
            selectedBenefitsContainer.appendChild(selectedBenefit);
            // Add selected benefit to hidden input field
            const selectedBenefitsInput = document.getElementById('selectedBenefitsInput');
            selectedBenefitsInput.value += benefit + ',';
        }

        function removeSelectedBenefit(selectedBenefit) {
            selectedBenefit.parentNode.removeChild(selectedBenefit);
            // Remove selected benefit from hidden input field
            const selectedBenefitsInput = document.getElementById('selectedBenefitsInput');
            const value = selectedBenefitsInput.value;
            selectedBenefitsInput.value = value.replace(selectedBenefit.textContent + ',', '');
        }

        window.onload = function() {
        	displayEmployeeName();
            addBenefitField();
        };
    </script>
</body>
</html>
    