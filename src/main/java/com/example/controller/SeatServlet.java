package com.example.controller;

import com.example.util.DBConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/movies")
public class MovieListServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Movie> movies = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            // ✅ Select columns that actually exist in your table
            String sql = "SELECT id, title, genre, showtime, poster_url FROM movie";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Movie movie = new Movie();
                movie.setId(rs.getInt("id"));
                movie.setTitle(rs.getString("title"));
                movie.setGenre(rs.getString("genre"));
                movie.setShowtime(rs.getString("showtime"));
                movie.setPosterUrl(rs.getString("poster_url"));
                movies.add(movie);
            }

            req.setAttribute("movies", movies);
            req.getRequestDispatcher("/movies.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }

    // ✅ Simple inner Movie model class (if you deleted model layer)
    public static class Movie {
        private int id;
        private String title;
        private String genre;
        private String showtime;
        private String posterUrl;

        // Getters and Setters
        public int getId() { return id; }
        public void setId(int id) { this.id = id; }

        public String getTitle() { return title; }
        public void setTitle(String title) { this.title = title; }

        public String getGenre() { return genre; }
        public void setGenre(String genre) { this.genre = genre; }

        public String getShowtime() { return showtime; }
        public void setShowtime(String showtime) { this.showtime = showtime; }

        public String getPosterUrl() { return posterUrl; }
        public void setPosterUrl(String posterUrl) { this.posterUrl = posterUrl; }
    }
}