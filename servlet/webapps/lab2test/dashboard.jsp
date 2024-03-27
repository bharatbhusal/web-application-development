<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
</head>
<body>
    <h1>Welcome to Dashboard</h1>
    <% 
        String username = (String) session.getAttribute("username");
        String lastLoginTime = (String) session.getAttribute("lastLoginTime");
    %>
    <p>Hello, <%= username %></p>
    <p>Last Login Time: <%= lastLoginTime %></p>
</body>
</html>
