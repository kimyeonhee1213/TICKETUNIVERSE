<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TICKETUNIVERSE</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="/resources/css/main.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/list.css" rel="stylesheet" type="text/css">
</head>
<head>
    <meta charset="UTF-8">
    <title>공연 목록</title>

</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <div class="container">
    	<div class="perform_list">
    		<c:forEach items="${list}" var="list">
    		<a class="perform_item" href="${path}/perform/detail?pf_order=${list.pf_order}">
    			<div class="content_wrap">
    				<img class="thumb" src="${list.thumb}"/>
    			</div>
    			<ul class="item_list">
    				<li class="title">${list.pf_name}</li>
    				<li>${list.pf_place}</li>
    				<li>${list.pf_date}</li>
    			</ul>
    		</a>
    	</c:forEach>
    	</div>
    	
    </div>
</body>
</html>
