package application;

import java.sql.*;

public class DBHandler {
	
	static String account = "gchinaconnectc"; // replace with your account
	static String password = "sheicohl"; // replace with your password
	static String server = "mysql-user.stanford.edu";
	static String database = "g_chinaconnect_ceowebsite"; // replace with your db
	private Statement stmt;
	
	public DBHandler() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection
					( "jdbc:mysql://" + server, account ,password);
			stmt = con.createStatement();
			stmt.executeQuery("USE " + database);
//			ResultSet rs = stmt.executeQuery("SELECT * FROM 229url");
//			while(rs.next()) {
//				String name = rs.getString("url");
//				System.out.println(name);
//			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	/**
	 * Takes sql query and execute
	 * @param sql query
	 */
	public ResultSet executeQueryCmd(String sql) {
		try {
			return stmt.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} 
	}
	
	/**
	 * Take sql update and execute
	 * @param sql update
	 * @return
	 */
	public int executeUpdateCmd(String sql) {
		try {
			return stmt.executeUpdate(sql);			
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} 
	}
}