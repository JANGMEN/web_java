<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<form action="mypage.do?menu=2" method="post">
		<input type="text" name="id" id="id" placeholder="아이디" />
		<input type="password" name="pw" id="pw" placeholder="패스워드" />
		<input type="password" name="pw1" id="pw1" placeholder="변경 패스워드" />
		<input type="password" name="pw2" id="pw2" placeholder="변경 패스워드 확인" />
		<input type="button" value="비밀번호 변경" onclick="updatePassword()" />
	</form>
</div>
