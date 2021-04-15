package mall.client.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.client.model.CartDao;
import mall.client.model.ClientDao;
import mall.client.vo.Client;


@WebServlet("/DeleteClientController")
public class DeleteClientController extends HttpServlet {
	private ClientDao clientDao;
	private CartDao cartDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// 로그인 여부 확인
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") == null) {
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		
		//session에서 메일 받아오기
		String clientMail = ((Client)session.getAttribute("loginClient")).getClientMail();
		
		// 장바구니 비우기
		cartDao = new CartDao();
		cartDao.deleteCartByClient(clientMail);
		// 회원탈퇴
		clientDao = new ClientDao();
		clientDao.deleteClient(clientMail);

		//세션 비우기
		session.invalidate();

		//HOME 으로 재요청
		response.sendRedirect(request.getContextPath()+"/IndexController");
		
	}

}
