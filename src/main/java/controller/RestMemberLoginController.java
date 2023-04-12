package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import config.Hash;
import config.MyBatisContext;
import dto.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mapper.MemberMapper;

// 127.0.0.1:8080/web04/api/member/idcheck.json?id=중복확인아이디
@WebServlet(urlPatterns = {"/api/member/login.json"})
public class RestMemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson(); // 라이브러리를 이용한 객체 생성
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestMemberLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hashPw = Hash.hashPW(request.getParameter("id"), request.getParameter("pw"));
		
		Member obj = new Member();
		obj.setId(request.getParameter("id"));
		obj.setPassword(hashPw);
		
		Member ret = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).selectMemberLogin(obj);
		
		response.setContentType("application/json");
		Map<String, Object> map = new HashMap<>();
		map.put("ret", 0); // 실패 시
		if(ret != null) {
			// react.js, vue.js 등의 프론트엔드 프레임워크 개발시 토큰을 발행
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("id", ret.getId());
			httpSession.setAttribute("role", ret.getRole());
			httpSession.setAttribute("name", ret.getName());
			map.put("ret", 1); // 성공 시
		}

		String jsonString = gson.toJson(map);
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		out.flush();
	}
}
