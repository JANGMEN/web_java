package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mapper.MemberMapper;

import java.io.IOException;

import config.Hash;
import config.MyBatisContext;
import dto.Member;

@WebServlet("/customer/mypage.do")
public class CustomerMypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerMypageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String menu = request.getParameter("menu");
			if (menu == null) {
				response.sendRedirect("mypage.do?menu=1");
				return; // 메소드 종료 아래쪽 실행 안됨
			}
			
			// 세션에서 아이디 꺼내기
			String id = (String) request.getSession().getAttribute("id");
			
			if(Integer.parseInt(menu) == 1) { // 정보 변경 시
				// 아이디를 전송해서 이름과 나이를 받아옴
				Member obj = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).selectMemberOne(id);
				request.setAttribute("obj", obj);
			}
			
			if(Integer.parseInt(menu) == 2) {
				Member obj = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).selectMemberOne(id);
				request.setAttribute("obj", obj);
			}
			request.getRequestDispatcher("/WEB-INF/customer_mypage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int menu = Integer.parseInt(request.getParameter("menu"));
		if(menu == 1) {
			String id = (String) request.getSession().getAttribute("id");
			// mapper 호출 후 변경하기
			Member obj = new Member();
			obj.setId(id);
			obj.setName(request.getParameter("name"));
			obj.setAge(Integer.parseInt(request.getParameter("age")));
			System.out.println(obj.toString());
			
			MyBatisContext.getSqlSession().getMapper(MemberMapper.class).updateMemberConfig(obj);
		}
		else if(menu == 2) {
			String id = (String) request.getSession().getAttribute("id");
			Member obj = new Member();
			obj.setId(id);
			obj.setPassword(Hash.hashPW(id, request.getParameter("pw")));
			obj.setNewPassword(Hash.hashPW(id, request.getParameter("pw1")));
			System.out.println(obj.toString());
			
			
			MyBatisContext.getSqlSession().getMapper(MemberMapper.class).updateMemberPassword(obj);
			
		}
		else if(menu == 3) {
			String id = (String) request.getSession().getAttribute("id");
			Member obj = new Member();
			obj.setId(id);
			obj.setPassword(Hash.hashPW(id, request.getParameter("pw")));
			System.out.println(obj.toString());
			
			int ret = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).deleteMember(obj);
			
			if(ret == 1) {
				response.sendRedirect("logout.do");
			}
			else {
				response.sendRedirect(request.getContextPath() + "/customer/mypage.do?menu=" + menu);
			}
			
		}
		
	}

}
