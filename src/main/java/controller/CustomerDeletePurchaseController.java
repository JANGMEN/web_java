package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import config.MyBatisContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.PurchaseMapper;

// CustomerFilter에 url 등록
@WebServlet(urlPatterns = {"/customer/deletepurchase.do"})
public class CustomerDeletePurchaseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerDeletePurchaseController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// n개의 값을 받을 때는
		String chk[] = request.getParameterValues("chk[]");
		
		for(int i = 0; i < chk.length; i++) {
		System.out.println(chk[i]);
		}
		
		String id = (String) request.getSession().getAttribute("id");
		Map<String, Object> map = new HashMap<>();
		map.put("chk", chk);
		map.put("id", id);
		
		MyBatisContext.getSqlSession().getMapper(PurchaseMapper.class).deletePurchase(map);
		
//		for(int i = 0; i < chk.length; i++) {
//			System.out.println(chk[i]);
//		}
		response.sendRedirect("mypage.do?menu=4");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
