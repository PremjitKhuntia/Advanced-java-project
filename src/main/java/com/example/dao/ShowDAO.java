package com.example.dao;
import com.example.model.Show;
import com.example.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ShowDAO {
  public List<Show> getShowsByMovie(int movieId) throws SQLException {
    List<Show> list = new ArrayList<>();
    String sql = "SELECT show_id, movie_id, show_date, show_time, hall_no FROM shows WHERE movie_id=?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
      ps.setInt(1, movieId);
      try (ResultSet rs = ps.executeQuery()) {
        while (rs.next()) {
          Show s = new Show();
          s.setShowId(rs.getInt("show_id"));
          s.setMovieId(rs.getInt("movie_id"));
          s.setShowDate(rs.getDate("show_date"));
          s.setShowTime(rs.getTime("show_time"));
          s.setHallNo(rs.getInt("hall_no"));
          list.add(s);
        }
      }
    }
    return list;
  }
}