package mall.client.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mall.client.model.CategoryDao;
import mall.client.model.EbookDao;
import mall.client.model.OrdersDao;
import mall.client.model.StatsDao;
import mall.client.vo.Ebook;
import mall.client.vo.Stats;

// C -> M -> view
@WebServlet("/IndexController")
public class IndexController extends HttpServlet {
	private EbookDao ebookDao;
	private CategoryDao categoryDao;
	private OrdersDao ordersDao;
	private StatsDao statsDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.ebookDao = new EbookDao();
		this.categoryDao = new CategoryDao();
		this.ordersDao = new OrdersDao();
		this.statsDao = new StatsDao();
		Ebook ebook = new Ebook();
		
		// 카테고리
		String categoryName = null;
		if(request.getParameter("categoryName") != null) {
			categoryName = request.getParameter("categoryName");
		}
		
		// 검색창
		String searchWord = null;
		if(request.getParameter("searchWord") != null) {
			 searchWord = request.getParameter("searchWord");
		}
		
		// request 분석
		//페이징
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 15;
		int beginRow = (currentPage - 1)*rowPerPage;
		
		// Dao 호출
		if(request.getParameter("searchWord") != null) {//검색어가 없을경우

			int totalRow = ebookDao.searchTotalCount(searchWord);
			System.out.println("totalRow: "+ totalRow + "<SearchIndexController>");
			int lastPage = totalRow/rowPerPage;
			if(totalRow % rowPerPage != 0){
				lastPage +=1;
			}

		//model 호출
		List<Ebook> ebookList = this.ebookDao.selectSearchEbookListByPage(beginRow, rowPerPage, searchWord);

			request.setAttribute("lastPage", lastPage);
			request.setAttribute("ebookList", ebookList);
		} else { // 검색어가 있을 경우
			int totalRow = ebookDao.totalCount(categoryName);
			int lastPage = totalRow/rowPerPage;
			if(totalRow % rowPerPage != 0){
				lastPage +=1;
			}

			//model 호출
			this.ordersDao = new OrdersDao();
			List<Ebook> ebookList = this.ebookDao.selectEbookListByPage(beginRow, rowPerPage, categoryName);

			request.setAttribute("lastPage", lastPage);
			request.setAttribute("ebookList", ebookList);
		}
		
		// 카테고리 리스트
		List<String> categoryList = this.categoryDao.categoryList();
		// 베스트 상품 리스트
		List<Map<String, Object>> bestOrdersList = this.ordersDao.selectBestOrdersList();
		
		//접속자 관련 데이터
		long total = this.statsDao.selectStatsTotal();
		Stats stats = this.statsDao.selectStatsByToday();
		
		long statsCount = 0;
		
		if(stats != null) {
			statsCount = stats.getStatsCount();
		}
		
		// View forward
		request.setAttribute("bestOrdersList", bestOrdersList);
		request.setAttribute("total", total);
		request.setAttribute("statsCount", statsCount);
		request.setAttribute("searchWord", searchWord);
		request.setAttribute("categoryName", categoryName);
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("currentPage", currentPage);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/index.jsp");
		rd.forward(request, response);
	}
	
}
	

