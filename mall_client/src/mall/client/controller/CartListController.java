package mall.client.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import mall.client.model.CartDao;
import mall.client.vo.Cart;
import mall.client.vo.Client;


@WebServlet("/CartListController")
public class CartListController extends HttpServlet {
	private CartDao cartDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 검사 (로그인 된 사람만 들어올 수 있음)
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") ==null) {
			response.sendRedirect(request.getContextPath()+"/IndexController"); // 로그인 되어 있지 않으면 재요청
			return;
		}
		
		// Dao 호출
		this.cartDao = new CartDao();
		String clientMail = ((Client)(session.getAttribute("loginClient"))).getClientMail();
		List<Map<String, Object>> cartList = this.cartDao.selectCartList(clientMail);
		
		// 포워딩
		request.setAttribute("cartList", cartList); // request에 데이터 값 넣기
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/cart/cartList.jsp"); // 위임
		rd.forward(request, response);
	}

}
