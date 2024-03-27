<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.TimeZone" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    if (username != null && username.equals("bharat") && password != null && password.equals("admin")) {
        session.setAttribute("username", username);
        Date now = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
        String lastLoginTime = sdf.format(now);
        session.setAttribute("lastLoginTime", lastLoginTime);
        response.sendRedirect("dashboard.jsp");
    } else {
        response.sendRedirect("login.jsp?error=true");
    }
%>
