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

@WebServlet(urlPatterns = {"/customer/insertaddress.do"})
public class MemberAddressController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberAddressController() {
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
		String postcode = request.getParameter("postcode"); // getParameter : jsp의 name 값을 가져옴
		String address = request.getParameter("address");
		String detailAddress= request.getParameter("detailaddress");
		String extraAddress= request.getParameter("extraaddress");
		
		
		String totalAddress = address + " " + detailAddress + " " + extraAddress;
		
		
		Address obj = new Address();
		obj.setMemberid(id);
		obj.setPostcode(postcode);
		obj.setAddress(totalAddress);
		
		
		
		int ret = MyBatisContext.getSqlSession().getMapper(AddressMapper.class).insertAddress(obj);
		
		if(ret == 1) {
			response.sendRedirect("mypage.do?menu=5");
		}
		else {
			response.sendRedirect("mypage.do");
		}
	}

}
