package controller;

import java.io.IOException;

import config.MyBatisContext;
import dto.Address;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.AddressMapper;

@WebServlet(urlPatterns = {"/customer/deleteaddress.do"})
public class MemberAddressDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberAddressDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/customer_menu/menu5.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = (String) request.getSession().getAttribute("id"); // 세션에서 꺼내기
		Long no = Long.parseLong(request.getParameter("no"));
		
		Address obj = new Address();
		obj.setNo(no);
		obj.setMemberid(id);
		System.out.println(obj.toString());
		
		int ret = MyBatisContext.getSqlSession().getMapper(AddressMapper.class).deleteAddressOne(obj);
		if(ret == 1) {
			response.sendRedirect("mypage.do?menu=5");
			return;
		}
		response.sendRedirect("mypage.do?menu=5");
	}

}
