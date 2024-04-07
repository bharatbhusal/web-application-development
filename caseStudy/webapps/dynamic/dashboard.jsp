<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
    <title>Dashboard</title>
</head>
<body>
    <div class="container">
    <h1>Welcome to Dashboard</h1>
    <%
        String username = (String) session.getAttribute("admin_username");
        if (username != null) {
            out.println("<p>Welcome, " + username + "!</p>");
        } else {
            response.sendRedirect("login.jsp");
        }
    %>
</div>
</body>
</html>
