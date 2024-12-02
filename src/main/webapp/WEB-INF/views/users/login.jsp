<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="/resources/css/login.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$("#loginBtn").click(function() {
			var userId = $("#user_id").val();
			var password = $("#password").val();
			if(userId == ""){
				alert("아이디를 입력해주세요");
				$("#user_id").focus();
				return;
			}
			if(password == ""){
				alert("비밀번호를 입력해주세요");
				$("#password").focus();
				return;
			}
			document.form1.action = "${path}/users/loginCheck.do";
			document.form1.submit();
		});
	});
</script>
</head>
<body>
	<main class="form-signin w-100 m-auto">
	  <form name="form1" method="post">
	    <h1 class="h3 mb-3 fw-normal">로그인</h1>
	
	    <div class="form-floating">
	      <input type="text" class="form-control" id="user_id"  name="user_id"  placeholder="아이디입력"/>
	      <label for="user_id">아이디</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="password" name="password"  placeholder="비밀번호입력"/>
	    <label for="password">비밀번호</label>
	    </div>
			<c:if test="${message == 'error' }">
				<div style="color: red; text-align: center; padding-bottom: 10px; font-size: 12px;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
			</c:if>
			<c:if test="${message == 'logout' }">
				<div style="color: blue; text-align: center; padding-bottom: 10px; font-size: 12px;"" >로그아웃 처리되었습니다.</div>
			</c:if>
			<button id="loginBtn" class="btn btn-primary w-100 py-2" type="submit">로그인</button>
	    	<button id="signBtn" class="btn btn-primary w-100 py-2" type="button">회원가입</button>
	    	<a href="${path}/">메인으로 가기(임시)</button>
	  </form>
	</main>
</body>

</html>