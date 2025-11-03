/*package com.example.dao;
import com.example.model.Seat;
import com.example.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SeatDAO {
  public List<Seat> getSeatsByShow(int showId) throws SQLException {
    List<Seat> list = new ArrayList<>();
    String sql = "SELECT seat_id, show_id, seat_no, is_booked FROM seats WHERE show_id=? ORDER BY seat_no";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
      ps.setInt(1, showId);
      try (ResultSet rs = ps.executeQuery()) {
        while (rs.next()) {
          Seat st = new Seat();
          st.setSeatId(rs.getInt("seat_id"));
          st.setShowId(rs.getInt("show_id"));
          st.setSeatNo(rs.getString("seat_no"));
          st.setBooked(rs.getInt("is_booked") == 1);
          list.add(st);
        }
      }
    }
    return list;
  }
}*/