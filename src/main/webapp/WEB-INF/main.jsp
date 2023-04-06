<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Dream Jeju</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
    <div id="container"> <!-- 컨테이너 -->
    	<jsp:include page="header.jsp"></jsp:include>
        <div id="slideShow"> <!-- 이미지 슬라이드쇼 -->
            <div id="slides">
                <img src="${pageContext.request.contextPath}/resources/images/photo-1.jpg" alt="">
                <img src="${pageContext.request.contextPath}/resources/images/photo-2.jpg" alt="">
                <img src="${pageContext.request.contextPath}/resources/images/photo-3.jpg" alt="">
                <img src="${pageContext.request.contextPath}/resources/images/photo-4.jpg" alt="">
                <img src="${pageContext.request.contextPath}/resources/images/photo-5.jpg" alt="">
                <img src="${pageContext.request.contextPath}/resources/images/photo-6.jpg" alt="">
                <button id="prev">&lang;</button>
                <button id="next">&rang;</button>
            </div>

        </div>
        <div id="contents"> <!-- 콘텐츠 -->
            <div id="tabMenu"> <!-- 탭 메뉴 -->
                <input type="radio" id="tab1" name="tabs" checked>
                <label for="tab1">공지사항</label>
                <input type="radio" id="tab2" name="tabs">
                <label for="tab2">갤러리</label>

                <div id="notice" class="tabContent">
                    <h2>공지사항 내용입니다.</h2>
                    <ul>
                        <li>사무실을 이전했습니다.</li>
                        <li>[참가 모집] 카약 체험에 초대합니다.</li>
                        <li>[참가 모집] 여름 방학 기간, 오름 체험단을 모집합니다..</li>
                        <li>겨울, 추천 여행지</li>
                        <li>가을, 추천 여행지</li>
                    </ul>
                </div>
                <div id="gallery" class="tabContent">
                    <h2>갤러리 내용입니다.</h2>
                    <ul>
                        <li><img src="${pageContext.request.contextPath}/resources/images/img-1.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/resources/images/img-2.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/resources/images/img-3.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/resources/images/img-1.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/resources/images/img-2.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/resources/images/img-3.jpg"></li>
                    </ul>
                </div>
            </div>
            <div id="links"> <!-- 퀵 링크 -->
                <ul>
                    <li>
                        <a href="#">
                            <span id="quick-icon1"></span>
                            <p>평화 기행</p>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span id="quick-icon2"></span>
                            <p>힐링 워크숍</p>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span id="quick-icon3"></span>
                            <p>문의하기</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
<script src="${pageContext.request.contextPath}/resources/js/slideshow.js"></script>
</body>
</html>