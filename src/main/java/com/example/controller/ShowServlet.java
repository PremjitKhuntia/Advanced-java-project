/*package com.example.controller;
import com.example.dao.ShowDAO;
import com.example.model.Show;
import javax.servlet.*; import javax.servlet.http.*; import javax.servlet.annotation.WebServlet;
import java.io.IOException; import java.util.List;

@WebServlet("/shows")
public class ShowServlet extends HttpServlet {
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    int movieId = Integer.parseInt(req.getParameter("movieId"));
    try {
      ShowDAO dao = new ShowDAO();
      List<Show> shows = dao.getShowsByMovie(movieId);
      req.setAttribute("shows", shows);
      req.getRequestDispatcher("/shows.jsp").forward(req, resp);
    } catch (Exception e) {
      e.printStackTrace();
      req.setAttribute("error", e.getMessage());
      req.getRequestDispatcher("/error.jsp").forward(req, resp);
    }
  }
}*/