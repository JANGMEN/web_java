<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>판매자용 홈화면</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
</head>

<body>
	<div class="container">
	   	<h3>판매자용 홈화면</h3>
	   	<ul class="nav nav-pills">
	   		<li class="nav-item p-2">
       			<a href="home.do" class="btn btn-primary">홈으로</a>
       		</li>
       		<li class="nav-item p-2">
       			<a href="${pageContext.request.contextPath}/item/select.do" class="btn btn-primary">물품관리</a>
       		</li>
       		<li class="nav-item p-2">
       			<a href="${pageContext.request.contextPath}/purchase/select.do" class="btn btn-primary">주문관리</a>
       		</li>		
      	</ul>
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