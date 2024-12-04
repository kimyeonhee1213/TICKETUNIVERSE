<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="/resources/css/join.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$("#loginBtn").click(function() {
			var userId = $("#user_id").val();
			var password = $("#password").val();
			if (userId == "") {
				alert("아이디를 입력해주세요");
				$("#user_id").focus();
				return;
			}
			if (password == "") {
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

<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-12">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">로그인</h1>
									</div>
									<form class="user"  name="form1" method="post">
										<div class="form-group">
											<input type="text" class="form-control form-control-user" id="user_id"  name="user_id" placeholder="아이디">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user" id="password" name="password" placeholder="비밀번호">
										</div>
										<c:if test="${message == 'error' }">
											<div style="color: red; text-align: center; padding-bottom: 10px; font-size: 12px;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
										</c:if>
										<c:if test="${message == 'logout' }">
											<div style="color: blue; text-align: center; padding-bottom: 10px; font-size: 12px;">로그아웃 처리되었습니다.</div>
										</c:if>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input" id="customCheck">
											    <label class="custom-control-label" for="customCheck">아이디 기억하기</label>
											</div>
										</div>
										<button id="loginBtn"  class="btn btn-primary btn-user btn-block" type="submit">로그인</button>
										<hr>
										<a href="index.html" class="btn btn-kakao btn-user btn-block"><i class="fab fa-google fa-fw"></i> 카카오톡으로 로그인하기</a>
										<a href="index.html" class="btn btn-google btn-user btn-block"> <i class="fab fa-facebook-f fa-fw"></i> 구글로 로그인하기 </a>
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="forgot-password.html">비밀번호를 잊어버리셨나요?</a>
									</div>
									<div class="text-center">
										<a class="small" href="${path}/users/join.do">회원가입하기</a>
									</div>
									<div class="text-center">
										<a class="small" href="${path}/">메인화면으로 가기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>