<%@ page import="java.sql.*" %>
<%@ page import="com.example.util.DBConnection" %>
<html>
<body>
<h2>DB Test</h2>
<%
    try (Connection conn = DBConnection.getConnection()) {
        if (conn != null) {
            out.println("✅ DB Connected from JSP!");
        }
    } catch (Exception e) {
        out.println("❌ Connection failed: " + e.getMessage());
        //e.prinStackTrace(out);
    }
%>
</body>
</html>