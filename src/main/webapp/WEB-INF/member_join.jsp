<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>부트스트랩</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- Bootstrap용 css CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <style>
    
        .addition {
            background-color: aquamarine;
            border: 1px solid #C5A9FC;
        }

        .space {
            margin-top: 20px;
        }
        
        .addressinput {
        	margin : 0 auto;
        }
    </style>
</head>
<body>
    <div class="container space">
        <div class="row">
            <div class="col-sm">
                <form method="get">
                    <div class="form-floating mb-2">
                        <input type="email" id="mail2" class="form-control" placeholder="name@example.com">
                        <label for="mail2">Email Address</label>
                    </div>
                    <div class="form-floating mb-2">
                        <input type="password" id="pass" class="form-control" placeholder="name@example.com">
                        <label for="pass">Password</label>
                    </div>
                    <div class="form-floating mb-2">
                        <input type="password" id="pass2" class="form-control" placeholder="name@example.com">
                        <label for="pass2">Password Check</label>
                    </div>
                    <div class="form-floating mb-2">
                    	<input type="text" id="name" class="form-control" placeholder="XXX">
                        <label for="name">Name</label>
                    </div>
                    
                    <div class="addressinput mb-2">
                    	<input type="text" id="sample6_postcode" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample6_address" placeholder="주소"><br>
						<input type="text" id="sample6_detailAddress" placeholder="상세주소">
						<input type="text" id="sample6_extraAddress" placeholder="참고항목">
					</div>
                    
                    <input type="submit" value="회원가입" class="btn btn-sm btn-primary">
                </form>
            </div>
        </div>
    </div>
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    	function sample6_execDaumPostcode() {
    		// PostCode() obj = new PostCode();
    		// obj.open();
    		
    		//new PostCode().open();
    		new daum.Postcode({
    			oncomplete: function(data) {
    				console.log(data); // 전체 데이터
    				console.log(data.address); // 일부데이터 추출(키를 이용해서)
    				console.log(data['adderess']);
    				// 변수생성 => var, let
    				// 상수생성 => const
    				var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수
                    
                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
                 // '1' == 1 '1' === 1(엄격한 비교)   
                 // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        // 정규식, 정규표현식 패턴을 찾아서
                        // 예) 사용자가 입력한 이메일 주소가 정확한지 확인
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }
                 
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                    
    			}
    			
    		}).open();
    	}
    </script>


    <!-- Bootstrap용 js는 반드시 body에 위치해야 함! -->
    <!-- <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
</body>
</html>