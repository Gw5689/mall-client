package mall.client.model;

import java.sql.*;

import mall.client.commons.DBUtil;
import mall.client.vo.Client;

public class ClientDao { 
	private DBUtil dbUtil;
	
	//회원탈퇴 메소드
	public void deleteClient(String clientMail) {
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		//db연결 insert
		try {
			conn = this.dbUtil.getConnection();
			String sql="DELETE FROM client WHERE client_mail=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, clientMail);
			//디버깅
			System.out.println(stmt+"ClientDao deleteClient stmt");
			stmt.executeUpdate();

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.dbUtil.close(null, stmt, conn);
		}

		}
	
	//비밀번호 변경
	public void updateClientPw(Client client) {
		this.dbUtil = new DBUtil();
		//초기화
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = this.dbUtil.getConnection();
			String sql="UPDATE client SET client_pw=PASSWORD(?) WHERE client_mail=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, client.getClientPw());
			stmt.setString(2, client.getClientMail());
			// 디버깅
			System.out.println(stmt+"<-- CluentDao updateClientPw stmt");
			stmt.executeUpdate();

		} catch(Exception e) {
			e.printStackTrace(); // 오류메세지를 개발자에게 보여줌
		} finally { // 힙 영역에서 우선적으로 청소
			this.dbUtil.close(null, stmt, conn);
		}
	}
	
	public Client selectClientOne(String clientMail) {
		Client returnClient = new Client();
		this.dbUtil = new DBUtil();
		// 초기화 
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dbUtil.getConnection();
			String sql = "SELECT client_no clientNo, client_mail clientMail, client_date clientDate FROM client WHERE client_mail=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, clientMail);
			// 디버깅
			System.out.println(stmt+"<-- CluentDao selectClientOne stmt");
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				returnClient.setClientNo(rs.getInt("client_no"));
				returnClient.setClientMail(rs.getString("client_mail"));
				returnClient.setClientDate(rs.getString("client_date"));
			}
		} catch(Exception e) {
			e.printStackTrace(); // 오류메세지를 개발자에게 보여줌
		} finally { // 힙 영역에서 우선적으로 청소
			this.dbUtil.close(rs, stmt, conn);
		}
		return returnClient;
	}
	
	// 회원가입 메소드 (DB삽입)
	public int insertClient(Client client) {
		this.dbUtil = new DBUtil();
		int rowCnt = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {  //db연동
			conn = this.dbUtil.getConnection();
			String sql = "INSERT INTO client(client_mail, client_pw, client_date) VALUES (?,PASSWORD(?),NOW())";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, client.getClientMail());
			stmt.setString(2, client.getClientPw());
			// 디버깅
			System.out.println(stmt+"<--ClientDao insertClient");
			stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace(); // 오류메세지를 개발자에게 보여줌
		} finally {
			this.dbUtil.close(null, stmt, conn);
		}
		// 리턴
		return rowCnt;
		}
	
	// 회원가입 이메일 중복검사
	public String selectClientMail(String clientMail) {
		this.dbUtil = new DBUtil();
		// 초기화
		String returnClientMail = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			//DB 연동
			conn = this.dbUtil.getConnection();
			String sql = "SELECT client_mail FROM client WHERE client_mail=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, clientMail);
			// 디버깅
			System.out.println(stmt+"<--ClientDao selectClientMail");
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				returnClientMail = rs.getString("client_mail");
			}
		} catch (Exception e) { // 오류 메세지를 개발자에게 보여줌
			e.printStackTrace();
		} finally { // 힙 영역에서 우선적으로 청소
			this.dbUtil.close(rs, stmt, conn);
		}
		// 리턴
		return returnClientMail;
	}
	
	// 로그인 메소드
	public Client login(Client client) {
		this.dbUtil = new DBUtil();
		// 초기화
		Client returnClient = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dbUtil.getConnection();
			String sql = "SELECT client_mail clientMail FROM client WHERE client_mail=? AND client_pw=PASSWORD(?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, client.getClientMail());
			stmt.setString(2, client.getClientPw());
			System.out.println(stmt+"<--ClientDao login Stmt");
			rs = stmt.executeQuery();
			
			if(rs.next()) { 
				returnClient = new Client();
				returnClient.setClientMail(rs.getString("clientMail"));
			}
		} catch(Exception e) { // 오류메세지를 개발자에게 보여줌
			e.printStackTrace();
		} finally { // 힙 영역에서 우선적으로 청소
			this.dbUtil.close(rs, stmt, conn);
		}
		// 리턴값
		return returnClient;
	}
}
