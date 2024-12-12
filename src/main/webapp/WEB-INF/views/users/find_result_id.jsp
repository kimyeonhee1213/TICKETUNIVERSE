<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
 <link href="/resources/css/join.css" rel="stylesheet">
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
										<h1 class="h4 text-gray-900 mb-2">아이디 찾기 조회 결과</h1>
										<hr>
												<p class="mb-4" style="color: red;"><strong>${user_id}</strong></p>
									</div>
									<hr>
									<div class="text-center">
										<a class="small" href="${path}/users/findPw.do">비밀번호 찾기</a>
									</div>
									<div class="text-center">
										<a class="small" href="${path}/users/login.do">로그인 하기</a>
									</div>
									<div class="text-center">
										<a class="small" href="${path}/users/join.do">회원가입</a>
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