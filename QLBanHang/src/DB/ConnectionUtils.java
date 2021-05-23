package DB;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import static DB.MySQLConnection.getMySQLConnection;

public class ConnectionUtils {

	public static Connection getConnection() {
		Connection conn = null;
		try {
//			conn = SQLServerConnUtils_SQLJDBC.getSQLServerConnection_SQLJDBC();
			conn = getMySQLConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(conn);
		return conn;
	}

	public static void closeQuietly(Connection conn) {
		try {
			conn.close();
		} catch (Exception e) {
		}
	}

	public static void rollbackQuietly(Connection conn) {
		try {
			conn.rollback();
		} catch (Exception e) {
		}
	}

//    public static void main(String[] args) {
//    	try {
//    		System.out.print(new ConnectionUtils().getConnection());
//			Connection conn = getMySQLConnection();
//			Statement stmt = conn.createStatement();
//			// get data from table 'student'
//			ResultSet rs = stmt.executeQuery("select * from category");
//			// show data
//			while (rs.next()) {
//				System.out.println(rs.getInt(1) + "  " + rs.getString(2));
//			}
//			// close connection
//			conn.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//    }
}