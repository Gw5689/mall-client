package mall.client.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;


@WebListener
public class DBListener implements ServletContextListener {


    public void contextDestroyed(ServletContextEvent sce)  { // 톰캣이 꺼질때 (꺼지기 때문에 확인할 수 없음) 
    	System.out.println("contextDestroyed");
    }

	
    public void contextInitialized(ServletContextEvent sce)  { // 톰캣이 켜질때 
    	try {
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("mariaDB 로딩 성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("mariaDB 로딩 실패");
		}
    }
	
}
