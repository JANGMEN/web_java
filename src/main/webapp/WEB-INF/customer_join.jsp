<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>고객용회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
</head>

<body>
	<div class="container">
        <div style="width:600px; margin:0 auto; padding: 50px; border:1px solid #efefef;">
        	<h3>회원가입</h3>
        	<form action="join.do" method="post" id="form">
            <div class="row">
                <div class="col-sm">
	                <div class="form-floating mb-2">
	                    <input type="text" name="id" id="id" class="form-control" onkeyup="ajaxIDCheck(this)"/>
	                    <label for="id" id="lbl_check" class="form-label">아이디</label>
	                </div>
	                <div class="form-floating mb-2">
	                    <input type="password" name="pw" id="pw" class="form-control" />
	                    <label for="pw" class="form-label">암호</label>
	                </div>
	                <div class="form-floating mb-2">
	                    <input type="password" id="pw1" class="form-control" />
	                    <label for="pw1" class="form-label">암호확인</label>
	                </div>
	                <div class="form-floating mb-2">
	                    <input type="text" name="name" id="name" class="form-control" />
	                    <label for="name" class="form-label">이름</label>
	                </div>
	                <div class="form-floating mb-2">
	                    <input type="number" name="age" id="age" class="form-control" />
	                    <label for="age" class="form-label">나이</label>
	                </div>
	                <div>
                    	<input type="button" value="회원가입" class="btn btn-primary" onclick="joinAction()"/>
                    </div>
                </div>
            </div>
            </form>
		</div>            
	</div>
	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>

	<script>

	var idcheck = 0; // 1이면 사용가능 0은 사용불가
	
	// 공통변수 (모든 함수에서 사용가능)
	function joinAction() {
		const id = document.getElementById("id");
		const pw = document.getElementById("pw");
		const pw1 = document.getElementById("pw1");
		const name = document.getElementById("name");
		const age = document.getElementById("age");
		
		if(id.value.length <= 0) {
			alert('아이디를 입력하세요.');
			id.focus();
			return false; // 함수 종료, 전송하지 않음
		}
		
		if(pw.value.length <= 0) {
			alert('비밀번호를 입력하세요.');
			pw.focus();
			return false;
		}
		
		if(pw1.value.length <= 0) {
			alert('비밀번호를 입력하세요.');
			pw1.focus();
			return false;
		}
		
		if(name.value.length <= 0) {
			alert('이름을 입력하세요.');
			name.focus();
			return false;
		}
		
		if(age.value.length <= 0) {
			alert('나이를 입력하세요.');
			age.focus();
			return false;
		}
		// 유효성 검사하기
		// 입력항목은 있어야 함
		// 아이디 중복 사용가능
		// 암호 암호확인이 일치
		if(pw.value !== pw1.value) {
			alert('비밀번호가 일치하지 않습니다.');
			pw1.focus();
			return false;
		}
		
		if(idcheck === 0) {
			alert('사용가능한 아이디를 입력하세요.');
			id.focus();
			return false;
		}
		
		document.getElementById("form").submit();
	}
	
	
	async function ajaxIDCheck(e){
		console.log(e.value);
		if(e.value.length>0) {
			// rest api 호출
			const url 		= '${pageContext.request.contextPath}/api/member/idcheck.json?id=' + e.value;
			const headers 	= {"Content-Type":"application/json"};
			const {data} 	= await axios.get(url, {headers});
			console.log(data);
			if(data.ret === 1) {
				idcheck = 0;
				document.getElementById("lbl_check").innerText = '사용불가';
			}
			else if(data.ret === 0) {
				idcheck = 1;
				document.getElementById("lbl_check").innerText = '사용가능';
			}
		}
		else {
			idcheck = 0;
			document.getElementById("lbl_check").innerText = '아이디';
		}
	}
	</script>
	
</body>
</html>