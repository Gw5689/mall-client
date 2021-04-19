package mall.client.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mall.client.commons.DBUtil;
import mall.client.vo.Ebook;

public class EbookDao {
	// 마리아db 연동
	private DBUtil dbUtil;
	
	public List<Map<String, Object>> selectEbookListByMonth(int year, int month) {
		List<Map<String, Object>> list = new ArrayList<>();
		this.dbUtil = new DBUtil();
		//초기화
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = this.dbUtil.getConnection();
			String sql = "SELECT ebook_no ebookNo, ebook_title ebookTitle, DAY(ebook_date) d FROM ebook WHERE YEAR(ebook_date) = ? AND MONTH(ebook_date) = ? ORDER BY day(ebook_date) ASC";
			stmt = conn.prepareStatement(sql);	
			stmt.setInt(1, year);
			stmt.setInt(2, month);
			// 디버깅
			System.out.println(stmt+"EbookDao selectEbookListByDay stmt");
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> map = new HashMap<>();
				map.put("ebookNo", rs.getInt("ebookNo"));
				map.put("ebookTitle", rs.getString("ebookTitle"));
				map.put("d", rs.getInt("d"));
				list.add(map);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {//try절에서 예외가 발생해서 catch절로 가든 가지 않던 finally는 실행된다.
			System.out.println(stmt);
			this.dbUtil.close(rs, stmt, conn);
		}
		return list;
	}
	
	
	// 검색 키워드 ebook 목록
	public List<Ebook> selectSearchEbookListByPage(int beginRow, int rowPerPage, String searchWord){
		List<Ebook> list = new ArrayList<>();
		this.dbUtil = new DBUtil();
		//초기화
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = this.dbUtil.getConnection();

				String sql = "SELECT ebook_no ebookNo, ebook_title ebookTitle, ebook_price ebookPrice FROM ebook WHERE ebook_title like ? ORDER BY ebook_date DESC LIMIT ?,?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%"+searchWord+"%");
				stmt.setInt(2, beginRow);
				stmt.setInt(3, rowPerPage);	
				System.out.println(stmt+"EbookDao selectSearchEbookListByPage stmt");

			rs = stmt.executeQuery();
			while(rs.next()) {
				Ebook ebook = new Ebook();
				ebook.setEbookNo(rs.getInt("ebookNo"));
				ebook.setEbookTitle(rs.getString("ebookTitle"));
				ebook.setEbookPrice(rs.getInt("ebookPrice"));
				list.add(ebook);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {//try절에서 예외가 발생해서 catch절로 가든 가지 않던 finally는 실행된다.
			System.out.println(stmt);
			this.dbUtil.close(rs, stmt, conn);
		}
		return list;
	}
	
	// 페이지별 ebook목록
	public List<Ebook> selectEbookListByPage(int beginRow, int rowPerPage, String categoryName){
		this.dbUtil = new DBUtil();
		List<Ebook> list = new ArrayList<>();
		// 초기화
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dbUtil.getConnection();
			if(categoryName == null) { // 카테고리 없음
				String sql = "SELECT ebook_no ebookNo, ebook_title ebookTitle, ebook_price ebookPrice FROM ebook ORDER BY ebook_date DESC LIMIT ?,?";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, beginRow);
				stmt.setInt(2, rowPerPage);

			} else {// 카테고리 있음
				String sql = "SELECT ebook_no ebookNo, ebook_title ebookTitle, ebook_price ebookPrice FROM ebook WHERE category_name=? ORDER BY ebook_date DESC LIMIT ?,?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, categoryName);
				stmt.setInt(2, beginRow);
				stmt.setInt(3, rowPerPage);	
			}
			//디버깅
			System.out.println(stmt+"EbookDao selectEbookListByPage stmt");
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Ebook ebook = new Ebook();
				ebook.setEbookNo(rs.getInt("ebookNo"));
				ebook.setEbookTitle(rs.getString("ebookTitle"));
				ebook.setEbookPrice(rs.getInt("ebookPrice"));
				list.add(ebook);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.dbUtil.close(rs, stmt, conn);
		}
		return list;
	}
	
	// 전체 - 검색어
	public int searchTotalCount(String searchWord) {
		this.dbUtil = new DBUtil();
		//초기화
		int totalCnt = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dbUtil.getConnection();
			String sql = "SELECT COUNT(*) cnt From ebook WHERE ebook_title LIKE ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%"+searchWord+"%");
			//디버깅
			System.out.println(stmt+"<-- EbookDao searchTotalCount stmt");
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				totalCnt = rs.getInt("cnt");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.dbUtil.close(rs, stmt, conn);
		}
		
		return totalCnt;
	}
	
	// totalCount
	public int totalCount(String categoryName) {
		this.dbUtil = new DBUtil();
		// 초기화
		int totalCnt = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dbUtil.getConnection();
			if(categoryName == null) {
				String sql = "SELECT COUNT(*) cnt FROM ebook";
				stmt = conn.prepareStatement(sql);
			} else {
				String sql = "SELECT COUNT(*) cnt From ebook WHERE category_name=?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, categoryName);
			}
			//디버깅
			System.out.println(stmt+"EbookDao totalCount stmt");
			
			rs=stmt.executeQuery();
			
			if(rs.next()) {
				totalCnt = rs.getInt("cnt");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.dbUtil.close(rs, stmt, conn);
		}
		
		return totalCnt;
	}
	
	
	//ebookOne
	public  Ebook selectEbookOne(int ebookNo) {
		this.dbUtil = new DBUtil();
		Ebook ebook = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dbUtil.getConnection();
			String sql = "SELECT ebook_no ebookNo, ebook_isbn ebookISBN, category_name categoryName, ebook_title ebookTitle, ebook_author ebookAuthor, ebook_company ebookCompany, ebook_page_count ebookPageCount, ebook_price ebookPrice, ebook_img ebookImg, ebook_summary ebookSummary, ebook_date ebookDate,ebook_state ebookState FROM ebook WHERE ebook_no=? ORDER BY ebook_date DESC";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, ebookNo);
			// 디버깅
			System.out.println(stmt+"<--EbookDao selectEbookOne stmt");
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				ebook = new Ebook();
				ebook.setEbookNo(rs.getInt("ebookNo"));
				ebook.setEbookISBN(rs.getString("ebookISBN"));
				ebook.setCategoryName(rs.getString("categoryName"));
				ebook.setEbookTitle(rs.getString("ebookTitle"));
				ebook.setEbookAuthor(rs.getString("ebookAuthor"));
				ebook.setEbookCompany(rs.getString("ebookCompany"));
				ebook.setEbookPageCount(rs.getInt("ebookPageCount"));
				ebook.setEbookPrice(rs.getInt("ebookPrice"));
				ebook.setEbookImg(rs.getString("ebookImg"));
				ebook.setEbookSummary(rs.getString("ebookSummary"));
				ebook.setEbookDate(rs.getString("ebookDate"));
				ebook.setEbookState(rs.getString("ebookState"));
			}

			} catch (Exception e) {
				e.printStackTrace();	
			} finally { // 순서대로 코드 넣기 (DB유틸에서 close 메소드 호출) 먼저 힙 영역에서 청소해야함.
				this.dbUtil.close(rs, stmt, conn);
			}
		return ebook;
	}
	
	// ebook 리스트 
	public List<Ebook> selectEbookListByPage(int beginRow, int rowPerPage) {
		List<Ebook> list = new ArrayList<>();
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		// 예외처리 
		try {
		conn = this.dbUtil.getConnection();
		String sql = "SELECT ebook_no ebookNo, ebook_title ebookTitle, ebook_price ebookPrice FROM ebook ORDER BY ebook_date DESC LIMIT ?,?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		rs = stmt.executeQuery();
		while(rs.next()) {
			Ebook ebook = new Ebook();
			ebook.setEbookNo(rs.getInt("ebookNo"));
			ebook.setEbookTitle(rs.getString("ebookTitle"));
			ebook.setEbookPrice(rs.getInt("ebookPrice"));
			//ebook.setEbookTitle(rs.getString("ebookImg"));
			list.add(ebook);
			}
		} catch (Exception e) {
			e.printStackTrace();	
		} finally { // 순서대로 코드 넣기 (DB유틸에서 close 메소드 호출) 먼저 힙 영역에서 청소해야함.
			this.dbUtil.close(rs, stmt, conn);
		}
		return list;
		
		
	}
}
