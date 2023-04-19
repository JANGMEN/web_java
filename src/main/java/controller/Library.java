package controller;

import java.util.List;

import config.MyBatisContext;
import dto.Book;
import mapper.BookMapper;

public class Library {

	public static void main(String[] args) {
		// 1. Book insert
//		Book obj = new Book();
//		obj.setTitle("버번 위스키의 모든 것");
//		obj.setPrice(30400);
//		obj.setAuthor("조승원");
//		obj.setPublisher("싱긋");
//		
//		
//		int ret = MyBatisContext.getSqlSession().getMapper(BookMapper.class).insertBookOne(obj);
//		
//		if(ret == 1) {
//			System.out.println("1");
//		}
//		else {
//			System.out.println("0");
//		}
//		
		
		// 2. Book select, 1개만 검색하려면 어떻게 해야하지? 필터를 걸어주려면 어떻게 해야되는가? WHERE?
//		List<Book> list = MyBatisContext.getSqlSession().getMapper(BookMapper.class).selectBook();
//		for(Book obj : list) {
//			System.out.println(obj.toString());
//		}
		Book obj = MyBatisContext.getSqlSession().getMapper(BookMapper.class).selectBookOne(1);
		System.out.println(obj.toString());
		
		// 3. Book update, 값을 안 넣어주니까 선언했던 값이 0이나 null로 바뀜, 해결방법은 무엇일까
//		Book obj = new Book();
//		obj.setNo(2);
//		obj.setTitle("성낙현의 JSP 자바 웹 프로그래밍");
//		obj.setPrice(28000);
//		obj.setPublisher("골든래빗");
//		
//		int ret = MyBatisContext.getSqlSession().getMapper(BookMapper.class).updateBookOne(obj);
//		if(ret == 1) {
//			System.out.println("1");
//		}
//		else {
//			System.out.println("0");
//		}
		
		// 4. Book delete, 원하는 숫자 삭제법
//		int ret = MyBatisContext.getSqlSession().getMapper(BookMapper.class).deleteBookOne(5);
//		
//		if(ret == 1) {
//			System.out.println("1");
//		}
//		else {
//			System.out.println("0");
//		}

	}

}
