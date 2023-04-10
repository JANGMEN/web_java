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
	<table class="table">
		<thead>
			<tr>
	      	<th scope="col">물품번호</th>
	      	<th scope="col">물품명</th>
	      	<th scope="col">가격</th>
	      	<th scope="col">수량</th>
	      	<th scope="col">이미지</th>
	    	</tr>
	  	</thead>
	  	<tbody>
	  		<c:forEach var="obj" items="${list}">
	  			<tr>
					<td scope="row">${obj.no}</td>
					<td>${obj.name}</td>
					<td>${obj.price}</td>
					<td>${obj.quantity}</td>
					<td><a href="imagewrite.do?ino=${obj.no}" class="btn btn-primary">이미지 등록</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul id="pagination-demo" class="pagination-sm"></ul> <!-- 페이지네이션 -->
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
        crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js" integrity="sha512-frFP3ZxLshB4CErXkPVEXnd5ingvYYtYhE5qllGdZmcOlRKNEPbufyupfdSTNmoF5ICaQNO6SenXzOZvoGkiIA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script>
	// $(document).ready(function({})
	$(function() {
		$('#pagination-demo').twbsPagination({
		  totalPages: Number('${pages}'),
		  visiblePages: 10,
		  first : '처음',
		  last : '마지막',
		  prev : '이전',
		  next : '다음',
		  initiateStartPageClick : false,
		  startPage : Number('${param.page}'),
		  onPageClick: function (event, page) {
		   //$('#page-content').text('Page ' + page);
		  	window.location.href="select.do?page=" + page;
		  }
		});
	});
	</script>

</body>
</html>