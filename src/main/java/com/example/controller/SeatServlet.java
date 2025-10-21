package com.example.controller;

import com.example.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SeatServlet")
public class SeatServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        String[] seats = request.getParameterValues("seats");
        String movieId = (String) session.getAttribute("movieId");
        Integer userId = (Integer) session.getAttribute("userId"); 

        if (seats == null && movieId == null && userId == null) {
            out.println("<h3>❌ Invalid booking request!</h3>");
            return;
        }

        
        String selectedSeats = String.join(",", seats);

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO bookings(user_id, movie_id, seats) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setInt(2, Integer.parseInt(movieId));
            stmt.setString(3, selectedSeats);

            int rows = stmt.executeUpdate();

            if (rows > 0) {
                out.println("<h3>✅ Booking Successful!</h3>");
                out.println("<p>Movie ID: " + movieId + "</p>");
                out.println("<p>Seats: " + selectedSeats + "</p>");
            } else {
                out.println("<h3>❌ Booking Failed!</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }
}