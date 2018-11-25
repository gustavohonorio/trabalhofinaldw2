package livraria.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConectaDB {

	// conecta no banco
	public static Connection getConnection() {
		try {
			Class.forName("org.hsqldb.jdbc.JDBCDriver");

			return DriverManager.getConnection("jdbc:hsqldb:hsql://localhost/livrariadb", "SA", "");
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	// desconecta no banco
	public static void close(Connection conn) {
		try {
			conn.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
