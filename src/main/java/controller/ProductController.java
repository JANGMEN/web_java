package controller;

import java.io.IOException;
import java.util.List;

import config.MyBatisContext;
import dto.Item;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ItemImageMapper;
import mapper.ItemMapper;

@WebServlet(urlPatterns = {"/customer/product.do"})
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemno = request.getParameter("itemno");
		if(itemno == null) {
			response.sendRedirect("home.do");
			return;
		}
		// itemmapper에서 물품정보 받기
		Item obj = MyBatisContext.getSqlSession().getMapper(ItemMapper.class).selectItemOne(Long.parseLong(itemno));
		request.setAttribute("obj", obj);
		// itemimage에서 물품이미지 번호 받기
		List<Long> imageNo = MyBatisContext.getSqlSession().getMapper(ItemImageMapper.class).selectItemImageNo(Long.parseLong(itemno));
		request.setAttribute("imageNo", imageNo);
		
		request.getRequestDispatcher("/WEB-INF/customer_product.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
