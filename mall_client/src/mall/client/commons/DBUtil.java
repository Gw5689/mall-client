package mall.client.commons;

import java.sql.*;

public class DBUtil {
	// 1. 마리아db 연결
	public Connection getConnection() {
		Connection conn = null;
		
		try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mall","root","java1004");
		} catch (Exception e) {
			e.printStackTrace(); // 예외가 나면 예외 메세지를 띄워준다. (예외 메세지가 안뜬다면 에러가 났는지 모름)
		}
		return conn;
	}
	
	// 2. db자원 (conn, stmt, rs) 해제 , 모든 참조타입은 힙 영역에 만들어지고 힙 영역에 만들어진 것은 청소된다. 이때 먼저 청소해야 할 것들을 먼저 청소해야 함.
	public void close(ResultSet rs, PreparedStatement stmt, Connection conn) {	// 예외처리 할 수 있게 만듦.
		if(rs != null) { // null이 아닐때만 close
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
				}
		}
		if(stmt != null) {
			try {
				stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
