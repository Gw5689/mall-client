package mall.client.model;

import java.sql.*;
import java.util.*;


import mall.client.commons.DBUtil;
import mall.client.vo.Cart;

public class CartDao {
	private DBUtil dbUtil;
	
	// 회원탈퇴를 위한 장바구니 삭제 메소드
	public void deleteCartByClient(String clientMail) {
		this.dbUtil = new DBUtil();
		//초기화
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = this.dbUtil.getConnection();
			String sql = "DELETE from cart WHERE client_mail =?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, clientMail);
			//디버깅
			System.out.println(stmt+"CartDao deleteCartByClient stmt");
			stmt.executeUpdate();			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.dbUtil.close(null, stmt, conn);
		}

	}
	
	public int deleteCart(Cart cart) {
		int rowCnt = 0;
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try { 
			//db 연동
			conn = this.dbUtil.getConnection();
			String sql = "DELETE FROM cart WHERE ebook_no=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, cart.getEbookNo());
			//디버깅
			System.out.println(stmt+"<-- CartDao deleteCart stmt");
			rowCnt = stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace(); // 오류 메세지를 개발자에게 보여줌
		} finally {
			this.dbUtil.close(null, stmt, conn); // 힙 영역에서 우선적으로 청소
		}
		
		return rowCnt;
	}
	
	public boolean selectClientMail(Cart cart) {
		boolean flag = true; // true 면 중복없음 (사용가능)
		this.dbUtil = new DBUtil();
		// 초기화
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		//try/catch문
		try { 
			//db 연동
			conn = this.dbUtil.getConnection();
			String sql = "SELECT * FROM cart WHERE client_mail=? AND ebook_no=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, cart.getClientMail());
			stmt.setInt(2, cart.getEbookNo());
			// 디버깅
			System.out.println(stmt+"<--CartDao selectClientMail stmt");
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				flag=false; // fales면 중복된 ebook이 있다.
			}
		} catch (Exception e) {
			e.printStackTrace(); // 오류 메세지를 개발자에게 보여줌
		} finally {
			this.dbUtil.close(rs, stmt, conn); // 힙 영역에서 우선적으로 청소
		}
		// 리턴
		return flag;
	}
	
	public int insertCart(Cart cart) {
		int rowCnt = 0;
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try { 
			//db 연동
			conn = this.dbUtil.getConnection();
			String sql = "INSERT INTO cart(client_mail, ebook_no, cart_date) VALUES(?,?,NOW())";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, cart.getClientMail());
			stmt.setInt(2, cart.getEbookNo());
			//디버깅
			System.out.println(stmt+"<-- CartDao insertCart stmt");
			rowCnt = stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace(); // 오류 메세지를 개발자에게 보여줌
		} finally {
			this.dbUtil.close(null, stmt, conn); // 힙 영역에서 우선적으로 청소
		}
		
		return rowCnt;
	}
	
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
