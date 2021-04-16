package mall.client.model;

import java.sql.*;
import java.util.*;
import mall.client.commons.DBUtil;

public class CategoryDao {
	private DBUtil dbUtil;
	
	//카테고리 이름 목록
	public List<String> categoryList() {
		this.dbUtil = new DBUtil();
		// 초기화
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		List<String> list = new ArrayList<>();
		
		try {
			conn = this.dbUtil.getConnection();
			String sql = "SELECT category_name categoryName FROM category ORDER BY category_weight DESC";
			stmt = conn.prepareStatement(sql);
			//디버깅
			System.out.println(stmt+"<--CategoryDao categoryList stmt");
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				String categoryName = rs.getString("categoryName");
				list.add(categoryName);
			}
		} catch (Exception e) {
			e.printStackTrace(); // 오류메세지를 콘솔창에 띄움
		} finally { 
			this.dbUtil.close(rs, stmt, conn);
		}
		return list;
	}
}
