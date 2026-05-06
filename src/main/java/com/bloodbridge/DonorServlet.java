package com.bloodbridge;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

// Change javax to jakarta for Tomcat 10+
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DonorServlet")
public class DonorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String ageStr = request.getParameter("age");
        String address = request.getParameter("place");
        String phone = request.getParameter("phone");
        String bloodGroup = request.getParameter("blood");
        String lastDonation = request.getParameter("date");

        String sql = "INSERT INTO donors(name, age, address, phone, blood_group, last_donation) VALUES(?,?,?,?,?,?)";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setInt(2, Integer.parseInt(ageStr));
            ps.setString(3, address);
            ps.setString(4, phone);
            ps.setString(5, bloodGroup);
            ps.setString(6, lastDonation);

            ps.executeUpdate();
            response.sendRedirect("success.jsp");

        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}