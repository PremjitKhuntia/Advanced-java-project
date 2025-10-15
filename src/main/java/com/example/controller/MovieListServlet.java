package com.example.controller;
import com.example.dao.MovieDAO;
import com.example.model.Movie;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/movies")
public class MovieListServlet extends HttpServlet {
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
      MovieDAO dao = new MovieDAO();
      List<Movie> movies = dao.getAllMovies();
      req.setAttribute("movies", movies);
      req.getRequestDispatcher("/movies.jsp").forward(req, resp);
    } catch (Exception e) {
      e.printStackTrace();
      req.setAttribute("error", e.getMessage());
      req.getRequestDispatcher("/error.jsp").forward(req, resp);
    }
  }
}