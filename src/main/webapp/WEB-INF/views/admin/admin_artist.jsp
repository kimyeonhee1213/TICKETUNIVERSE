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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="/resources/css/main.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/admin3.css" rel="stylesheet" type="text/css">
    
<script type="text/javascript">

	$(document).ready(function() {
		var target = $(".dropbtn");

		// 버튼을 클릭시 드롭다운 열림
		$(".dropbtn").on("click", function(e) {
			if ($(this).next().css("display") == "none") {
				$("[id^='dropdown_']").hide();
				$(this).next().show();
			} else {
				$("[id^='dropdown_']").hide();
			}
		});

		// 외부를 클릭시 드롭다운 닫힘
		$(document).mouseup(function(e) {
			if (target.has(e.target).length == 0) {
				$("[id^='dropdown_']").hide();
			}
		});

		
		// 아티스트 찜
		$("[id^='like_']").on("click", function() {

			var userId = $("#usesrId").val();
			var artistId = $(this).prev().val();

			// 아티스트 찜 안 되어있는 경우
			if ($(this).find('img').hasClass('likeArtistNull')) {
				$(this).find('img').attr({
					'src' : '/resources/images/red_heart.png'
				});

				$.ajax({
					type : 'POST',
					url : 'likeUp.do',
					contentType : 'application/json',
					data : JSON.stringify({
						"userId" : userId,
						"artistId" : artistId
					}),
					success : function(data) {
						location.reload();
					},
					error : function(e) {
						alert("error : " + e);
					}
				})//end ajax

			// 아티스트 찜 되어있는 경우
			} else {
				$(this).find('img').attr({
					'src' : '/resources/images/heart.png',
				});
				
				$.ajax({
					type : 'POST',
					url : 'likeDown.do',
					contentType : 'application/json',
					data : JSON.stringify({
						"userId" : userId,
						"artistId" : artistId
					}),
					success : function(data) {
						location.reload();
					},
					error : function(e) {
						alert("error : " + e);
					}
				})//end ajax
			}

		});

	});
</script>
    
</head>

<body>

<!-- header -->
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<div class="container">
	<br><br><br>
	<div class="row">
		<form name="form1">
			<div class="atSearch">
				<input id="searchh" class="atScInput" type="text" name="keyword" value="${keyword }" placeholder="아티스트를 입력해 주세요">
				<img id="searchBtn" class="atScImg" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
				<input type="hidden" name="page" value="1">
			</div>
		</form>
		<c:if test="${userId eq 'admin' }">
			<div class="arBtnDiv">
				<button type="button" class="arBtn" onclick="location.href='artistInsertPage.do'">아티스트 추가 +</button>
			</div>
		</c:if>
    	<c:if test="${not empty alertMsg }">
			<script>
				alert("${alertMsg}");
			</script>
		</c:if>
		<!-- 페이징 -->
		<!-- form2에 페이징 버튼 클릭 시 현재 페이지 정보와 검색 상황일 때 페이징 유지를 위한 조건을 담아 보냄 -->
		<div class="mainDiv">
			<div class="artistListDiv">
				<c:forEach var="data" items="${data }" varStatus="status">
					<div class="artistDiv">
						<div class="atDiv_1">
							<c:choose>
							 <c:when test="${userId eq 'admin' }">
								<a href="#" onclick="location.href='adminArtistUpdatePage.do?artist_order=${data.artist_order}'">
									<img class="atDiv_img" src="${data.thumb}">
								</a>
							 </c:when>
							 <c:otherwise>
							 	<a href="#" onclick="location.href='adminArtistDetailPage.do?artist_order=${data.artist_order}'">
									<img class="atDiv_img" src="${data.thumb}">
								</a>
							 </c:otherwise>
							</c:choose>
						</div>
						<div class="atDiv_2">
							<c:choose>
							 <c:when test="${userId eq 'admin' }">
								<a href="#" class="atDiv_name" onclick="location.href='adminArtistUpdatePage.do?artist_order=${data.artist_order}'">
									${data.artist_name }
								</a>
							 </c:when>
							 <c:otherwise>
							 	<a href="#" class="atDiv_name" onclick="location.href='adminArtistDetailPage.do?artist_order=${data.artist_order}'">
									${data.artist_name }
								</a>
							 </c:otherwise>
							</c:choose>
						</div>
						<c:if test="${userId eq 'admin' }">
							<div class="moreDiv">
							    <div class="dropdown">
							    	<input type="hidden" name="artist_id" value="${data.artist_id }">
									<button class="dropbtn"></button>
									<div id="dropdown_${data.artist_id }" class="dropdown-content" style="display:none;">
										<a href="#" onclick="location.href='adminArtistUpdatePage.do?artist_order=${data.artist_order}'">수정</a>
										<a href="#" onclick="location.href='artistDelete.do?artist_order=${data.artist_order}'">삭제</a>
									</div>
								</div>
						    </div>
						</c:if>
						<div class="summaryEnd">
							<div class="right_area">
							  <input type="hidden" id="usesrId" name="usesrId" value="${userId}">
							  <input type="hidden" id="artistId" name="artistId" value="${data.artist_id }">
							  <a href="javascript:;" class="icon heart" id="like_${data.artist_id }">
							  	 <c:choose>
							  	 	<c:when test="${data.likeCheck eq 'N' }">
								     <img src="/resources/images/heart.png" class="likeArtistNull" alt="찜하기">
							  	 	</c:when>
							  	 	<c:when test="${data.likeCheck eq 'Y' }">
							  	 	 <img src="/resources/images/red_heart.png" alt="찜하기">
							  	 	</c:when>
							  	 </c:choose>
							  </a>
							</div>
						</div>
					</div>
				</c:forEach>
				
				
				
			</div>	
			<form name="form2">
				<div id="pagination">
					<ul id="pageUL" class="pagingBtn">
					    <c:if test="${pageMaker.prev}">
						    <li class="left">
						        <a class="left"><i class="fa fa-chevron-left"></i></a>
						    </li>
					    </c:if>
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
						    <li class="curPage">
						        <a href='<c:url value="admin/list?page=${pageNum}"/>' class="aPaging">${pageNum}</a>
						    </li>
					    </c:forEach>
					    <c:if test="${pageMaker.next && pageMaker.endPage >0}">
						    <li class="right">
						        <a class="right"><i class="fa fa-chevron-right"></i></a>
						    </li>
					    </c:if>
					</ul>
				</div>
	
			<input id="pageH" type="hidden" name="page" value="${pageMaker.cri.page}">
			<input id="keywordH" type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			<input id="optionH" type="hidden" name="option" value="${pageMaker.cri.option}">
			</form>	
			<script src="/resources/js/paging.js"></script>	
		</div>
		
	</div>
</div>
</body>

<!-- footer -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

</html>
