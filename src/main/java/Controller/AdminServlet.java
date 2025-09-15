// Source Packages/Controller/AdminServlet.java (Admin Dashboard)
package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && "admin".equals(session.getAttribute("role"))) {
            request.setAttribute("pageTitle", "Admin Dashboard - EvoDana");
            request.getRequestDispatcher("/WEB-INF/views/admin/admin.jsp").forward(request, response);
        } else {
            response.sendRedirect("/login");
        }
    }
}