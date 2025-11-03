/*package com.example.dao;
import com.example.util.DBConnection;
import java.sql.*;

public class BookingDAO {
  // Return true if booked successfully
  public boolean bookSeat(int userId, int showId, String seatNo) throws SQLException {
    String checkSql = "SELECT is_booked FROM seats WHERE show_id=? AND seat_no=? FOR UPDATE";
    String updateSeat = "UPDATE seats SET is_booked=1 WHERE show_id=? AND seat_no=?";
    String insertBooking = "INSERT INTO bookings (user_id, show_id, seat_no) VALUES (?,?,?)";

    try (Connection conn = DBConnection.getConnection()) {
      try {
        conn.setAutoCommit(false);
        try (PreparedStatement ps = conn.prepareStatement(checkSql)) {
          ps.setInt(1, showId);
          ps.setString(2, seatNo);
          try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
              boolean booked = rs.getInt("is_booked") == 1;
              if (booked) {
                conn.rollback();
                return false; // already booked
              }
            } else {
              conn.rollback();
              return false; // seat does not exist
            }
          }
        }
        try (PreparedStatement ps2 = conn.prepareStatement(updateSeat)) {
          ps2.setInt(1, showId);
          ps2.setString(2, seatNo);
          ps2.executeUpdate();
        }
        try (PreparedStatement ps3 = conn.prepareStatement(insertBooking)) {
          ps3.setInt(1, userId);
          ps3.setInt(2, showId);
          ps3.setString(3, seatNo);
          ps3.executeUpdate();
        }
        conn.commit();
        return true;
      } catch (SQLException ex) {
        conn.rollback();
        throw ex;
      } finally {
        conn.setAutoCommit(true);
      }
    }
  }
}*/