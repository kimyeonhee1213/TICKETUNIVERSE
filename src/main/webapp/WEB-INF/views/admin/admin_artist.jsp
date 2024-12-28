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
    <link href="/resources/css/admin.css" rel="stylesheet" type="text/css">
</head>

<body>

<!-- header -->
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<div class="container">
	<br><br><br>
	<div class="row">
		<form name="form1">
			<div class="atSearch">
				<input id="searchh" class="atScInput" type="text" name="keyword" values="${keyword }"placeholder="아티스트를 입력해 주세요">
				<img id="searchBtn" class="atScImg" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
				<input type="hidden" name="page" value="1">
			</div>
		</form>
    
		<!-- 페이징 -->
		<!-- form2에 페이징 버튼 클릭 시 현재 페이지 정보와 검색 상황일 때 페이징 유지를 위한 조건을 담아 보냄 -->
		<div class="mainDiv">
			<div class="artistListDiv">
				<c:forEach var="data" items="${data }" varStatus="status">
					<div class="artistDiv">
						<div class="atDiv_1">
							<a href="#" onclick="location.href='adminArtistUpdatePage.do?artist_order=${data.artist_order}'">
								<img class="atDiv_img" src="${data.thumb}">
							</a>
						</div>
						<div class="atDiv_2">
							<a href="#" class="atDiv_name" onclick="location.href='adminArtistUpdatePage.do?artist_order=${data.artist_order}'">
								${data.artist_name }
							</a>
						</div>
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
						<div class="summaryEnd">
							<div class="right_area">
							  <a href="javascript:;" class="icon heart">
							     <img src="/resources/images/heart.png" alt="찜하기">
							  </a>
							</div>
						</div>
					</div>
				</c:forEach>
				
				<script>
					$(document).ready(function(){
			            var target = $(".dropbtn");
			 
			            // 버튼을 클릭시 드롭다운 열림
			            $(".dropbtn").on("click", function(e) {
							if($(this).next().css("display") == "none"){
								$("[id^='dropdown_']").hide();
								$(this).next().show();
							}else{
								$("[id^='dropdown_']").hide();
							}
						});
			 
			            // 외부를 클릭시 드롭다운 닫힘
			            $(document).mouseup(function (e){
			                if(target.has(e.target).length==0) {
			                	$("[id^='dropdown_']").hide();
			                } 
			            });
			        });
				</script>
				
			</div>	
			<form name="form2">
				<div id="pagination">
					<ul id="pageUL" class="pagingBtn">
					    <c:if test="${pageMaker.prev}">
						    <li class="left">
						        <a class="left" href='<c:url value="admin/list?page=${pageMaker.startPage-1}"/>'><i class="fa fa-chevron-left"></i></a>
						    </li>
					    </c:if>
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
						    <li class="curPage">
						        <a href='<c:url value="admin/list?page=${pageNum}"/>' class="aPaging">${pageNum}</a>
						    </li>
					    </c:forEach>
					    <c:if test="${pageMaker.next && pageMaker.endPage >0}">
						    <li class="right">
						        <a class="right" href='<c:url value="admin/list?page=${pageMaker.endPage+1}"/>'><i class="fa fa-chevron-right"></i></a>
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
