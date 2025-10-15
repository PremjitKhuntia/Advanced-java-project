<%@ page import="java.sql.*,com.example.util.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Available Movies</title>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <h2>Available Movies</h2>

    <!-- Filter Form -->
    <form method="get" action="movies.jsp">
        <label>Genre:</label>
        <select name="genre">
            <option value="">All</option>
            <option value="Action">Action</option>
            <option value="Thriller">Thriller</option>
            <option value="Anime">Anime</option>
            <option value="Horror">Horror</option>
            <option value="Scifi">Scifi</option>
        </select>

        <label>Language:</label>
        <select name="language">
            <option value="">All</option>
            <option value="Hindi">Hindi</option>
            <option value="English">English</option>
            <option value="Telugu">Telugu</option>
            <option value="Japanese">Japanese</option>
            <option value="Korean">Korean</option>
        </select>

        <input type="submit" value="Filter">
    </form>
    <br>

    <table border="1">
        <tr>
            <th>ID</th>
            <th>Movie</th>
            <th>Genre</th>
            <th>Duration</th>
            <th>Language</th>
            <th>Release Date</th>
            <th>Show Time</th>
            <th>Action</th>
        </tr>

        <%
            String genre = request.getParameter("genre");
            String language = request.getParameter("language");

            String query = "SELECT * FROM movies WHERE 1=1";
            if (genre != null && !genre.isEmpty()) {
                query += " AND genre='" + genre + "'";
            }
            if (language != null && !language.isEmpty()) {
                query += " AND language='" + language + "'";
            }

            try (Connection conn = DBConnection.getConnection();
                 Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(query)) {
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("genre") %></td>
            <td><%= rs.getInt("duration") %> mins</td>
            <td><%= rs.getString("language") %></td>
            <td><%= rs.getDate("release_date") %></td>
            <td><%= rs.getTimestamp("show_time") %></td>
            <td>
                <form action="seats.jsp" method="get">
                     <input type="hidden" name="movieId" value="<%= rs.getInt("id") %>">
                     <input type="submit" value="Book Now">
                </form>
            </td>
        </tr>
        <%
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </table>
</body>
</html>