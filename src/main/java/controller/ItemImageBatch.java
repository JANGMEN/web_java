package controller;

import java.io.IOException;
import java.util.Collection;

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

@WebServlet(urlPatterns = {"/item/imagewritebatch.do"})
@MultipartConfig()
public class ItemImageBatch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemImageBatch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long ino = Long.parseLong(request.getParameter("ino")); // 게시글 번호
		
		Collection<Part> partList = request.getParts();
		System.out.println(partList);
		for(Part filePart : partList) {
			// name 값이 files인 것만 필터
			if(filePart.getName().equals("file[]")) {
				ItemImage obj = new ItemImage();
				obj.setItemno(ino);
				obj.setFilename(filePart.getSubmittedFileName());
				obj.setFiletype(filePart.getContentType());
				obj.setFilesize(filePart.getSize());
				obj.setFiledata(filePart.getInputStream().readAllBytes());
				
				// 여기서 mapper로 insert 수행
				// insert all 한번에 추가하기
				MyBatisContext.getSqlSession().getMapper(ItemImageMapper.class).insertImage(obj);
			}
		}
		response.sendRedirect("imagewrite.do?ino=" + ino);
	}

}
