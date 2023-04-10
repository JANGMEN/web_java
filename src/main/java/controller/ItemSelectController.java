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
import mapper.ItemMapper;

@WebServlet(urlPatterns = {"/item/select.do"})
public class ItemSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 주소창에 select.do?page=1이 없을 경우 처리
				String page = request.getParameter("page");
				if(page == null) {
					response.sendRedirect("select.do?page=1"); // 강제로 page=1
					return; // 메소드 종료시키기
				}
				
				// 페이지네이션 시작값
				int start = Integer.parseInt(page)*10-9;
				
				// 페이지네이션 종료값
				int end = Integer.parseInt(page)*10;
				
				List<Item> list = MyBatisContext.getSqlSession().getMapper(ItemMapper.class).selectItemListPage(start, end);
				// 1. DB에서 게시글 전체 읽기
//				List<Board> list = MyBatisContext.getSqlSession().getMapper(BoardMapper.class).selectBoardAll();
				
				// 게시글 전체 개수
				long cnt = MyBatisContext.getSqlSession().getMapper(ItemMapper.class).countItemList();
				
				// 2. view로 list 전달
				request.setAttribute("list", list);
				request.setAttribute("pages", (cnt-1) / 10 + 1);
				
				// 3. board_select.jsp 화면에 표시
				request.getRequestDispatcher("/WEB-INF/item_select.jsp").forward(request, response);
			}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
