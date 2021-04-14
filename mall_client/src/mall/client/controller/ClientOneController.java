package mall.client.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.client.model.ClientDao;
import mall.client.vo.Client;

@WebServlet("/ClientOneController")
public class ClientOneController extends HttpServlet {
	private ClientDao clientDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 검사 (로그인 된 사람만 들어올 수 있음)
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") ==null) {
			response.sendRedirect(request.getContextPath()+"/IndexController"); // 로그인 되어 있지 않으면 재요청
			return;
		}
		
		//Dao 호출
		this.clientDao = new ClientDao();
		String clientMail = ((Client)(session.getAttribute("loginClient"))).getClientMail();
		
		// 클라이언트 상세정보
		Client clientOne = this.clientDao.selectClientOne(clientMail);
		//디버깅
		System.out.println(clientOne+"<--ClientOneController clientOne");
		
		//세션에 넣기
		request.setAttribute("clientOne", clientOne); // (키, 값)
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/client/clientOne.jsp");// 위임
		rd.forward(request, response);// 포워딩
		
		
	}	
}
