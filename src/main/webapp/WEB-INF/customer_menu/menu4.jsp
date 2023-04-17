<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
	<form action="deletepurchase.do" method="post" id="form4">
		<table class="table">
			<thead>
				<tr>
			  		<th scope="col">주문번호</th>
			   		<th scope="col">주문수량</th>
			    	<th scope="col">주문일자</th>
			    	<th scope="col">고객아이디</th>
			    	<th scope="col">고객명</th>
			    	<th scope="col">물품번호</th>
			    	<th scope="col">물품명</th>
			    	<th scope="col">물품가격</th>
			    	<th scope="col">주문금액</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="total" value="${0}" />
				<c:forEach var="obj" items="${list}">
		    	<tr>
					<th scope="row"><input type="checkbox" name="chk[]" value="${obj.no}" />${obj.no}</th>
					<td>${obj.cnt}</td>
					<td>${obj.regdate}</td>
					<td>${obj.customerid}</td>
					<td>${obj.customername}</td>
					<td>${obj.itemno}</td>
					<td>${obj.itemname}</td>
					<td><fmt:formatNumber value="${obj.itemprice}" pattern="#,###" /></td>
					<td><fmt:formatNumber value="${obj.cnt*obj.itemprice}" pattern="#,###" /></td>
					<c:set var="total" value="${total + (obj.cnt*obj.itemprice) }" />
		    	</tr>
		    	</c:forEach>
		    	<tr>
		    		<th colspan="8">합계</th>
		    		<td>
		    			<fmt:formatNumber value="${total}" pattern="#,###" /> 
		    		</td>
		    	</tr>
			</tbody>
		</table>
		<input type="button" class="btn btn-sm btn-primary" value="주문취소" onclick="deletePurchaseAction()" />
	</form>
</div>

<script>
	function deletePurchaseAction() {
		// 태그 중에서 name 값이 chk[]인 것을 n개 찾음
		const chk = document.getElementsByName("chk[]");
		
		let isCheck = 0;
		for(let i = 0; i < chk.length; i++) { // 찾은 개수만큼 반복
			if(chk[i].checked === true) { // 체크된 게 있다면
				isCheck = 1;
				break;
			}
		}
		// 체크 된 것이 있는지 확인
		if(isCheck === 1) {
			if(confirm('주문을 취소할까요?')) {
				document.getElementById("form4").submit();
			}
		}
		else {
			alert('항목을 체크하세요.');
			return false;
		}	
	}	
</script>