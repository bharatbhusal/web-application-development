<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
    <title>All Users</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>All Users</h1>
    <%-- Retrieve the userDetails map from the session --%>
    <% Map<String, String[]> userDetails = (Map<String, String[]>) session.getAttribute("userDetails"); %>

    <%-- Check if userDetails is not null and iterate over each entry --%>
    <% if (userDetails != null) { %>
        <table>
            <tr>
                <th>Email</th>
                <th>Username</th>
                <th>Password</th>
            </tr>
            <% for (Map.Entry<String, String[]> entry : userDetails.entrySet()) { %>
                <tr>
                    <td><%= entry.getKey() %></td>
                    <td><%= entry.getValue()[0] %></td>
                    <td><%= entry.getValue()[1] %></td>
                </tr>
            <% } %>
        </table>
    <% } else { %>
        <p>No users found.</p>
    <% } %>
</body>
</html>
