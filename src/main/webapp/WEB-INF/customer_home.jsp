<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>고객용 홈</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
</head>

<body>
	<div class="container">
       <a href="home.do">홈으로</a>
       <c:if test="${sessionScope.id eq null}">
       		<a href="login.do">로그인</a>
       		<a href="join.do">회원가입</a>
       </c:if>
             
       <c:if test="${sessionScope.id ne null}">
       		<p>${sessionScope.name}님 로그인</p>
       		<a href="#" onclick="logoutAction()">로그아웃</a>
       <!-- <form action="logout.do" method="post">
       		<input type="submit" value="로그아웃" />
       </form>  -->
       </c:if>  
       <hr />          
	</div>
	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		function logoutAction() {
			var form = document.createElement("form");
			form.setAttribute("action", "logout.do");
			form.setAttribute("method", "post");
			form.style.display="none";
			document.body.appendChild(form);
			form.submit();
		}

	</script>
	
</body>
</html>