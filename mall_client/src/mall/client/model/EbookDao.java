package mall.client.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import mall.client.commons.DBUtil;
import mall.client.vo.Ebook;

public class EbookDao {
	// 마리아db 연동
	private DBUtil dbUtil;
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
		String sql = "SELECT ebook_title ebookTitle, ebook_price ebookPrice FROM ebook ORDER BY ebook_date DESC LIMIT ?,?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		rs = stmt.executeQuery();
		while(rs.next()) {
			Ebook ebook = new Ebook();
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
