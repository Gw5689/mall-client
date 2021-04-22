package mall.client.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*") 
public class EncodingFilter implements Filter {
	// ServletRequest은 HttpServletRequest의 부모타입 (자식 메소드를 사용해야 한다면 형변환 필요)
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		request.setCharacterEncoding("UTF-8");
		//디버깅
		System.out.println("EncodingFilter 실행");
		
		chain.doFilter(request, response);
	}

}
