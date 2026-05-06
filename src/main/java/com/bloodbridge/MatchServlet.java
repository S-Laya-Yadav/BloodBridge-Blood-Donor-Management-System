package com.bloodbridge;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// Switched to jakarta for Tomcat 11
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MatchServlet")
public class MatchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String blood = request.getParameter("blood");
        String place = request.getParameter("place");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Determine SQL logic
        boolean hasPlace = (place != null && !place.isEmpty());
        String sql = hasPlace 
            ? "SELECT * FROM donors WHERE blood_group=? AND address LIKE ?" 
            : "SELECT * FROM donors WHERE blood_group=?";

        // Using try-with-resources to ensure everything closes automatically
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, blood);
            if (hasPlace) {
                ps.setString(2, "%" + place + "%");
            }

            try (ResultSet rs = ps.executeQuery()) {
                out.println("<html><head><title>Donor Results</title></head>");
                out.println("<body style='font-family:sans-serif; text-align:center; background:#e3f2fd; padding:20px;'>");
                out.println("<h2>Available Donors 💙</h2>");
                out.println("<table border='1' style='margin:auto; background:white; border-collapse: collapse; width:80%;'>");
                out.println("<tr style='background:#2196f3; color:white;'><th>Blood Group</th><th>Age</th><th>City</th></tr>");

                boolean found = false;
                while (rs.next()) {
                    found = true;
                    out.println("<tr>");
                    out.println("<td style='padding:10px;'>" + rs.getString("blood_group") + "</td>");
                    out.println("<td style='padding:10px;'>" + rs.getInt("age") + "</td>");
                    out.println("<td style='padding:10px;'>" + rs.getString("address") + "</td>");
                    out.println("</tr>");
                }

                if (!found) {
                    out.println("<tr><td colspan='3' style='padding:20px;'>No donors found for this criteria.</td></tr>");
                }

                out.println("</table>");
                out.println("<br><a href='dashboard.jsp' style='text-decoration:none; color:#2196f3; font-weight:bold;'>← Back to Dashboard</a>");
                out.println("</body></html>");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p style='color:red;'>Database Error: " + e.getMessage() + "</p>");
        }
    }
}