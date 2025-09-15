package Controller;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); // Đảm bảo mã hóa UTF-8 cho request
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String secretKey = request.getParameter("secretKey");

        HttpSession session = request.getSession();
        if ("demo".equals(username) && "demo".equals(password)) {
            session.setAttribute("currentUser", new User("demo", "demo@example.com", "customer"));
            response.sendRedirect(request.getContextPath() + "/dashboard");
        } else if ("staff".equals(username) && "staff123".equals(password)) {
            session.setAttribute("currentUser", new User("staff", "staff@example.com", "staff"));
            response.sendRedirect(request.getContextPath() + "/staff");
        } else if ("admin".equals(username) && "admin123".equals(password) && "secretadmin".equals(secretKey)) {
            session.setAttribute("currentUser", new User("admin", "admin@example.com", "admin"));
            response.sendRedirect(request.getContextPath() + "/admin");
        } else {
            request.setAttribute("error", "Invalid username or password. Try 'admin'/'admin123' with 'secretadmin' as secret key.");
            request.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Login Servlet";
    }

    // Simple User class for session
    public static class User {
        private String username, email, role;

        public User(String username, String email, String role) {
            this.username = username;
            this.email = email;
            this.role = role;
        }

        public String getUsername() { return username; }
        public String getEmail() { return email; }
        public String getRole() { return role; }
    }
}