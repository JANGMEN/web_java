<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>게시판목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous"><title>Insert title here</title>
</head>

<body>
	<div class="container">
		<table class="table table-hover">
  			<thead>
    			<tr>
					<th scope="col">글번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">조회수</th>
					<th scope="col">날짜</th>
			    </tr>
  			</thead>
			<tbody id="tbody">
			</tbody>
		</table>
		
		<div class="row justify-content-center">
			<div class="col-4">
				<ul id="pagination-demo" class="pagination"></ul>
			</div>
		</div>
	</div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
	<script>
	$(function(){

		// 1. restful 호출해서 목록을 받아오는 것.
		async function ajaxBoardList(page){
			// 같은 서버내에서는  http://127.0.0.1:8080/web03 생략가능
			const url = '${pageContext.request.contextPath}/api/board/select.json?page=' + page;
			const headers = {"Content-Type":"application/json"};
			const { data } = await axios.get(url, {headers});
			console.log(data);
			
			// 2.함수를 pages정보를 넘겨서 생성시킴
			initPagination( Number(data.pages) );
			
			const tbody = document.getElementById('tbody');
			tbody.innerHTML = '';
			for(let tmp of data.list) {
				console.log(tmp.no, tmp.title, tmp.writer);
				tbody.innerHTML += 
					`<tr>` + 
						'<td scope="row">'+tmp.no +'</td>' +
						'<td>' + tmp.title + '</td>' +
						'<td>' + tmp.writer + '</td>' +
						'<td>' + tmp.hit + '</td>' +
						'<td>' + tmp.regdate + '</td>' +
					`</tr>`;
			}
		};
		
		ajaxBoardList(1);
		
		// 2. 페이지네이션 생성하는 함수
		function initPagination( pages ) {
			$('#pagination-demo').twbsPagination({
				  totalPages	: pages,
				  visiblePages	: 10,
				  first 		: '≪',
				  last 			: '≫',
				  prev 			: '<',
				  next 			: '>',
				  onPageClick	: function (event, page) {
					  // 1번 함수호출				      
					  ajaxBoardList(page);
				  }
			});
		};
	});
	</script>

</body>
</html>