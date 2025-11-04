package com.example.controller;

import com.example.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/login")  
public class LoginServlet extends HttpServlet {

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Driver loaded for login!");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE email=? AND password=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
               
                HttpSession session = request.getSession();
                session.setAttribute("userId", rs.getInt("id")); 
                session.setAttribute("username", rs.getString("username"));

                out.println("<h3>Login successful! Welcome, " + rs.getString("username") + "</h3>");
                out.println("<p><a href='movies.jsp'>Go to Movies</a></p>");
            } else {
                out.println("<h3>❌ Invalid email or password!</h3>");
                out.println("<p><a href='login.jsp'>Try again</a></p>");
            }

        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }
}