<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false"%>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TICKETUNIVERSE</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="/resources/css/main.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/admin_artist.css" rel="stylesheet" type="text/css">
</head>

<body>

<!-- header -->
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<div class="container">
	<br><br><br>
	<div class="row">
		<c:if test="${not empty alertMsg }">
			<script>
				alert("${alertMsg}");
			</script>
		</c:if>
		<form action="artistInsert.do" method="post" name="writeForm" enctype="multipart/form-data">
		<input type="hidden" name="max_id" value="${data.max_id }">
		<input type="hidden" name="artist_order" value="${data.artist_order }">
		<div class="summary">
			<div class="summaryTop">
				아티스트명 : <input type="text" name="artist_name">
			</div>
			<hr class="hr-1">
			<div class="summaryBody">
				<%-- <div class="posterBox">
					<img class="poster_img" src="${data.thumb}">
				</div> --%>
				<input type="file" name="file">
				<div class="info">
					<input type="submit" value="등록">
					<input type="button" value="목록" onclick="location.href='adminArtist.do'">
				</div>
			</div>
		</div>
		</form>
	</div>
</div>
</body>

<!-- footer -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

</html>
