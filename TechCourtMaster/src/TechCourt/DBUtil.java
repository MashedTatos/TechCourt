package TechCourt;
import java.sql.*;

import javax.servlet.http.HttpServletRequest;
public class DBUtil {

	
	private Connection conn = null;
	
	public Connection getConnection(HttpServletRequest request) {
		try {
			
			String username = request.getSession().getServletContext().getInitParameter("SQLUsername");
			String password = request.getSession().getServletContext().getInitParameter("SQLPassword");
			String database = request.getSession().getServletContext().getInitParameter("SQLDatabase");
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(database, username, password);
			
		}
		catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public void closeConnection(Connection conn) {
		try {
			conn.close();
		} 
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}

