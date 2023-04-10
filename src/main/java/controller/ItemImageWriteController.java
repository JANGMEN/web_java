package controller;

import java.io.IOException;

import config.MyBatisContext;
import dto.ItemImage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import mapper.ItemImageMapper;

@WebServlet(urlPatterns = {"/item/imagewrite.do"})
@MultipartConfig()
public class ItemImageWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemImageWriteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ino = request.getParameter("ino");
		request.setAttribute("ino", ino);
		request.getRequestDispatcher("/WEB-INF/itemimageinsert.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long ino = Long.parseLong(request.getParameter("ino"));
		Part file = request.getPart("file");
		
		ItemImage obj = new ItemImage();
		obj.setItemno(ino);
		obj.setFilename(file.getSubmittedFileName() );
		obj.setFilesize(file.getSize());
		obj.setFiletype(file.getContentType());
		obj.setFiledata(file.getInputStream().readAllBytes());
		System.out.println(obj);
		
		// mapper로 추가
		int ret = MyBatisContext.getSqlSession().getMapper(ItemImageMapper.class).insertImage(obj);
		
		if (ret == 1) {
			response.sendRedirect(request.getContextPath() + "/item" + "/imagewrite.do?ino="+ino);
		}
		else {
			response.sendRedirect("imagewrite.do?ino="+ino);
			
		}
	
	}

}
