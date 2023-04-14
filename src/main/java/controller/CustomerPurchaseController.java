package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.PurchaseMapper;

import java.io.IOException;

import config.MyBatisContext;
import dto.Purchase;

@WebServlet(urlPatterns = {"/customer/purchase.do"})
public class CustomerPurchaseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerPurchaseController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/customer_purchase.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// DB에 추가하기
		Long itemno = Long.parseLong(request.getParameter("itemno"));
		Long cnt = Long.parseLong(request.getParameter("cnt"));
		
		Purchase obj = new Purchase();
		obj.setItemno(itemno);
		obj.setCnt(cnt);
		obj.setCustomerid(LEGACY_DO_HEAD);
		response.sendRedirect("purchase.do");
	}

}
