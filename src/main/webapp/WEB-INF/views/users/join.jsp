<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Custom styles for this template-->
 <link href="/resources/css/join.css" rel="stylesheet">
 <script src="/resources/js/validation.js"></script>
 <script>
	$(function() {
		 $("#joinBtn").click(function() {
				var user_id = $("#user_id").val();
				var password = $("#password").val();
				var name = $("#name").val();
				var email = $("#email").val();
				var phone = $("#phone").val();

				var idCheck = $("#idCheck").val();
				var emailCheck = $("#emailCheck").val();
				
				if(isEmpty(name)){
					alert("이름을 입력해주세요");
					$("#name").focus();
					return false;
				}
				if(!isValidKor(name)){
					alert("이름은 한글로 입력해주세요");
					$("#name").focus();
					return false;
				}
				
				if(isEmpty(user_id)){
					alert("아이디를 입력해주세요");
					$("#user_id").focus();
					return false;
				}
				if(!isValidId(user_id)){
					alert("아이디는 영문, 숫자를 사용한 4~15자리로 입력");
					$("#user_id").focus();
					return false;
				}
				if(idCheck == "N"){
					alert("아이디 중복 체크를 하세요.");
					return false;
				}

				if(isEmpty(phone)){
					alert("전화번호를 입력해주세요");
					$("#phone").focus();
					return false;
				}

				if(isEmpty(email)){
					alert("이메일을 입력해주세요");
					$("#email").focus();
					return false;
				}
				if(!isValidEmail(email)){
					alert("이메일을 제대로 입력해주세요");
					$("#email").focus();
					return false;
				}
				if(emailCheck == "N"){
					alert("이메일 중복 체크를 하세요.");
					return false;
				}

				if(isEmpty(password)){
					alert("비밀번호를 입력해주세요");
					$("#password").focus();
					return false;
				}
				
				document.form1.action = "${path}/users/register.do";
				document.form1.submit();
		});
	});

	
	function find_id() {
		var user_id = $("#user_id").val();
		
		if(isEmpty(user_id)){
			alert("아이디를 입력해주세요");
			$("#user_id").focus();
			return;
		}
		
		if(!isValidId(user_id)){
			alert("아이디는 영문, 숫자를 사용한 4~15자리로 입력");
			$("#user_id").focus();
			return;
		}
		
    	$.ajax({
    		url : "${path}/users/idCheck.do",
    		type:"POST",
    		dataType:"JSON",
    		data:{"user_id":$("#user_id").val()},
    		success: function(data) {
    			if(data == 1){
    				alert("이미 있는 아이디입니다.");
    			} else if(data == 0){
    				$("#idCheck").attr("value","Y");
    				alert("사용 가능한 아이디입니다.");
    			}
    		}
    	});
    }   
	
	function find_email() {
		
		var email = $("#email").val();
		
		if(isEmpty(email)){
			alert("이메일을 입력해주세요");
			$("#email").focus();
			return;
		}
		
		if(!isValidEmail(email)){
			alert("이메일을 제대로 입력해주세요");
			$("#email").focus();
			return;
		}
    	$.ajax({
    		url : "${path}/users/emailCheck.do",
    		type:"POST",
    		dataType:"JSON",
    		data:{"email":$("#email").val()},
    		success: function(data) {
    			if(data == 1){
    				alert("이미 있는 이메일입니다.");
    			} else if(data == 0){
    				$("#emailCheck").attr("value","Y");
    				alert("사용 가능한 이메일입니다.");
    			}
    		}
    	});
    }   
 </script>
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <!-- <div class="col-lg-5 d-none d-lg-block bg-register-image"></div> -->
                    <div class="col-lg-12">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">TICKET UNIVERSE 회원가입</h1>
                            </div>
                            <form class="user" name="form1">
                                <div class="form-group row">
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control form-control-user" id="name" name="name" placeholder="이름" required>
                                    </div>
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control form-control-user" id="user_id" name="user_id" placeholder="아이디" required>
                                    </div> 
                                    <div class="col-sm-3">
                                        <button type="button" class="btn btn-google btn-user btn-block" onclick="find_id();" id="idCheck"  value="N">아이디 중복 체크</button>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-4">
                                        <input type="tel" class="form-control form-control-user" id="phone" name="phone" placeholder="전화번호" required>
                                    </div>
                                    <div class="col-sm-5"> 
                                        <input type="text" class="form-control form-control-user" id="email"  name="email" placeholder="이메일" required>
                                    </div>
                                    <div class="col-sm-3">
                                        <button type="button" class="btn btn-google btn-user btn-block" onclick="find_email();" id="emailCheck"  value="N">이메일 중복 체크</button>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user" id="password" name="password" placeholder="비밀번호" required>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"  id="passwordRepeat"  name="passwordRepeat" placeholder="비밀번호 확인" required>
                                    </div>
                                </div>
                                <button class="btn btn-primary btn-user btn-block"  type="submit"  id="joinBtn">회원가입</button>
                                <hr>
                                <a href="${path}/users/findId.do" class="btn btn-kakao btn-user btn-block"><i class="fab fa-google fa-fw"></i>아이디 찾기</a>
								<a href="${path}/users/findPw.do" class="btn btn-google btn-user btn-block"> <i class="fab fa-facebook-f fa-fw"></i>비밀번호 찾기</a>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="${path}/users/login.do">이미 계정이 있나요? 로그인</a>
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

</body>
</html>