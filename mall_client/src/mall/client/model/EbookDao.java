package mall.client.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import mall.client.commons.DBUtil;
import mall.client.vo.Ebook;

public class EbookDao { // Ebook 리스트
	private DBUtil dbutil;
	public List<Ebook> selectEbookListByPage(int beginRow, int rowPerPage) {
		List<Ebook> list = new ArrayList<>();
		this.dbutil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
		conn = this.dbutil.getConnection();
		String sql = "SELECT ebook_title ebookTitle, ebook_price ebookPrice, ebook_img ebookImg FROM ebook ORDER BY ebook_date DESC LIMIT ?,?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		rs = stmt.executeQuery();
		while(rs.next()) {
			Ebook ebook = new Ebook();
			ebook.setEbookTitle(rs.getString("ebookTitle"));
			ebook.setEbookTitle(rs.getString("ebookPrice"));
			ebook.setEbookTitle(rs.getString("ebookImg"));
			list.add(ebook);
		}
		} catch (Exception e) {
			e.printStackTrace();	
		} finally { // 순서대로 코드 넣기 (DB유틸에서 close 메소드 호출)
			this.dbutil.close(rs, stmt, conn);
		}
		return list;
		
		
	}
}
