package controller;

import java.io.IOException;

import config.MyBatisContext;
import dto.Board;
import dto.Item;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.BoardMapper;
import mapper.ItemMapper;

@WebServlet(urlPatterns = {"/item/write.do"})
public class ItemWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemWriteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/item_write.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Item obj = new Item();
		obj.setName(request.getParameter("name"));
		obj.setContent(request.getParameter("content"));
		obj.setPrice(Long.parseLong(request.getParameter("price")));
		obj.setQuantity(Long.parseLong(request.getParameter("quantity")));
		System.out.println(obj.toString()); // 전달받은 값 확인용
		
		// mapper를 통해 데이터 추가
		int ret = MyBatisContext.getSqlSession().getMapper(ItemMapper.class).insertItemOne(obj);
		
		if (ret == 1) {
			// 절대경로를 이용한 페이지 이동
			response.sendRedirect(request.getContextPath() + "/item" + "/select.do");
		}
		else {
			// 상대경로를 이용한 페이지 이동
			 response.sendRedirect("write.do");
			
		}
		
		

	}

}
