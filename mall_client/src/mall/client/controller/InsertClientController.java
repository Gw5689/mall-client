package mall.client.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.client.model.ClientDao;
import mall.client.vo.Client;


@WebServlet("/InsertClientController")
public class InsertClientController extends HttpServlet {
	private ClientDao clientDao;
	//form , 로그인이 되어 있다면 회원가입 폼 X, C -> V (mainMenu링크)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginClient") != null) {
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		
		request.getRequestDispatcher("WEB-INF/view/client/insertClient.jsp").forward(request, response); // 재요청
	}
	
	//action C -> M -> redirect 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Dao 생성
		this.clientDao = new ClientDao();
		
		// input에서 받은 ID/PW 가져오기
		String clientMail = request.getParameter("clientMail");
		String clientPw = request.getParameter("clientPw");
		
		// 메소드 호출 (이메일 중복검사 메소드)
		String returnClientMail = clientDao.selectClientMail("clientMail");
		
		if(returnClientMail != null) { // mail이 중복 되었다면
			System.out.println("이미 사용중인 메일 입니다.");
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		
		// 회원정보 저장
		Client client = new Client();
		client.setClientMail(clientMail);
		client.setClientPw(clientPw);
		
		// 메소드 호출 (insert 메소드)
		clientDao.insertClient(client);

		response.sendRedirect(request.getContextPath()+"/IndexController");

	}
}
