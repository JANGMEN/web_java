package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.MemberMapper;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import config.Hash;
import config.MyBatisContext;
import dto.Member;

@WebServlet(urlPatterns = {"/api/seller/join.json"})
public class RestSellerLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson();
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member obj = new Member();
		obj.setId(request.getParameter("id"));
		obj.setPassword(Hash.hashPW(request.getParameter("id"), request.getParameter("pw")));
		obj.setName(request.getParameter("name"));
		
		System.out.println(request.getParameter("age"));
		obj.setAge(Integer.parseInt(request.getParameter("age")));
		obj.setRole("SELLER");
		System.out.println(obj.toString());// 확인용
		
		
		int ret = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).insertMemberOne(obj);
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("result", ret); // map => {"result" : 0}
		String jsonString = gson.toJson(map); // Object 타입을 json으로 변경해줌
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		out.flush();
		}
}
