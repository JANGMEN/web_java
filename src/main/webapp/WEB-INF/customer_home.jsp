<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>고객용 홈화면</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    
    <style>
    	.grid {
    		display : grid;
    		grid-template-columns : 1fr 1fr 1fr 1fr;
    		column-gap : 10px;
    		row-gap : 10px;
    	}
    	
    	.item {
    		padding : 10px;
    		border : 1px solid #cccccc;
    		min-height : 300px;
    	}
    	
    	a {
    		text-decoration : none;
    		color : #111111;
    	}
    	
    	a:hover .item {
    		color : red;
    		border : 1px solid red;
    	}
    </style>
</head>

<body>
	<div class="container">
	   	<h3>고객용 홈화면</h3>
	   	<ul class="nav nav-pills">
	   		<li class="nav-item p-2">
       			<a href="home.do" class="btn btn-primary">홈으로</a>
       		</li>
       		<li class="nav-item p-2">
       			<a href="${pageContext.request.contextPath}/board/select.do" class="btn btn-primary">자유게시판</a>
       		</li>
       			<c:if test="${sessionScope.id eq null}">
       				<li class="nav-item p-2">
       					<a href="login.do" class="btn btn-primary">로그인</a>
       				</li>
       				<li class="nav-item p-2">
       					<a href="join.do" class="btn btn-primary">회원가입</a>
       				</li>
       			</c:if>
       	
       			<c:if test="${sessionScope.id ne null}">
       				<li class="nav-item p-2">
       					<p>${sessionScope.name}님 로그인</p>
       				</li>
       				<li class="nav-item p-2">
       					<a href="mypage.do" class="btn btn-primary">마이페이지</a>
       				</li>
       				<li class="nav-item p-2">
       					<a href="#" class="btn btn-danger" onclick="logoutAction()">로그아웃</a>
       				</li>
       			<!-- <form action="logout.do" method="post">
       				<input type="submit" value="로그아웃" />
       			</form>  -->
      			</c:if> 
      	</ul>
       <hr />
       
       
       <div class="grid">
       		<c:forEach var="obj" items="${list}">
       		<a href="product.do?itemno=${obj.no}">
       			<div class="item">
       				<c:if test="${obj.imageNo != 0}">
       					<img src="${pageContext.request.contextPath}/item/image?no=${obj.imageNo}" style="width:100%; height:150px;" />
       				</c:if>
       				<c:if test="${obj.imageNo == 0}">
       					<img src="${pageContext.request.contextPath}/resources/images/default.png" style="width:100%; height:150px" />
       				</c:if>
       				
       				물품명 : ${obj.name}<br />
       				가격 : ${obj.price}<br />
       				내용 : ${obj.content}
       			</div>
       		</a>
       		</c:forEach>
       </div>
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