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
            <div class="row">
                <div class="col-sm">
	                <div class="form-floating mb-2">
	                    <input type="text" id="id" class="form-control" onkeyup="ajaxIDCheck(this)"/>
	                    <label for="id" id="lbl_check" class="form-label">아이디</label>
	                </div>
	                <div class="form-floating mb-2">
	                    <input type="password" id="pw" class="form-control" />
	                    <label for="pw" class="form-label">암호</label>
	                </div>
	                <div class="form-floating mb-2">
	                    <input type="password" id="pw1" class="form-control" />
	                    <label for="pw1" class="form-label">암호확인</label>
	                </div>
	                <div class="form-floating mb-2">
	                    <input type="text" id="name" class="form-control" />
	                    <label for="name" class="form-label">이름</label>
	                </div>
	                <div class="form-floating mb-2">
	                    <input type="number" id="age" class="form-control" />
	                    <label for="age" class="form-label">나이</label>
	                </div>
	                <div>
                    	<input type="submit" value="회원가입" class="btn btn-primary" />
                    </div>
                </div>
            </div>
		</div>            
	</div>
	
	<script>
	async function ajaxIDCheck(e) {
		console.log(e.value);
		if(e.value.length > 0) {
			// rest api 호출
			const url = '${pageContext.request.contextPath}/api/member/idcheck.json?id=' + e.value;
			const headers = {"Content-Type":"application/json"};
			const {data} = await axios.get(url, {headers});
			// 결과값 받기
			console.log(data);
			if(data.ret === 1) {
				// 사용불가
				document.getElementById("lbl_check").innerText = '사용불가';
			}
			else if(data.ret === 0) {
				// 사용가능
				document.getElementById("lbl_check").innerText = '사용가능';
			}
		}
		else {
			document.getElementById("lbl_check").innerText = '아이디';
		}
	}
	
	</script>
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
        crossorigin="anonymous"></script>
</body>
</html>