package mall.client.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.client.model.CartDao;
import mall.client.model.OrdersDao;
import mall.client.vo.Cart;
import mall.client.vo.Client;
import mall.client.vo.Orders;

@WebServlet("/InsertOrdersController")
public class InsertOrdersController extends HttpServlet {
	private OrdersDao ordersDao;
	private CartDao cartDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 된 경우만 가능
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") == null) {
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		
		// 의존객체 생성
		this.ordersDao = new OrdersDao();
		this.cartDao = new CartDao();
		
		//request
		int ebookNo = Integer.parseInt(request.getParameter("ebookNo"));
		Client client = (Client)session.getAttribute("loginClient");
		
		Orders orders = new Orders();
		orders.setClientNo(client.getClientNo());
		orders.setEbookNo(ebookNo);
		
		
		Cart cart = new Cart();
		cart.setClientMail(client.getClientMail());
		cart.setEbookNo(ebookNo);
		// 디버깅
		System.out.println(cart.toString()+"<--InsertOrdersController 카트");
		
		//dao 호출
		// insert 후 delete되기 전 DB에 문제가 생기면 -> 롤백(insert도 취소) -> 트랜잭션처리 
		ordersDao.insertOrders(orders);
		cartDao.deleteCart(cart);
		
		response.sendRedirect(request.getContextPath()+"/OrdersListController");
	}

}
