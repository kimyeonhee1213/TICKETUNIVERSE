<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="/resources/css/main.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/list.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/profile.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>회원정보 수정</title>
<script src="/resources/js/validation.js"></script>
<script type="text/javascript">
function save() {
	var name = $("#name").val();
	var password = $("#password").val();
	var confirmPassword = $("#passwordR").val();
	var phone = $("#phone1").val() + $("#phone2").val() + $("#phone3").val();
	$("#phone").val(phone);
	
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
	
	if(isEmpty(phone)){
		alert("전화번호를 입력해주세요");
		$("#phone1").focus();
		return false;
	}
	
	if(isEmpty(password)){
		alert("비밀번호를 입력해주세요");
		$("#password").focus();
		return false;
	}
	
	if(isEmpty(confirmPassword)){
		alert("비밀번호 확인을 입력해주세요");
		$("#passwordR").focus();
		return false;
	}
	
	if (!isMatching(password, confirmPassword)) {
        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        $("#passwordR").focus();
        return false;
    }
	
	
	document.form1.action = "${path}/users/update.do"
	document.form1.submit();
	
}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/mypage.jsp"></jsp:include>
    <div class="div1">
        <h1 class="title">회원 정보</h1>
        <form name="form1" method="post">
        	<c:forEach var="list" items="${list}">
        		<table class="info-table">
		            <tr>
		                <th>이름</th>
		                <td><input type="text" id="name" name="name" value="${list.name}" required></td>
		            </tr>
		            <tr>
		                <th>아이디</th>
		                <td><input type="text" id="user_id" name="user_id" value="${list.user_id}" readonly></td>
		            </tr>
		            <tr>
		                <th>비밀번호</th>
		                <td>
		                    <input type="password" id="password" name="password" placeholder="비밀번호 입력" required>
		                </td>
		            </tr>
		            <tr>
		                <th>비밀번호 확인</th>
		                <td>
		                    <input type="password" id="passwordR" name="passwordR" placeholder="비밀번호 확인" required>
		                    <span class="help-text">비밀번호를 한번 더 입력해주세요.</span>
		                </td>
		            </tr>
		            <tr>
		                <th>휴대전화</th>
		                <td class="phone-inputs">
		                    <input type="tel" maxlength="3" id="phone1" value="${fn:substring(list.phone,0,3)}" required>
		                    <input type="tel" maxlength="4" id="phone2" value="${fn:substring(list.phone,3,7)}" required>
		                    <input type="tel" maxlength="4" id="phone3" value="${fn:substring(list.phone,7,11)}" required>
		                    <input type="hidden" id="phone" name="phone" value="">
		                </td>
		            </tr>
		            <tr>
		            	<td colspan="2">
		            		 <div class="button-container">
				                <button class="custom-btn secondary-btn">취소</button>
				                <button class="custom-btn primary-btn" onclick="save()">저장</button>
				            </div>
		            	</td>
		            <tr>
		        </table>
        	</c:forEach>
        </form>
    </div>
</body>
</html>