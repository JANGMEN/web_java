package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import config.MyBatisContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.PurchaseMapper;

@WebServlet(urlPatterns = {"/api/purchase/member.json"})
public class RestPurchaseMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson();
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// mapper를 이용해서 회원별 주문수량 합계
		response.setContentType("application/json");
		List<Map<String, Object>> list = MyBatisContext.getSqlSession().getMapper(PurchaseMapper.class).selectMemberGroup();
		
		String jsonString = gson.toJson(list);
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