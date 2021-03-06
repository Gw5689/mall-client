package mall.client.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mall.client.model.EbookDao;

@WebServlet("/EbookCalendarController")
public class EbookCalendarController extends HttpServlet {
	private EbookDao ebookDao; // 이달의 신간 ebook
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.ebookDao = new EbookDao();
		// 연도와 월이 매개값으로 전달되지 않으면 ..
		Calendar dday = Calendar.getInstance();
		
		if(request.getParameter("currentYear") !=null) {
			dday.set(Calendar.YEAR, Integer.parseInt(request.getParameter("currentYear")));
		}
		if(request.getParameter("currentMonth") !=null) {
			dday.set(Calendar.MONTH, Integer.parseInt(request.getParameter("currentMonth"))-1); // 들어갈때 +1을 했기 때문에 -1
		}
		
		int currentYear = dday.get(Calendar.YEAR);
		int currentMonth = dday.get(Calendar.MONTH)+1;
		
		//각 월의 1일 요일 및 마지막날 구하기
		Calendar firstDay = Calendar.getInstance();
		firstDay.set(Calendar.YEAR, currentYear);
		firstDay.set(Calendar.MONTH, currentMonth-1);
		firstDay.set(Calendar.DATE,1); // 오늘의 날짜를 1일로 바꿈
		int firstDayOfWeek = firstDay.get(Calendar.DAY_OF_WEEK);
		
		//마지막 날
		int endDay = dday.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		
		//디버깅
		System.out.println(currentYear+"<-- currentYear");
		System.out.println(currentMonth+"<-- currnetMonth");
		System.out.println(firstDayOfWeek +"<-- firstDay");// 요일 디버깅
		System.out.println(endDay +"<-- endDay"); // 마지막날 디버깅
		
		List<Map<String, Object>> ebookListByMonth = this.ebookDao.selectEbookListByMonth(currentYear, currentMonth);
		
		
		//
		int preYear = currentYear;
		int preMonth = currentMonth-1;
		
		// 1월에서 저번달을 누르면 12월이 되고 년도가 1 줄어든다.
		if(preMonth == 0) {
			preMonth = 12;
			preYear -=1;
		}
		
		int nextYear = currentYear;
		int nextMonth = currentMonth+1;
		
		// 12월에서 다음달을 누르면 1월이 되고 년도가 1 늘어난다.
		if(nextMonth == 13) {
			nextMonth = 1;
			nextYear +=1;
		}
		
		request.setAttribute("ebookListByMonth", ebookListByMonth);
		request.setAttribute("currentYear", currentYear);
		request.setAttribute("currentMonth", currentMonth);
		request.setAttribute("firstDayOfWeek", firstDayOfWeek);
		request.setAttribute("endDay", endDay);
		
		request.setAttribute("preYear", preYear);
		request.setAttribute("preMonth", preMonth);
		request.setAttribute("nextYear", nextYear);
		request.setAttribute("nextMonth", nextMonth);
		//포워딩
		request.getRequestDispatcher("/WEB-INF/view/ebook/ebookCalendar.jsp").forward(request, response);
	}


}
