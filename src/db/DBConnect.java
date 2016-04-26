package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static final String JDBC = "jdbc:mysql://133.130.88.202/hanbit";
	private static final String ID = "scott";
	private static final String PW = "tiger";
	private static final String FORNAME = "com.mysql.jdbc.Driver";
	private static Connection connection;

	/**
	 * DB Connect
	 * 
	 * @Connetion
	 */

	public static Connection get() {
		try {
			Class.forName(FORNAME);
			connection = DriverManager.getConnection(JDBC, ID, PW);
		} catch (Exception e) {
			e.getMessage();
		}

		return connection;
	}

}
