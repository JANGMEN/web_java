<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>게시판글쓰기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet" />
</head>

<body>
	<div class="container">
        <div style="width:800px; margin:0 auto; padding: 50px; border:1px solid #efefef;">
        	<h3>물품등록 게시판</h3>
        	<hr />
        	<!--  <form action="/write.do" method="post"> 이렇게 쓰면 주소창에 포트번호 뒤에 바로 write.do가 붙음 -->
        	<form id="form" action="${pageContext.request.contextPath}/item/write.do" method="post">
            <div class="row">
                <div class="col-sm">
	                <div class="form-floating mb-2">
	                    <input type="text" name="name" id="name" class="form-control" autofocus required />
	                    <label for="title" class="form-label">물품명</label>
	                </div>
	                
					<div style="margin-bottom:5px;">
	                    <div id="editor" style="height:300px;">
						  <p>물품설명</p>
						  <p><br></p>
						</div>
	                </div>
	                
	                <textarea id="content" name="content" style="display:block"></textarea>
	                
	                <div class="form-floating mb-2">
	                    <input type="number" name="price" id="price" class="form-control" required />
	                    <label for="price" class="form-label">가격</label>
	                </div>
	                
	                <div class="form-floating mb-2">
	                    <input type="number" name="quantity" id="quantity" class="form-control" required />
	                    <label for="quantity" class="form-label">수량</label>
	                </div>

	                <div>
                    	<input type="button" value="등록" class="btn btn-primary" 
                    		onclick="insertItem()"/> <!-- type을 button으로 바꾸면 눌러도 전송이 안됨. submit은 전송함 -->
                    </div>
                </div>
            </div>
            </form>
		</div>            
	</div>
	
	
	<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
	<script>
		
		const toolbarOptions = [
		  ['bold', 'italic', 'underline', 'strike'],        // toggled buttons
		  ['blockquote', 'code-block'],

		  [{ 'header': 1 }, { 'header': 2 }],               // custom button values
		  [{ 'list': 'ordered'}, { 'list': 'bullet' }],
		  [{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
		  [{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
		  [{ 'direction': 'rtl' }],                         // text direction

		  [{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
		  [{ 'header': [1, 2, 3, 4, 5, 6, false] }],

		  [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
		  [{ 'font': [] }],
		  [{ 'align': [] }],

		  ['clean']                                         // remove formatting button
		];
	
		// 위쪽에 있는 태그중에서 id가 editor인것을 찾아서 toolbar는 toolbarOptions의 값으로 대체하고 태마를 snow로 해서 변경
		const quill = new Quill('#editor', {
			modules: {
				toolbar: toolbarOptions
			},
			theme: 'snow'
		});
		
		function insertItem() {
			// 물품명 유효성 검사
			const name = document.getElementById("name");
			if(name.value.length <= 0) {
				alert('물품명을 입력하세요.');
				name.focus();
				return false;
			}
			
			// 가격 유효성 검사
			const price = document.getElementById("price");
			if(price.value.length <= 0) {
				alert('수량을 입력하세요.');
				price.focus();
				return false;
			}
			
			// 수량 유효성 검사
			const quantity = document.getElementById("quantity");
			if(quantity.value.length <= 0) {
				alert('수량을 입력하세요.');
				quantity.focus();
				return false;
			}
			
			// div 태그의 내용을 전송할 수 있게 변경(textarea로 복사)
			const divContent = quill.root.innerHTML;
			document.getElementById("content").value = divContent;
			// form 태그 전송시킴
			document.getElementById("form").submit();
			
		}
	</script>
</body>
</html>