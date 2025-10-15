<%@ page import="java.sql.*,com.example.util.DBConnection" %>
<%
    // Get movieId from request
    String movieId = request.getParameter("movieId");
    session.setAttribute("movieId", movieId); // save in session for servlet
%>
<!DOCTYPE html>
<html>
<head>
    <title>Select Seats</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <h2>Select Seats for Movie ID: <%= movieId %></h2>

    <form action="BookTicketServlet" method="post">
        <input type="hidden" name="movieId" value="<%= movieId %>">

        <h3>Row A</h3>
        <input type="checkbox" name="seat" value="A1"> A1
        <input type="checkbox" name="seat" value="A2"> A2
        <input type="checkbox" name="seat" value="A3"> A3

        <h3>Row B</h3>
        <input type="checkbox" name="seat" value="B1"> B1
        <input type="checkbox" name="seat" value="B2"> B2
        <input type="checkbox" name="seat" value="B3"> B3

        <br><br>
        <input type="submit" value="Confirm Booking">
    </form>
</body>
</html>