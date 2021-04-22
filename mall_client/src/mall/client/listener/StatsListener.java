package mall.client.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import mall.client.model.StatsDao;

@WebListener
public class StatsListener implements HttpSessionListener {
	private StatsDao statsDao;

    public void sessionCreated(HttpSessionEvent se)  { // 세션이 만들어 졌을 때
         // 1. 오늘날짜의 카운트가 없으면 1을 INSERT
    	 // 2. 오늘날짜의 카운트가 있다면 +1 UPDATE
    	if(se.getSession().isNew()) {
    		
    	
    	
    	System.out.println("새로운 세션이 생성 되었습니다.");
    	
    	this.statsDao = new StatsDao();
    	
    	if(this.statsDao.selectStatsByToday() == null) {
    		this.statsDao.insertStats();
    	} else {
    		this.statsDao.updateStats();
		}
	}
}
	
    public void sessionDestroyed(HttpSessionEvent se)  { // 세션이 닫혔을 때

    }
	
}
