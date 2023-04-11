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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
</head>

<body>
	<div class="container">
        <div style="width:600px; margin:0 auto; padding: 50px; border:1px solid #efefef;">
        	<h3>회원가입</h3>
            <div class="row">
                <div class="col-sm">
	                <div class="form-floating mb-2">
	                    <input type="text" id="id" class="form-control" />
	                    <label for="id" class="form-label">아이디</label>
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
	
	</script>
</body>
</html>