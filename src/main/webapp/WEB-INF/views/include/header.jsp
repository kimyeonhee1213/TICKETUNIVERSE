<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
	
<div class="headerDiv1">
	<div class="hImg">
		<a href="/"><img class="headerImg" src="/resources/images/logo.jpg"></a>
	</div>
	<div class="search">
		<input class="scInput" type="text" placeholder="검색어 입력">
		<img class="scImg" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
	</div>
</div>
<div class="headerDiv2">
<div class="menu">
	<c:set var="userRole" value="${sessionScope.role}" />
	<nav id="topMenu" >
		<ul class="nav nav-underline">
			<c:if test="${userRole ne '관리자' }">
				<li class="nav-item topMenuLi">
	                <a class="nav-link menuLink" href="${path}/perform/list?category_id=CT1&sub=0">콘서트</a>
	                <ul class="submenu">
	                    <li><a href="${path}/perform/list?category_id=CT1&sub=0" class="submenuLink longLink">전체보기</a></li>
	                    <li><a href="${path}/perform/list?category_id=CT1&sub=1" class="submenuLink longLink">국내</a></li>
	                    <li><a href="${path}/perform/list?category_id=CT1&sub=2" class="submenuLink longLink">해외</a></li>
	                </ul>
	            </li>
	            <li class="nav-item topMenuLi">
	                <a class="nav-link menuLink" href="${path}/perform/list?category_id=CT2&sub=0">뮤지컬</a>
	                <ul class="submenu">
	                    <li><a href="${path}/perform/list?category_id=CT2&sub=0" class="submenuLink">전체보기</a></li>
	                    <li><a href="${path}/perform/list?category_id=CT2&sub=1" class="submenuLink">라이선스</a></li>
	                    <li><a href="${path}/perform/list?category_id=CT2&sub=2" class="submenuLink">창작</a></li>
	                </ul>
	            </li>
	            <li class="nav-item topMenuLi">
	                <a class="nav-link menuLink" href="${path}/perform/list?category_id=CT3&sub=0">연극</a>
	                <ul class="submenu">
	                    <li><a href="${path}/perform/list?category_id=CT3&sub=0" class="submenuLink">전체보기</a></li>
	                    <li><a href="${path}/perform/list?category_id=CT3&sub=1" class="submenuLink">대학로</a></li>
	                    <li><a href="${path}/perform/list?category_id=CT3&sub=2" class="submenuLink">기타지역</a></li>
	                </ul>
	            </li>
	            <li class="nav-item topMenuLi">
	                <a class="nav-link menuLink" href="${path}/admin/adminArtist.do">아티스트</a>
	            </li>
	        </c:if>
	        <c:if test="${userRole eq '관리자' }">
				<li class="nav-item topMenuLi" style="margin-left:10px;">
	                <a class="nav-link menuLink" href="#">공연 관리</a>
	            </li>
	            <li class="nav-item topMenuLi">
	                <a class="nav-link menuLink" href="${path}/admin/adminArtist.do">아티스트 관리</a>
	            </li>
	            <li class="nav-item topMenuLi">
	                <a class="nav-link menuLink" href="#">회원 관리</a>
	            </li>
	        </c:if>
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
				<c:if test="${userRole ne '관리자'}">
					<li class="nav-item"><a class="nav-link active" id="alogout" aria-current="page" href="${path}/users/info.do">마이페이지</a></li>
				</c:if>
				<li class="nav-item"><a class="nav-link active" id="alogout" aria-current="page" href="${path}/users/logout.do">로그아웃</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
</div>
	