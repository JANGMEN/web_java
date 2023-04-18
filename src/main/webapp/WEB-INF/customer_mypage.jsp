<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
<title>고객용 마이페이지</title>
</head>
<body>
	<div class="container">
		<a href="mypage.do?menu=1" class="btn btn-primary">회원정보수정</a>
		<a href="mypage.do?menu=2" class="btn btn-primary">회원비번변경</a>
		<a href="mypage.do?menu=3" class="btn btn-primary">회원탈퇴</a>
		<a href="mypage.do?menu=4" class="btn btn-primary">주문내역</a>
		<a href="mypage.do?menu=5" class="btn btn-primary">주소관리</a>
		<hr />
		
		<c:if test="${param.menu == 1}">
			<jsp:include page="./customer_menu/menu1.jsp"></jsp:include>
		</c:if>
		
		<c:if test="${param.menu == 2}">
			<jsp:include page="./customer_menu/menu2.jsp"></jsp:include>
		</c:if>
		
		<c:if test="${param.menu == 3}">
			<jsp:include page="./customer_menu/menu3.jsp"></jsp:include>
		</c:if>
		
		<c:if test="${param.menu == 4}">
			<jsp:include page="./customer_menu/menu4.jsp"></jsp:include>
		</c:if>
		
		<c:if test="${param.menu == 5}">
			<jsp:include page="./customer_menu/menu5.jsp"></jsp:include>
		</c:if>
	</div>



	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		function updateMember() {
			// 유효성 검사
			const name = document.getElementsByName("name")[0];
			const age = document.getElementsByName("age")[0];
			
			
			// document.getElementByTagName("form")[0].submit();
			const form = document.getElementsByTagName("form");
			form[0].submit();
		}
		
		function updatePassword() {
			const pw = document.getElementsByName("pw")[0];
			const pw1 = document.getElementsByName("pw1")[0];
			const pw2 = document.getElementsByName("pw2")[0];
			
			if(pw1.value === pw2.value) {
				const form = document.getElementsByTagName("form");
				form[0].submit();
			}
			
		}
		
		function deleteMember() {
			const pw = document.getElementsByName("pw")[0];
			
			const form = document.getElementsByTagName("form");
			form[0].submit();
			
		}
	</script>

</body>
</html>