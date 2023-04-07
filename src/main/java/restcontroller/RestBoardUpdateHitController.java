package restcontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import config.MyBatisContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.BoardMapper;

// 변경 PUT
@WebServlet(urlPatterns = {"/api/board/updatehit.json"})
public class RestBoardUpdateHitController extends HttpServlet {
	private Gson gson = new Gson(); // 라이브러리를 이용한 객체 생성

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 글번호 받기
		String strNo = request.getParameter("no");
		
		// 형 변환
		Long no = Long.parseLong(strNo);
		
		// 결과받기
		int ret = MyBatisContext.getSqlSession().getMapper(BoardMapper.class).updateBoardHit(no);
		
		// 전달할 값을 map 타입으로 설정
		Map<String, Integer> map = new HashMap<>();
		map.put("result", ret);
		
		response.setContentType("aplication/json");
		String res = gson.toJson(map);
		PrintWriter out = response.getWriter();
		out.print(res);
		out.flush();
	}

	
}
