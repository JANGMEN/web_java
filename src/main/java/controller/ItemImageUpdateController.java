package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import mapper.ItemImageMapper;

import java.io.IOException;

import config.MyBatisContext;
import dto.ItemImage;

@WebServlet(urlPatterns = {"/item/imageupdate.do"})
@MultipartConfig()
public class ItemImageUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemImageUpdateController() {
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
		Long ino = Long.parseLong(request.getParameter("ino")); // 물품 번호
		Long imageNo = Long.parseLong(request.getParameter("imageNo")); // 이미지 번호
		Part file = request.getPart("file"); // 첨부한 파일
		
		if(file.getSize() > 0) { // 첨부가 되었다면 수정하기
			// mapper를 이용해서 삭제
			ItemImage obj = new ItemImage();
			obj.setNo(imageNo);
			obj.setItemno(ino);
			obj.setFilename(file.getSubmittedFileName());
			obj.setFiletype(file.getContentType());
			obj.setFilesize(file.getSize());
			obj.setFiledata(file.getInputStream().readAllBytes());
			int ret = MyBatisContext.getSqlSession().getMapper(ItemImageMapper.class).updateItemImageOne(obj);
			
			// 적절한 페이지로 이동
			if(ret == 1) { // 변경완료
				request.setAttribute("message", "변경완료");
				request.setAttribute("url", "imagewrite.do?ino="+ino);
				request.getRequestDispatcher("/WEB-INF/alert.jsp").forward(request, response);
			}
			else { // 변경완료 안됨
				request.setAttribute("message", "변경실패");
				request.setAttribute("url", "imagewrite.do?ino="+ino);
				request.getRequestDispatcher("/WEB-INF/alert.jsp").forward(request, response);
			}
		}
		else { // 변경사항 없음
			request.setAttribute("message", "변경없음");
			request.setAttribute("url", "imagewrite.do?ino="+ino);
			request.getRequestDispatcher("/WEB-INF/alert.jsp").forward(request, response);
		}
		
	
	}

}
