package mainTaskJDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDatabase {
	String url;
	String username;
	String password;
	public ConnectDatabase(){
		String driver ="com.microsoft.sqlserver.jdbc.SQLServerDriver";
		url="jdbc:sqlserver://GOKING;databaseName=TPO;trustServerCertificate=true;encrypt=false;IntegratedSecurity=false";
		username = "sa";
		password = "1111";
		try {
			Class.forName(driver).getDeclaredConstructor().newInstance();
		}
		catch (Exception ex){
			ex.printStackTrace();
		}
	}
	public Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url,username,password);
	}
	
}