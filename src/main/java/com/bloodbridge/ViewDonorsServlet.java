package com.bloodbridge;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// Jakarta imports for Tomcat 11
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ViewDonorsServlet")
public class ViewDonorsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String place = request.getParameter("place");
        String age = request.getParameter("age");
        String blood = request.getParameter("blood");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // 1. Build the Dynamic SQL safely using PreparedStatements
        StringBuilder sql = new StringBuilder("SELECT * FROM donors WHERE 1=1");
        List<Object> params = new ArrayList<>();

        if (place != null && !place.isEmpty()) {
            sql.append(" AND address LIKE ?");
            params.add("%" + place + "%");
        }
        if (age != null && !age.isEmpty()) {
            sql.append(" AND age = ?");
            params.add(Integer.parseInt(age));
        }
        if (blood != null && !blood.isEmpty()) {
            sql.append(" AND blood_group = ?");
            params.add(blood);
        }

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql.toString())) {

            // 2. Set parameters dynamically
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            try (ResultSet rs = ps.executeQuery()) {
                out.println("<html><body style='font-family:sans-serif; text-align:center; background:#e3f2fd; padding:20px;'>");
                out.println("<h2>All Registered Donors 💙</h2>");
                out.println("<table border='1' style='margin:auto; background:white; border-collapse:collapse; width:90%;'>");
                out.println("<tr style='background:#f44336; color:white;'><th>Name</th><th>Age</th><th>Place</th><th>Phone</th><th>Blood Group</th></tr>");

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td style='padding:8px;'>" + rs.getString("name") + "</td>");
                    out.println("<td style='padding:8px;'>" + rs.getInt("age") + "</td>");
                    out.println("<td style='padding:8px;'>" + rs.getString("address") + "</td>");
                    out.println("<td style='padding:8px;'>" + rs.getString("phone") + "</td>");
                    out.println("<td style='padding:8px;'>" + rs.getString("blood_group") + "</td>");
                    out.println("</tr>");
                }

                out.println("</table>");
                out.println("<br><a href='dashboard.jsp' style='color:#f44336; font-weight:bold;'>← Back</a>");
                out.println("</body></html>");
            }

        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            out.println("<p style='color:red;'>Error fetching data. Please check your inputs.</p>");
        }
    }
}