package in.co.rays.proj4.util;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * 
 * JDBC datasource is a Data Connection Pool;
 * 
 * @author Arvind
 * @version 1.0
 */
public final class JDBCDataSource {
ResourceBundle rb = ResourceBundle.getBundle("in.co.rays.proj4.bundle.system");
String driver = rb.getString("driver");
String url = rb.getString("url");
String username = rb.getString("username");
String password = rb.getString("password");
int initialPoolSize = Integer.parseInt(rb.getString("initialPoolSize"));
int acquireIncrement = Integer.parseInt(rb.getString("acquireIncrement"));
int maxPoolSize = Integer.parseInt(rb.getString("maxPoolSize"));
int minPoolSize = Integer.parseInt(rb.getString("minPoolSize"));
int timeout =Integer.parseInt(rb.getString("timeout"));


//Data Source factory
private static JDBCDataSource jds = null;

private ComboPooledDataSource ds = null;

private JDBCDataSource() {
	try{
		ds = new ComboPooledDataSource();
		ds.setDriverClass(driver);
		ds.setJdbcUrl(url);
		ds.setUser(username);
		ds.setPassword(password);
		ds.setInitialPoolSize(initialPoolSize);
		ds.setAcquireIncrement(acquireIncrement);
		ds.setMinPoolSize(minPoolSize);
		ds.setMaxPoolSize(maxPoolSize);
		ds.setMaxIdleTime(timeout);
	} catch (PropertyVetoException e){
		e.printStackTrace();
	}
}
public static JDBCDataSource getInstance() {
	if(jds == null ){
		jds = new JDBCDataSource();
	}
	return jds;
}
public static Connection getConnection(){
	try{
		return getInstance().ds.getConnection();
	} catch (SQLException e){
		return null;
	}
}
public static void closeConnection(Connection conn,PreparedStatement ps,ResultSet rs){
	try{
		if(rs != null) rs.close();
		if(ps != null) ps.close();
		if(conn != null) conn.close();
	} catch (SQLException e){
		e.printStackTrace();
	}
}
public static void closeConnection(Connection conn,PreparedStatement ps){
	closeConnection(conn,ps,null);
}

/**
 * @param conn
 */
public static void closeConnection(Connection conn){
	closeConnection(conn,null,null);
}
}
