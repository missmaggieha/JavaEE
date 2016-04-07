package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import model.UserDao;

/**
 * Servlet implementation class SignIn_Servlet
 */
@WebServlet("/SIS")
public class SignIn_Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDao dao;
    public SignIn_Servlet() {
        super();
        dao = new UserDao();
    }

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {

        // get request parameters for email and password
        String email = request.getParameter("email");
        String pwd = request.getParameter("password");

        // store data in User object
        User user = new User();
        user.setEmail(email);
        user.setPassword(pwd);

        // check the email and password from database
        boolean pass = false;
        try {
            pass = dao.CkeckUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (pass) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            // setting session to expire in 30 minutes
            session.setMaxInactiveInterval(30 * 60);

            Cookie emailCookie = new Cookie("emailCookie", user.getEmail());
            emailCookie.setMaxAge(30 * 60);
            response.addCookie(emailCookie);

            // "session" is not lost in both forward and redirect.
            if (user.getRole() == 1) {
                response.sendRedirect("admin/home.jsp");
            } else if (user.getRole() == 2) {
                response.sendRedirect("student/home.jsp");
            }

        } else {
            RequestDispatcher rd = getServletContext().getRequestDispatcher(
                    "/signIn.jsp");
            PrintWriter out = response.getWriter();
            out.println("<p style=\"color:red;\">Either email or password is wrong. "
                    + "Please try again.</p>");
            rd.include(request, response);
        }
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}