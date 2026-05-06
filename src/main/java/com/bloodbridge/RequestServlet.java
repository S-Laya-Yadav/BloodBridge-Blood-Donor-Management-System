package com.bloodbridge;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

// Switched to jakarta for Tomcat 11
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RequestServlet")
public class RequestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String blood = request.getParameter("blood");
        String city = request.getParameter("city");

        // Basic validation
        if (blood == null || city == null || blood.isEmpty() || city.isEmpty()) {
            response.sendRedirect("request.jsp?error=invalid");
            return;
        }

        // SQL using NOW() for the date and a placeholder for user_id
        String sql = "INSERT INTO requests(user_id, blood_group, city, request_date) VALUES(1, ?, ?, NOW())";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, blood);
            ps.setString(2, city);

            ps.executeUpdate();

            // Better to redirect to a success page or dashboard than just printing text
            response.sendRedirect("dashboard.jsp?msg=requested");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("request.jsp?error=db");
        }
    }
}