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
        <div style="width:600px; margin:0 auto; padding: 50px; border:1px solid #efefef;">
        	<h3>로그인</h3>
        	<form action="login.do"></form> <!-- /web04/customer/여기만 바뀜 -->
        	<form action="/login.do"></form> <!--  /login.do 만 남음 -->
        	
        	<form action="${pageContext.request.contextPath}/customer/login.do" method="post" id="form">
            <div class="row">
                <div class="col-sm">
	                <div class="form-floating mb-2">
	                    <input type="text" name="id" id="id" class="form-control" />
	                    <label for="id" id="lbl_check" class="form-label">아이디</label>
	                </div>
	                <div class="form-floating mb-2">
	                    <input type="password" name="pw" id="pw" class="form-control" />
	                    <label for="pw" class="form-label">암호</label>
	                </div>
	        
	                <div>
                    	<input type="button" value="로그인" class="btn btn-primary" onclick="loginAction()"/>
                    	<a href="join.do" class="btn btn-primary">회원가입</a>
                    </div>
                </div>
            </div>
            </form>
            
            
            <hr />
            <h3>로그인(ajax)</h3>
            <form action="${pageContext.request.contextPath}/customer/login.do" method="post" id="form">
            <div class="row">
                <div class="col-sm">
	                <div class="form-floating mb-2">
	                    <input type="text" id="id1" class="form-control" />
	                    <label for="id" id="lbl_check" class="form-label">아이디</label>
	                </div>
	                <div class="form-floating mb-2">
	                    <input type="password" id="pw1" class="form-control" />
	                    <label for="pw" class="form-label">암호</label>
	                </div>
	        
	                <div>
                    	<input type="button" value="로그인1" class="btn btn-primary" onclick="loginAction1()"/>
                    	<a href="join.do" class="btn btn-primary">로그인</a>
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
		async function loginAction1() {
			const id = document.getElementById("id1");
			const pw = document.getElementById("pw1");
			
			const url = '${pageContext.request.contextPath}/api/member/login.json';
			const headers = { "Content-Type":"application/x-www-form-urlencoded" }
			const body = { id : id.value, pw : pw.value };
			const { data } = await axios.post(url, body, {headers});
			console.log(data);
			if(data.ret === 1) {
				alert('로그인');
				window.location.href='home.do';
			}
			else {
				alert('로그인 실패');
			}
		}
		
		function loginAction() {
			const id = document.getElementById("id");
			const pw = document.getElementById("pw");
			
			if(id.value.length <= 0) {
				alert('아이디를 입력하세요.');
				id.focus();
				return false;
			}
			
			if(pw.value.length <= 0) {
				alert('패스워드를 입력하세요.');
				pw.focus();
				return false;
			}
			document.getElementById("form").submit();
		}

	</script>
	
</body>
</html>