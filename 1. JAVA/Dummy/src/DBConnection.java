import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection 
{
    public static Connection dbConn;
    
        public static Connection getConnection()
        {
            Connection conn = null;
           
    		try {
    			String driver = "oracle.jdbc.driver.OracleDriver";
	    	    String url = "jdbc:oracle:thin:@211.63.89.53:1521:xe";
	    	    String user = "project";
	    	    String password = "java1234";
    			Class.forName(driver);
    			System.out.println("jdbc driver 로딩 성공");
    			conn = DriverManager.getConnection(url, user, password);
    			System.out.println("오라클 연결 성공");
    		} catch (ClassNotFoundException e) {
    			System.out.println("jdbc driver 로딩 실패");
    		} catch (SQLException e) {
    			System.out.println("오라클 연결 실패");
    		}
			return conn;
        }
}