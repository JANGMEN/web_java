package restcontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import config.MyBatisContext;
import dto.Board;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.BoardMapper;

@WebServlet(urlPatterns = {"/api/board/select.json"})
public class RestBoardSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Gson gson = new Gson(); // 라이브러리를 이용한 객체 생성
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestBoardSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 전달받는 문자로된 페이지 정보
		String page = request.getParameter("page");
		
		// 10개씩 가져오기 위한 시작위치 종료위치 계산
		int start = Integer.parseInt(page)*10-9; // 페이지네이션 시작값
		int end = Integer.parseInt(page)*10; // 페이지네이션 종료값
		
		// mapper를 이용한 결과 조회
		List<Board> list = MyBatisContext.getSqlSession().getMapper(BoardMapper.class).selectBoardListPage(start, end);
		long cnt = MyBatisContext.getSqlSession().getMapper(BoardMapper.class).countBoardList();
		
		// 전송하는 데이터 타입설정 (json 문서) text => html을
		response.setContentType("application/json");
		
		// list 객체를 json으로 변환
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pages", (cnt-1) / 10 + 1);
		String jsonString = gson.toJson(map);
		
		// 호출된 곳으로 값 전송
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		out.flush();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
