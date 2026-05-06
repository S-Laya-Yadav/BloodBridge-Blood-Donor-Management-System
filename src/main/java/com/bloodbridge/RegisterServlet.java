package com.bloodbridge;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

// Changed javax to jakarta for Tomcat 11 compatibility
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Retrieve parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // 2. Basic validation
        if (name == null || email == null || password == null || name.trim().isEmpty()) {
            response.sendRedirect("register.jsp?error=missingFields");
            return;
        }

        String sql = "INSERT INTO users(name, email, password) VALUES(?, ?, ?)";

        // 3. Try-with-resources (Automatic closing of Connection and PreparedStatement)
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password); // Reminder: Consider hashing this for security!

            int rowCount = ps.executeUpdate();

            if (rowCount > 0) {
                response.sendRedirect("login.jsp?status=success");
            } else {
                response.sendRedirect("register.jsp?status=failed");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Logging the error and informing the user
            response.sendRedirect("register.jsp?error=dbError");
        }
    }
}