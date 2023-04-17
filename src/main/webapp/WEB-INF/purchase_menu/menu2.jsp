<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<h3> 회원별 주문목록 </h3>
	<div style="width:700px; border:1px solid #cccccc; padding:30px;">
		<canvas id="myChart"></canvas>
	</div>
	<button onclick="changeChart()"> 차트변경 </button>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
	const ctx = document.getElementById("myChart").getContext("2d");
	const config={
			type : 'bar',
			data : {
				labels : ['a', 'b', 'c'],
				datasets : [
					{
						label : '테스트',
						data : [10, 20, 30]
					},
				] 
			}
	}
	const chart = new Chart(ctx, config);
	
	async function changeChart() {
		const url = '${pageContext.request.contextPath}/api/purchase/member.json';
		const headers = {"Content-Type":"application/json"};
		const {data} = await axios.get(url, {headers});
		console.log(data); // [{...}, {...}]
		let label = []; // 빈 배열 생성하기
		let cnt = []; // 빈 배열 생성하기
		
		
		for(let tmp of data) {
			console.log(tmp);
			label.push(tmp.CUSTOMERID); // 고객 아이디만 추출해서 label 변수에 추가하기
			cnt.push(tmp.CNT); // 주문수량만 추출해서 cnt 변수에 추가하기
		}
		// data 값을 config 변수로 변경
		config.data.labels = label; // 추출한 배열변수로 변경
		config.data.datasets[0].label="회원별 주문수량";
		config.data.datasets[0].data = cnt; // 추출한 배열 변수로 변경
		chart.update();
	}
	
	changeChart(); // 함수는 자동으로 호출되지 않기 때문에 호출하기
</script>

