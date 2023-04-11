<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

	<script>
		alert('${message}'); // 알림을 표시
		window.location.href='${url}'; // 주소창을 바꾸고 enter 키
	</script>
</head>
</html>