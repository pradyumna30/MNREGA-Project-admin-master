package mypack;

import java.sql.Connection;
import java.sql.DriverManager;

public class MyCon {

    static private Connection con;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MNREGA", "root", "prady");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws Exception {
        if (con.isClosed()) {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MNREGA", "root", "prady");
        }
        return con;
    }
}
