<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String id = request.getParameter("user_id"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Custom styles for this template-->
 <link href="/resources/css/join.css" rel="stylesheet">
 <script type="text/javascript">
 function changePw() {
		var form = document.form1;
			 if (form.password.value.length < 1) {
			 	 alert("비밀번호를 입력해주세요");
				  return;
			 }
			 if (form.passwordCheck.value.length < 1) {
				  alert("비밀번호 확인을 입력해주세요");
				  return;
			 }
		form.action="${path}/users/change_pw.do";
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
                                <h1 class="h4 text-gray-900 mb-4">비밀번호 변경</h1>
                            </div>
                            <form class="user" name="form1" method="post">
                                <div class="form-group row">
                                    <div class="col-sm-12">
                                    	<input type="hidden" name="user_id" id="user_id" value="<%=id%>">
                                        <input type="password" class="form-control form-control-user" id="password" name="password" placeholder="비밀번호"  required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <input type="password" class="form-control form-control-user" id="passwordCheck" name="passwordCheck" placeholder="비밀번호 확인" required>
                                    </div>
                                </div>
                                <button class="btn btn-primary btn-user btn-block"  type="submit"  id="submitBtn" onclick="changePw()">비밀번호 변경하기</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</body>
</html>