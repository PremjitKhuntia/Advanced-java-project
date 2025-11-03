/*package com.example.dao;
import com.example.model.Movie;
import com.example.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {
  public List<Movie> getAllMovies() throws SQLException {
    List<Movie> list = new ArrayList<>();
    String sql = "SELECT movie_id, title, genre, duration, rating FROM movies";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
      while (rs.next()) {
        Movie m = new Movie();
        m.setMovieId(rs.getInt("movie_id"));
        m.setTitle(rs.getString("title"));
        m.setGenre(rs.getString("genre"));
        m.setDuration(rs.getString("duration"));
        m.setRating(rs.getDouble("rating"));
        list.add(m);
      }
    }
    return list;
  }
}*/