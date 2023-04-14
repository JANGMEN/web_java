package controller;

import java.io.IOException;
import java.util.List;

import config.Hash;
import config.MyBatisContext;
import dto.Item;
import dto.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ItemImageMapper;
import mapper.ItemMapper;
import mapper.MemberMapper;

@WebServlet(urlPatterns = {"/customer/home.do"})
public class CustomerHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerHomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Item> list = MyBatisContext.getSqlSession().getMapper(ItemMapper.class).selectItemAll();
		// 대표이미지 번호를 받아서 Item에 추가하기
		for( Item obj : list) {
			// mapper를 호출하여 해당 물품의 가장 먼저 등록했던 이미지 번호 1개를 가져옴
			long imageNo = MyBatisContext.getSqlSession().getMapper(ItemImageMapper.class).selectItemImageMinOne(obj.getNo());
			obj.setImageNo(imageNo);
		}
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/customer_home.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hashPw = Hash.hashPW(request.getParameter("id"), request.getParameter("pw"));
		// 전송되는 4개 값 받기
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		// 객체생성 role => CUSTOMER
		
		// mapper를 이용해서 추가
		Member obj = new Member();
		obj.setId(id);
		obj.setPassword(hashPw);
		obj.setName(name);
		obj.setAge(Integer.parseInt(age));
		//obj.setRole("CUSTOMER");
		
		int ret = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).insertMemberOne(obj);
		if(ret == 1) {
			// 127.0.0.1:8080/web04/customer/home.do
			response.sendRedirect("home.do");
		}
		else {
			response.sendRedirect(request.getContextPath() + "/customer/join.do");
		}
	}

}
