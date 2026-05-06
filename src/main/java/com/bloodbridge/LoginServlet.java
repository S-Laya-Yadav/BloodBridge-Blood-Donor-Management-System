package com.bloodbridge;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// Updated for Tomcat 11 (Jakarta EE)
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String sql = "SELECT name FROM users WHERE email=? AND password=?";

        // try-with-resources ensures Connection, PreparedStatement, and ResultSet are closed
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Login Success
                    String name = rs.getString("name");
                    
                    HttpSession session = request.getSession();
                    session.setAttribute("name", name);
                    session.setAttribute("email", email); // Helpful to keep in session

                    response.sendRedirect("dashboard.jsp");
                } else {
                    // Login Failure
                    // It is better to redirect back with an error message than use getWriter
                    response.sendRedirect("login.jsp?error=invalid");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=db");
        }
    }
}