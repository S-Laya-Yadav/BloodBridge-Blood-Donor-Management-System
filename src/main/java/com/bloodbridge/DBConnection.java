package com.bloodbridge;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // Database credentials
    private static final String URL = "jdbc:mysql://localhost:3306/blood_db?useSSL=false&allowPublicKeyRetrieval=true";
    private static final String USER = "root";
    private static final String PASSWORD = "Laya@2005"; // Ensure this is correct!
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";

    public static Connection getConnection() {
        Connection con = null;
        try {
            // Explicitly load the driver
            Class.forName(DRIVER);
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found! Did you add the JAR to WEB-INF/lib?");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Connection Failed! Check if MySQL is running and credentials are correct.");
            e.printStackTrace();
        }
        return con;
    }
}