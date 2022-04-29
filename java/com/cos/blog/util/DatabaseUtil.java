package com.cos.blog.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {

    public static Connection getConnection() {
        try {
            String dbURL = "jdbc:mariadb://192.168.48.128:3306/myDBA";
            String dbID = "TEST";
            String dbPassword = "TEST";
            Class.forName("org.mariadb.jdbc.Driver");
            return DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }


}
