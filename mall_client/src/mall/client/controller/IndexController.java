package mall.client.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mall.client.model.CategoryDao;
import mall.client.model.EbookDao;
import mall.client.vo.Ebook;

// C -> M -> view
@WebServlet("/IndexController")
public class IndexController extends HttpServlet {
	private EbookDao ebookDao;
	private CategoryDao categoryDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.ebookDao = new EbookDao();
		this.categoryDao = new CategoryDao();
		Ebook ebook = new Ebook();
		
		// 카테고리
		String categoryName = null;
		if(request.getParameter("categoryName") != null) {
			categoryName = request.getParameter("categoryName");
		}
		
		// request 분석
		//페이징
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 15;
		int beginRow = (currentPage - 1)*rowPerPage;
		
		int totalRow = ebookDao.totalCount(categoryName);
		int lastPage = totalRow/rowPerPage;
		if(totalRow % rowPerPage != 0) {
			lastPage ++;
		}
		// Dao 호출
		List<Ebook> ebookList = this.ebookDao.selectEbookListByPage(beginRow, rowPerPage, categoryName);
		// 카테고리 리스트
		List<String> categoryList = this.categoryDao.categoryList();
		
		// View forward
		request.setAttribute("categoryName", ebook.getCategoryName());
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("lastPage", lastPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("ebookList", ebookList);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/index.jsp");
		rd.forward(request, response);
	}
}
	

