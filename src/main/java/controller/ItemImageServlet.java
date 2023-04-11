package controller;

import java.io.IOException;

import config.MyBatisContext;
import dto.ItemImage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ItemMapper;

// 컨트롤러X, DB의 이미지를 url 형태로 변경해서 반환
// jsp에서 src에 이미지의 위치를 설정하는 용도로 사용
// <img src="/item/image?no=13" style="width:60px; height:60px" />
// http://127.0.0.1:8080/web04/item/image?no=XX 확인
@WebServlet(urlPatterns = "/item/image")
public class ItemImageServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public ItemImageServlet() {
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ItemMapper mapper = MyBatisContext.getSqlSession().getMapper(ItemMapper.class);
		
		long no = Long.parseLong(request.getParameter("no"));
		
		ItemImage obj = mapper.selectItemImageOne(no);
		
		response.setContentType(obj.getFiletype()); // 크롬에게 이미지라고 알려줌
		response.setStatus(200); // 200은 정상적인 처리 결과
		response.getOutputStream().write(obj.getFiledata()); // 실제 정보
	}

}
