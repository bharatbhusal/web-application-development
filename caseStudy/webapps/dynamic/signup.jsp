<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap, java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
    <title>Sign Up</title>
</head>
<body>
    <div class="container">
        <h1>Admin Sign Up</h1>
        <%
            if (request.getMethod().equals("POST")) {
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                // Perform validation
                Map<String, String> errors = new HashMap<>();
                if (username == null || username.trim().isEmpty()) {
                    errors.put("username", "Username is required.");
                }
                if (email == null || email.trim().isEmpty()) {
                    errors.put("email", "Email is required.");
                }
                // Add more validation checks if needed

                if (errors.isEmpty()) {
                    if (username.equals("admin") && password.equals("admin")) {
                        session.setAttribute("admin_username", username);
                        session.setAttribute("admin_password", password);
                        response.sendRedirect("dashboard.jsp");
                    }
                } else {
                    // Display error messages
                    out.println("<p class='error-message'>Please correct the following errors:</p>");
                    out.println("<ul>");
                    for (String error : errors.values()) {
                        out.println("<li>" + error + "</li>");
                    }
                    out.println("</ul>");
                }
            }
        %>
        <form action="" method="post" class="form-group">
            <input type="text" name="username" placeholder="Username"><br>
            <input type="email" name="email" placeholder="Email"><br>
            <input type="password" name="password" placeholder="Password"><br>
            <button type="submit">Sign Up</button>
        </form>
    </div>
</body>
</html>
