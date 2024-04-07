<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap, java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
    <title>Update User</title>
</head>
<body>
    <div class="container">
        <h1>Update User</h1>
        <%
            if (request.getMethod().equals("POST")) {
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String newPassword = request.getParameter("new_password");

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
                    userDetails.put(email, new String[]{username, newPassword});
                    session.setAttribute("userDetails", userDetails);

                    response.sendRedirect("dashboard.jsp");
                } else {
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
            <input type="password" name="password" placeholder="Current Password"><br>
            <input type="password" name="new_password" placeholder="New Password"><br>
            <button type="submit">Update User</button>
        </form>
    </div>
</body>
</html>
