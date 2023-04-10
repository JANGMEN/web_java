<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>물품이미지등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
</head>

<body>
	<div class="container">
        <div style="width:800px; margin:0 auto; padding: 50px; border:1px solid #efefef;">
        	<h3>물품이미지등록</h3>
        	<hr />
        	<form id="form" action="${pageContext.request.contextPath}/item/imagewrite.do" method="post" enctype="multipart/form-data">
	            <div class="row">
	                <div class="col-sm">
		                <div class="form-floating mb-2">
		                    <input type="text" name="ino" id="ino"
		                    	value="${ino}" class="form-control" readonly />
		                    <label for="ino" class="form-label">물품번호</label>
		                </div>
		                
		                <div class="form-floating mb-2">
		                	<img src="${pageContext.request.contextPath}/resources/images/default.png" 
		                		id="img" style="width:200px;height:200px; cursor:pointer" onclick="clickImage()">
		                    <input type="file" name="file" id="file" class="form-control" style="display:block" onchange="imageChange(this)" />
		                </div>
	
		                <div>
	                    	<input type="button" value="등록" class="btn btn-primary" 
	                    		onclick="insertImageItem()"/>
	                    	<a href="select.do" class="btn btn-success">목록으로</a>	
	                    </div>
	                </div>
	            </div>
            </form>
            
            <hr />
            
            <form id="form1" action="imagewritebatch.do?ino=${ino}" method="post" enctype="multipart/form-data">
	           <c:forEach var="idx" begin="1" end="3" step="1">
		                <img src="${pageContext.request.contextPath}/resources/images/default.png" 
		                	 class="imgs"
		                	 style="width:200px;height:200px; cursor:pointer" />
		                <input type="file" name="file[]" onchange="imageChangeBatch(this, '${idx-1}')"/>
		                <br />
		       </c:forEach>
			   <input type="button" value="일괄등록" onclick="insertImageBatch()" class="btn btn-primary" />
	           <a href="select.do" class="btn btn-success">목록으로</a>        
            </form> 
		</div>            
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
	<script>
	//	document.getElementById("아이디"); id가 일치하는 1개 찾기
	//	document.getElementsByName("name값"); name값이 일치하는 n개 찾기
	//	document.getElementsByClassName("class값"); class값이 일치하는 n개 찾기
	//	document.getElementsByTagName("img"); 태그가 img인 n개 찾기
		
		const imgs = document.getElementsByClassName("imgs"); // <img src class="imgs" />
		const files = document.getElementsByName("file[]"); // <input type="file" name="file[]" />
		function imageChangeBatch(e, idx) { // 첨부한 파일 정보(e), type=file의 위치(0부터, idx)
			if(e.files.length > 0) {
				imgs[Number(idx)].src=URL.createObjectURL(e.files[0]);
			}
			else {
				imgs[Number(idx)].src="${pageContext.request.contextPath}/resources/images/default.png";
			}
		}
		
		function insertImageBatch() {
			// 유효성 검사
			var chk = 0;
			for(let i = 0; i < files.length; i++) { // 반복문으로 files 전체 반복
				if(files[i].value.length <= 0) { // 첨부하지 않은 것을 발견하면
					alert('이미지를 첨부하세요.'); // 알림창 표시
					chk = 1; 
					break; // 반복문 종료
				}
			}
			if(chk === 0) { // if을 한 번도 수행하지 않았다면
				// form 전송
				document.getElementById("form1").submit();	
			}
		}
	
		function clickImage() {
			document.getElementById("file").click();
		}
		function imageChange(e) {
			const img = document.getElementById("img");
			console.log(e.files);
			if(e.files.length > 0) { // 첨부
				console.log(URL.createObjectURL(e.files[0])); // 파일을 첨부하면 크롬에서 blob:http://1.237.....
				img.src = URL.createObjectURL(e.files[0]); // 가상의 url 정보를 생성해서 추가함
			}
			else { // 취소
				document.getElementById("img").src = "${pageContext.request.contextPath}/resources/images/default.png";
			}
		}
		function insertImageItem() {
			// 유효성 검사한 후
			const file = document.getElementById("file");
			if(file.value.length <= 0) {
				alert("파일첨부 할 것");
			}
			
			
			// form 태그 전송
			document.getElementById("form").submit();
		}
	</script>
</body>
</html>