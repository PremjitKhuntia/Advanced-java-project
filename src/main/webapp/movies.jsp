<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.example.util.DBConnection" %>
<html>
<head>
    <title>Available Movies</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #141E30, #243B55);
            color: #fff;
        }

        /* Navbar styling (reuse same style) */
        nav {
            background: rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(5px);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 40px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.3);
        }
        nav .logo {
            font-size: 22px;
            font-weight: 600;
            color: #00BFFF;
            text-shadow: 0 0 10px #00BFFF;
        }
        nav ul {
            list-style: none;
            display: flex;
            margin: 0;
            padding: 0;
        }
        nav ul li {
            margin-left: 25px;
        }
        nav ul li a {
            text-decoration: none;
            color: #00BFFF;
            font-size: 16px;
            padding: 8px 16px;
            border: 2px solid #00BFFF;
            border-radius: 25px;
            transition: all 0.3s ease;
        }
        nav ul li a:hover {
            background-color: #00BFFF;
            color: #fff;
            box-shadow: 0 0 10px #00BFFF;
        }

        /* Page title */
        h2 {
            text-align: center;
            margin-top: 40px;
            font-size: 30px;
            letter-spacing: 1px;
            text-shadow: 2px 2px 5px rgba(0,0,0,0.5);
        }

        /* Movie grid layout */
        .movie-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 30px;
            padding: 40px;
            justify-items: center;
        }

        /* Each movie card */
        .movie-card {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.3);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            width: 220px;
            text-align: center;
        }

        .movie-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0,0,0,0.4);
        }

        /* Movie poster image */
        .movie-card img {
            width: 100%;
            height: 320px;
            object-fit: cover;
            border-bottom: 2px solid #00BFFF;
        }

        /* Movie details */
        .movie-info {
            padding: 15px;
        }

        .movie-info h3 {
            font-size: 18px;
            margin-bottom: 8px;
            color: #00BFFF;
        }

        .movie-info p {
            font-size: 14px;
            margin: 4px 0;
            color: #e0e0e0;
        }

        .book-btn {
            margin-top: 10px;
            display: inline-block;
            background: #00BFFF;
            color: white;
            padding: 8px 15px;
            border-radius: 20px;
            text-decoration: none;
            font-size: 14px;
            transition: 0.3s;
        }

        .book-btn:hover {
            background: #008ecc;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav>
        <div class="logo">🎬 Movie Booking</div>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="movies.jsp">Movies</a></li>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="register.jsp">Register</a></li>
        </ul>
    </nav>

    <h2>Now Showing</h2>

    <div class="movie-container">
        <%
            try {
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM movie");
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    String title = rs.getString("title");
                    String genre = rs.getString("genre");
                    String showtime = rs.getString("showtime");
                    String poster = rs.getString("poster_url"); // column in DB for image URL
        %>

        <div class="movie-card">
            <img src="<%= poster %>" alt="<%= title %>">
            <div class="movie-info">
                <h3><%= title %></h3>
                <p>Genre: <%= genre %></p>
                <p>Showtime: <%= showtime %></p>
                <a href="seats.jsp?movieId=<%= rs.getInt("id") %>" class="book-btn">Book Now</a>

            </div>
        </div>

        <%
                }
                con.close();
            } catch (Exception e) {
                out.println("<p style='color:red;text-align:center;'>Error loading movies: " + e.getMessage() + "</p>");
            }
        %>
    </div>

</body>
</html>