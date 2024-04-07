<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
    <title>Login</title>
</head>
<body>
    <div class="container">
        <h1>Login</h1>
        <%
            if (request.getMethod().equals("POST")) {
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                Map<String, String[]> userDetailsMap = (Map<String, String[]>) session.getAttribute("userDetails");

                if (userDetailsMap != null && userDetailsMap.containsKey(email)) {
                    String[] userDetails = userDetailsMap.get(email);
                    String storedPassword = userDetails[1]; // Index 1 contains the stored password

                    if (password.equals(storedPassword)) {
                        session.setAttribute("loggedInUser", email); // Store email as the logged-in user
                        response.sendRedirect("dashboard.jsp");
                    } else {
                        out.println("<p class='error-message'>Invalid email or password. Please try again.</p>");
                    }
                } else {
                    out.println("<p class='error-message'>Invalid email or password. Please try again.</p>");
                }
            }
        %>
        <form action="" method="post" class="form-group">
            <input type="email" name="email" placeholder="Email"><br>
            <input type="password" name="password" placeholder="Password"><br>
            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>
