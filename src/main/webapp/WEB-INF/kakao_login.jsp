<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>카카오로그인</title>
</head>


<body>
	<a id="kakao-login-btn" href="javascript:loginWithKakao()">
		<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222" alt="카카오 로그인 버튼" />
	</a>
	
	<button onclick="logoutWithKakao()">로그아웃</button>

	<hr />
	<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script>
		Kakao.init("1b56e9909e4ebdc5fedc85d2ed0a004a");
	
		function loginWithKakao() {
			 Kakao.Auth.login({
			 	success: function(authObj) {
			 		console.log('authObj', authObj);
			 		Kakao.API.request({
						url: '/v2/user/me',
						success: function(response) {
							console.log('response', response);
							alert('로그인성공');
							// 성공시 이동할 페이지
							// location.href="http://127.0.0.1:8080/web03/auth.do";
						}
					})
		        },
		        fail: function(err) {
					alert(JSON.stringify(err));
		        }
			});
		}
		
		
		function logoutWithKakao(){
			 if (Kakao.Auth.getAccessToken()) {
				
				 Kakao.API.request({
					url: '/v1/user/unlink',
					success: function (response) {
						console.log(response)
					},
					fail: function (error) {
					  console.log(error)
					},
				});
				
				Kakao.Auth.setAccessToken(null);
			 }
		}
	</script>
</body>
</html>