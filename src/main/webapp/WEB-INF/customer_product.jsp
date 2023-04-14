<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<c:if test="${not empty imageNo}">
			<c:forEach var="no" items="${imageNo}">
				<img src="${pageContext.request.contextPath}/item/image?no=${no}" style="width:200px; height:150px" />
			</c:forEach>
		</c:if>
		
		<c:if test="${empty imageNo}">
			<img src="${pageContext.request.contextPath}/resources/images/default.png" style="width:200px; height:150px" />
		</c:if>
		
		<p>${obj.no}</p>
		<p>${obj.name}</p>
		<p>${obj.content}</p>
		<p>${obj.price}</p>
		<form id="form" action="purchase.do" method="post">
			<input type="hidden" name="itemno" value="${obj.no}" />
			<select name="cnt">
				<c:forEach var="idx" begin="1" end="1000" step="1">
					<option value="${idx}">${idx}</option>
				</c:forEach>
			</select>
			<input type="submit" class="btn btn-sm btn-primary" value="주문하기" />
		</form>
	</div>

</body>
</html>