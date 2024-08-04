<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.UserModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact List</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
        }
        h2 {
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 15px;
            text-align: left;
        }
        th {
            background-color: #343a40;
            color: white;
        }
        .table-container {
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .btn-custom {
            display: inline-block;
            margin: 5px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Contact List</h2>
    <a href="/adddisplay" class="btn btn-primary mb-3">Add Contact</a>
    <div class="table-container">
        <%
            List<UserModel> users = (List<UserModel>) request.getAttribute("users");
            if (users != null && !users.isEmpty()) {
        %>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>S.No</th>
                    <th>Name</th>
                    <th>Phone Number</th>
                    <th>Email</th>
                    <th colspan="2">Actions</th>
                </tr>
            </thead>
            <tbody>
            <%
                int i = 0;
                for (UserModel user : users) {
            %>
                <tr>
                    <td><%= ++i %></td>
                    <td><%= user.getName() %></td>
                    <td><%= user.getPhonenumber() %></td>
                    <td><%= user.getEmail() %></td>
                    <td><a href="/updatedisplay?id=<%= user.getId() %>" class="btn btn-warning btn-sm btn-custom"><i class="fas fa-edit"></i> Edit</a></td>
                    <td><a href="/delete?id=<%= user.getId() %>" class="btn btn-danger btn-sm btn-custom"><i class="fas fa-trash"></i> Delete</a></td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <%
            } else {
        %>
        <p>No contacts found. <a href="/adddisplay" class="btn btn-primary">Add a new contact</a></p>
        <%
            }
        %>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
