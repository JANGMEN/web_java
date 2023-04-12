package controller;

import java.io.IOException;

import config.Hash;
import config.MyBatisContext;
import dto.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mapper.MemberMapper;

@WebServlet(urlPatterns = {"/customer/login.do"})
public class CustomerLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/customer_login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String hashPw = Hash.hashPW(request.getParameter("id"), request.getParameter("pw"));
		// 전송되는 4개 값 받기
		Member obj = new Member();
		obj.setId(id);
		obj.setPassword(hashPw);
		
		Member ret = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).selectMemberLogin(obj);
		
		if(ret != null) {
			// 세션에 기록하기. 기본시간 30분
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("id", ret.getId());
			httpSession.setAttribute("role", ret.getRole());
			httpSession.setAttribute("name", ret.getName());
			response.sendRedirect("home.do");
			return; // 메소드
			
		}
		response.sendRedirect(request.getContextPath() + "/customer/login.do");
	

	}

}
