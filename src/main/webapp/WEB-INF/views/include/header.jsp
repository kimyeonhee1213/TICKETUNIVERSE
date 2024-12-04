<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<div class="headerDiv1">
	<div class="hImg">
		<img src="/resources/images/logo.jpg">
	</div>
	<div class="search">
		<input class="scInput" type="text" placeholder="검색어 입력">
		<img class="scImg" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
	</div>
</div>
<div class="headerDiv2">
<div class="menu">
	<nav id="topMenu" >
		<ul class="nav nav-underline">
			<li class="nav-item topMenuLi">
                <a class="nav-link menuLink" href="#">콘서트</a>
                <ul class="submenu">
                    <li><a href="#" class="submenuLink longLink">전체보기</a></li>
                    <li><a href="#" class="submenuLink longLink">국내</a></li>
                    <li><a href="#" class="submenuLink longLink">해외</a></li>
                </ul>
            </li>
            <li class="nav-item topMenuLi">
                <a class="nav-link menuLink" href="#">뮤지컬</a>
                <ul class="submenu">
                    <li><a href="#" class="submenuLink">전체보기</a></li>
                    <li><a href="#" class="submenuLink">라이선스</a></li>
                    <li><a href="#" class="submenuLink">창작</a></li>
                </ul>
            </li>
            <li class="nav-item topMenuLi">
                <a class="nav-link menuLink" href="#">연극</a>
                <ul class="submenu">
                    <li><a href="#" class="submenuLink">전체보기</a></li>
                    <li><a href="#" class="submenuLink">대학로</a></li>
                    <li><a href="#" class="submenuLink">기타지역</a></li>
                </ul>
            </li>
            <li class="nav-item topMenuLi">
                <a class="nav-link menuLink" href="#">아티스트</a>
            </li>
		</ul>
	</nav>
</div>
<div class="login">
	<ul class="nav justify-content-end">
		<c:choose>
			<c:when test="${sessionScope.user_id == null}">
				<li class="nav-item"><a class="nav-link active" id="alogin" aria-current="page" href="${path}/users/login.do">로그인</a></li>
                <li class="nav-item"><a class="nav-link active" id="ajoin" aria-current="page" href="${path}/users/join.do">회원가입</a></li>
			</c:when>
			<c:otherwise>
				<!-- 로그인한 상태 -->
				<li class="nav-item"><label style="padding-top: 8px;">${sessionScope.name}님이 로그인 중입니다</label></li>
				<li class="nav-item"><a class="nav-link active" id="alogout" aria-current="page" href="${path}/users/logout.do">로그아웃</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
</div>
	