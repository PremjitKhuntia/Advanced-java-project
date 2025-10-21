package com.example.controller;

import com.example.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/BookTicketServlet")
public class BookTicketServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String movieIdStr = request.getParameter("movieId");
        String[] seatsArr = request.getParameterValues("seat"); // array of selected seats

        if (movieIdStr == null && seatsArr == null && seatsArr.length == 0) {
            out.println("<h3>❌ No seats selected!</h3>");
            return;
        }

        int movieId = Integer.parseInt(movieIdStr);
        String seats = String.join(",", seatsArr); 

        // ✅ Get logged-in userId from session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            out.println("<h3>⚠️ Please login first!</h3>");
            out.println("<p><a href='login.jsp'>Go to Login</a></p>");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO bookings (user_id, movie_id, seats) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setInt(2, movieId);
            stmt.setString(3, seats);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                out.println("<h3>🎉 Booking successful!</h3>");
                out.println("<p>Seats: " + seats + "</p>");
                out.println("<a href='movies.jsp'>Back to Movies</a>");
            } else {
                out.println("<h3>❌ Booking failed!</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }
}