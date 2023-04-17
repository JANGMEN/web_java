package controller;

import java.io.IOException;
import java.util.List;

import config.MyBatisContext;
import dto.Board;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.BoardMapper;

@WebServlet(urlPatterns = {"/purchase/select.do"})
public class PurchaseSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String menu = request.getParameter("menu");
		if(menu == null) {
			response.sendRedirect("select.do?menu=1");
			return; // 메소드 종료
		}
		request.getRequestDispatcher("/WEB-INF/purchase_select.jsp").forward(request, response);
		
	}
		
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
