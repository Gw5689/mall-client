package mall.client.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mall.client.commons.DBUtil;
import mall.client.vo.Client;
import mall.client.vo.Orders;

public class OrdersDao {
	private DBUtil dbUtil;
	
	//
	public int totalCount(Client client) {
		int cnt = 0;
		//전처리
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		//db연결
		try {
			conn = this.dbUtil.getConnection();
			String sql ="SELECT COUNT(*) cnt From orders WHERE client_no = ? ";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, client.getClientNo());
			System.out.printf("stmt: %s<OrdersDao.totalCount()>\n", stmt);
			rs = stmt.executeQuery();

			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.dbUtil.close(rs, stmt, conn);
		}

		return cnt;
	}
	
	public List<Map<String, Object>> selectOrdersListByClient(int beginRow, int rowPerPage,Client client) {
		List<Map<String, Object>> list = new ArrayList<>(); // 다형성
		this.dbUtil = new DBUtil();
		// 초기화
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dbUtil.getConnection();
			String sql = "SELECT o.orders_no ordersNo, o.ebook_no ebookNo, o.orders_state ordersState, e.ebook_title ebookTitle, e.ebook_price ebookPrice, o.orders_date ordersDate FROM orders o INNER JOIN ebook e ON o.ebook_no = e.ebook_no WHERE o.client_no=? ORDER BY o.orders_date DESC LIMIT ?,?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, client.getClientNo());
			stmt.setInt(2, beginRow);
			stmt.setInt(3, rowPerPage);
			//디버깅
			System.out.println(stmt+"<--OrdersDao selectOrdersListByClient stmt");
			rs = stmt.executeQuery();
			
			
			// 반복문 실행
			while(rs.next()) { 
				Map<String, Object> map = new HashMap<>();
				map.put("ordersNo", rs.getInt("ordersNo"));
				map.put("ebookNo", rs.getInt("ebookNo"));
				map.put("ordersDate", rs.getString("ordersDate"));
				map.put("ordersState", rs.getString("ordersState"));
				map.put("ebookTitle", rs.getString("ebookTitle"));
				map.put("ebookPrice", rs.getInt("ebookPrice"));
				list.add(map);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.dbUtil.close(rs, stmt, conn);
		}
		
		return list;
	}
	
	public int insertOrders(Orders orders) {
		this.dbUtil = new DBUtil();
		// 초기화
		int rowCnt = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = this.dbUtil.getConnection();
			String sql = "INSERT INTO orders(ebook_no, client_no, orders_date, orders_state) VALUES(?, ?, NOW(), '주문완료')";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, orders.getEbookNo());
			stmt.setInt(2, orders.getClientNo());
			//디버깅
			System.out.println(stmt+"<--OrdersDao insertOrders stmt");
			rowCnt = stmt.executeUpdate();
		} catch(Exception e) { // 예외 발생시 시스템을 멈추고 함수호출스택구조를 콘솔에 출력함
			e.printStackTrace(); 
		} finally {
			this.dbUtil.close(null, stmt, conn);
		}
		
		return rowCnt;
	}
}
