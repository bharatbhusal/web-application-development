<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search</title>
</head>
<body>

    <h1>Wanna search something , <%= session.getAttribute("username") %> ??</h1>

    <form action="search.jsp" method="get">
        <label for="searchInput">Search Query:</label>
        <input type="text" id="searchInput" name="q" required>
        <input type="submit" value="Search">
    </form>
    <%
        String searchQuery = request.getParameter("q");
        if (searchQuery != null && !searchQuery.isEmpty()) {
            response.sendRedirect("https://www.google.com/search?q=" + searchQuery);
        }
    %>

</body>
</html>
