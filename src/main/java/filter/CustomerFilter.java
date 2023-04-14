package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// 127.0.0.1:8080/web04/customer/home.do
// 로그인을 해야되는 페이지 체크용
@WebFilter(urlPatterns = {"/customer/mypage.do", "/customer/orderlist.do", "/customer/purchase.do"})
public class CustomerFilter implements Filter {
	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2) throws IOException, ServletException{
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		System.out.println("customer filter => " + request.getRequestURI());
		
		HttpSession httpSession = request.getSession();
		String sessionId = (String) httpSession.getAttribute("id");
		
		if(sessionId == null) { // 세션 객체 없으면 로그인 페이지로..
			response.sendRedirect("login.do");
			return; // 메소드를 종료시킴
		}
		
		// 컨트롤러 가기전에 수행해야 하는 작업들
		// 로그인이 되었는지 확인
		// 로그인이 안되었다면 로그인 페이지로 이동
		
		// 있으면 원래 수행하고자 하는 페이지로..
		arg2.doFilter(arg0, arg1); // 컨트롤러로 정상진입할 수 있게 해줌, 없으면 못감
		
		
		
	}

}
