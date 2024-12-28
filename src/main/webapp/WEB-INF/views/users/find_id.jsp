<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>	아이디 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Custom styles for this template-->
 <link href="/resources/css/join.css" rel="stylesheet">
<style type="text/css">
body {
	text-align: center;
	background-color: #ffffff;
}
h2{
	margin-top: 10%;
}
#name, #userid{
	margin-bottom: 10px;
}

#inputGroup {
	text-align: center;
	align-content: center;
	margin-left: auto;
	margin-right: auto;
}

#find {
	margin-left: 50px;
}
</style>
<script type="text/javascript">
function findId() {
	var form = document.form1;
		 if (form.name.value.length < 1) {
		 	 alert("이름을 입력해주세요");
			  return;
		 }
		 if (form.email.value.length < 1) {
			  alert("이메일을 입력해주세요");
			  return;
		 }
	form.action="${path}/users/find_result_id.do";
	form.submit();
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
                                <h1 class="h4 text-gray-900 mb-4">아이디 찾기</h1>
                            </div>
                            <form class="user" name="form1" method="post">
                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control form-control-user" id="name" name="name" placeholder="이름"  required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control form-control-user" id="email" name="email" placeholder="이메일" required>
                                    </div>
                                </div>
                                <button class="btn btn-primary btn-user btn-block"  type="submit"  id="findBtn" onclick="findId()">아이디 찾기</button>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="${path}/users/findPw.do">비밀번호 찾기</a>
                            </div>
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