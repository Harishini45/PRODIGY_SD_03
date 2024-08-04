<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.UserModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Contact Detail</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin-top: 50px;
        }
        .form-container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .button-group {
            display: flex;
            justify-content: center;
            gap: 10px;
            width: 100%;
        }
        .button-group .btn {
            flex: 1;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h2>Update Contact Detail</h2>
            <%
                int id = Integer.parseInt(request.getAttribute("id").toString());
                UserModel user = (UserModel) request.getAttribute("user");
            %>
            <form method="post" action="/update?id=<%= id %>">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input id="name" name="name" type="text" class="form-control" value="<%= user.getName() %>" required/>
                </div>
                <div class="form-group">
                    <label for="phno">Phone Number:</label>
                    <input id="phno" name="phno" type="text" class="form-control" value="<%= user.getPhonenumber() %>" required/>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input id="email" name="email" type="email" class="form-control" value="<%= user.getEmail() %>" required/>
                </div>
                <div class="button-group">
                    <button type="submit" class="btn btn-primary">Update</button>
                    <a href="/" class="btn btn-secondary">Back</a>
                </div>
            </form>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
