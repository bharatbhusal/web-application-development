<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap, java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
    <title>Sign Up</title>
</head>
<body>
    <h1>Add new User</h1>
   
    <%
        if (request.getMethod().equals("POST")) {
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Map<String, String> errors = new HashMap<>();
            if (username == null || username.trim().isEmpty()) {
                errors.put("username", "Username is required.");
            }
            if (email == null || email.trim().isEmpty()) {
                errors.put("email", "Email is required.");
            }

            if (errors.isEmpty()) {
                Map<String, String[]> userDetails = (Map<String, String[]>) session.getAttribute("userDetails");
                if (userDetails == null) {
                    userDetails = new HashMap<>();
                }
                userDetails.put(email, new String[]{username, password});
                session.setAttribute("userDetails", userDetails);

                response.sendRedirect("dashboard.jsp");
            } else {
                out.println("<p>Please correct the following errors:</p>");
                out.println("<ul>");
                for (String error : errors.values()) {
                    out.println("<li>" + error + "</li>");
                }
                out.println("</ul>");
            }
        }
    %>
    <form action="" method="post">
        <input type="text" name="username" placeholder="Username"><br>
        <input type="email" name="email" placeholder="Email"><br>
        <input type="password" name="password" placeholder="Password"><br>
        <!-- Other input fields -->
        <button type="submit">Add new user</button>
    </form>
</body>
</html>
