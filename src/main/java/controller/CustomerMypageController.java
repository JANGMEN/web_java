package controller;

import java.io.IOException;
import java.util.List;

import config.Hash;
import config.MyBatisContext;
import dto.Address;
import dto.Member;
import dto.PurchaseView;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.AddressMapper;
import mapper.MemberMapper;
import mapper.PurchaseMapper;

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
			
			else if(Integer.parseInt(menu) == 2) {
				Member obj = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).selectMemberOne(id);
				request.setAttribute("obj", obj);
			}
			else if(Integer.parseInt(menu) == 3) {
				
			}
			else if(Integer.parseInt(menu) == 4) {
				// 주문내역 가져오기
				List<PurchaseView> list = MyBatisContext.getSqlSession().getMapper(PurchaseMapper.class).selectPurchaseViewMember(id);
				System.out.println(list.toString());
				request.setAttribute("list", list);
			}
			
			else if(Integer.parseInt(menu) == 5) {
				List<Address> list = MyBatisContext.getSqlSession().getMapper(AddressMapper.class).selectAddressList(id);
				request.setAttribute("list", list);
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
