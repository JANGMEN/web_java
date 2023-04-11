package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ItemImageMapper;

import java.io.IOException;

import config.MyBatisContext;

@WebServlet(urlPatterns = {"/item/imagedelete.do"})
@MultipartConfig()
public class ItemImageDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemImageDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long ino = Long.parseLong(request.getParameter("ino"));
		Long imageNo = Long.parseLong(request.getParameter("imageno"));
		
		// mapper를 이용해서 삭제
		int ret = MyBatisContext.getSqlSession().getMapper(ItemImageMapper.class).deleteItemImageNo(imageNo);
		
		// 적절한 페이지로 이동
		if (ret == 1) {
			response.sendRedirect(request.getContextPath() + "/item" + "/imagewrite.do?ino=" + ino);
		}
		else {
			response.sendRedirect("imagewrite.do?ino=" + ino);
		}
	}

}
