// Source Packages/Controller/RenterServlet.java (Staff Dashboard)
package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/staff")
public class RenterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && "staff".equals(session.getAttribute("role"))) {
            request.setAttribute("pageTitle", "Staff Dashboard - EvoDana");
            request.getRequestDispatcher("/WEB-INF/views/renter/renter.jsp").forward(request, response);
        } else {
            response.sendRedirect("/login");
        }
    }
}