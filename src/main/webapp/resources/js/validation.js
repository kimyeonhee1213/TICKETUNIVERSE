// 함수: 입력값이 비어있는지 확인
function isEmpty(value) {
    return value.trim() === "";
}

// 함수: 이메일 형식 유효성 검사
function isValidEmail(email) {
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

// 함수: 비밀번호 유효성 검사 (최소 8자, 숫자, 특수 문자 포함)
function isValidPassword(password) {
    var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    return passwordRegex.test(password);
}

// 함수: 두 입력값(예: 비밀번호 확인)이 동일한지 확인
function isMatching(value1, value2) {
    return value1 === value2;
}

// 함수: 아이디 유효성검사 (영문자, 숫자, 4~15)
function isValidId(user_id){
	var idRegex = /^[A-Za-z0-9]{4,15}$/;
	return idRegex.test(user_id);
}

// 함수: 한글 유효성검사
function isValidKor(name){
	var korRegex = /^[가-힣]+$/;
	return korRegex.test(name);
}




