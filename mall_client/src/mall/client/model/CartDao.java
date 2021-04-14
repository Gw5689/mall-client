package mall.client.model;

import java.sql.*;
import java.util.*;


import mall.client.commons.DBUtil;
import mall.client.vo.Cart;

public class CartDao {
	private DBUtil dbUtil;
	public List<Map<String, Object>> selectCartList(String clientMail) {
		this.dbUtil = new DBUtil();
		// 초기화
		Cart returnCart = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();

		//try/catch문
		try { 
			//db 연동
			conn = this.dbUtil.getConnection();
			String sql = "SELECT c.cart_no cartNo, e.ebook_no ebookNo, e.ebook_title ebookTitle, c.cart_date cartDate FROM cart c INNER JOIN ebook e ON c.ebook_no = e.ebook_no WHERE c.client_mail=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, clientMail);
			rs = stmt.executeQuery();
			
			while(rs.next()) { // 반복문 실행
				Map<String, Object> map = new HashMap<>();
				map.put("cartNo", rs.getInt("cartNo"));
				map.put("ebookNo", rs.getInt("ebookNO"));
				map.put("ebookTitle", rs.getString("ebookTitle"));
				map.put("cartDate", rs.getString("cartDate"));
				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace(); // 오류 메세지를 개발자에게 보여줌
		} finally {
			this.dbUtil.close(rs, stmt, conn); // 힙 영역에서 우선적으로 청소
		}
		// 리턴
		return list; 
	}
}
