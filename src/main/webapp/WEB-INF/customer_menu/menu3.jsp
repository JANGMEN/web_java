<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<form action="mypage.do?menu=3" method="post">
		<input type="text" name="id" id="id" placeholder="아이디" />
		<input type="password" name="pw" id="pw" placeholder="암호입력" />
		<input type="button" value="회원탈퇴" onclick="deleteMember()"/>
	</form>
</div>
