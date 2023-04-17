<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<a href="select.do?menu=1" class="btn btn-sm btn-primary"> 전체 주문목록 </a>
		<a href="select.do?menu=2" class="btn btn-sm btn-primary"> 회원별 주문수량 </a>
		<a href="select.do?menu=3" class="btn btn-sm btn-primary"> 물품별 주문수량 </a>
		<a href="select.do?menu=4" class="btn btn-sm btn-primary"> 시간대별 주문수량 </a>
		<hr />
		
		<c:if test="${param.menu == 1}">
			<jsp:include page="./purchase_menu/menu1.jsp"></jsp:include>
		</c:if>
		<c:if test="${param.menu == 2}">
			<jsp:include page="./purchase_menu/menu2.jsp"></jsp:include>
		</c:if>
		<c:if test="${param.menu == 3}">
			<jsp:include page="./purchase_menu/menu3.jsp"></jsp:include>
		</c:if>
		<c:if test="${param.menu == 4}">
			<jsp:include page="./purchase_menu/menu4.jsp"></jsp:include>
		</c:if>
	</div>

</body>
</html>