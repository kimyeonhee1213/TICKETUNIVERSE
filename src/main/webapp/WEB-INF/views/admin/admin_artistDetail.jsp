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
		<input type="hidden" name="artist_order" value="${data.artist_order }">
		<div class="summary">
			<div class="summaryTop">
				<h1>${data.artist_name}</h1>
			</div>
			<hr class="hr-1">
			<div class="summaryBody">
				<div class="posterBox">
					<img class="poster_img" src="${data.thumb}">
				</div>
				<div class="info">
					<input type="button" value="목록" onclick="location.href='adminArtist.do'">
				</div>
			</div>
		</div>
	</div>
</div>
</body>

<!-- footer -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

</html>
