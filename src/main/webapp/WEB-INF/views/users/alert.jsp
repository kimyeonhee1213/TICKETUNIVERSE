<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<script>
//페이지 로드 후 메시지 표시 및 URL로 리다이렉트
	window.onload = function () {
	    const msg = "<%= request.getAttribute("msg") %>";
	    const url = "<%= request.getAttribute("url") %>";
	
	    if (msg) {
	        alert(msg); // 메시지를 알림창으로 표시
	    }
		
	    if (url) {
            // 현재 히스토리를 덮어쓰며 이동
            history.replaceState(null, null, url);
            location.replace(url);
        }
	};
</script>