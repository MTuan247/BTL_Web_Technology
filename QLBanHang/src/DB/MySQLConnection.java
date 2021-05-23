package DB;

import java.sql.*;

public class MySQLConnection {
    private static String DB_URL = "jdbc:mysql://localhost:3306/testdb";
    private static String USER_NAME = "root";
    private static String PASSWORD = "032020292";

    public static Connection getMySQLConnection() {

        String dbURL = DB_URL;
        String userName = USER_NAME;
        String password = PASSWORD;

        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, userName, password);
            System.out.println("connect successfully!");
        } catch (Exception ex) {
            System.out.println("connect failure!");
            ex.printStackTrace();
        }
        return conn;
    }

//    public static void main(String[] args) throws SQLException {
//        Connection conn = getMySQLConnection();
//        Statement stmt = conn.createStatement();
//        // get data from table 'student'
//        ResultSet rs = stmt.executeQuery("select * from category");
//        // show data
//        while (rs.next()) {
//            System.out.println(rs.getInt(1) + "  " + rs.getString(2));
//        }
//        // close connection
//        conn.close();
//    }
}
