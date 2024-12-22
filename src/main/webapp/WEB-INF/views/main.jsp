<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page session="false"%>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TICKETUNIVERSE</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="/resources/css/main.css" rel="stylesheet" type="text/css">
</head>

<body>

<!-- header -->
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<div class="container">
	<br><br><br>
	<div class="row">
		<p class="main_font1">WHAT'S HOT</p><br><br><br><br>
		<c:forEach var="list1" items="${list }" varStatus="status">
			<c:if test="${list1.pf_order eq 1 }">
				<div class="main_div1">
					<a href="${path}/perform/detail?pf_order=${list1.pf_order}"><img class="div1_img" src="${list1.thumb}"></a>
					<p class="list1_p1">${list1.pf_name }</p>
					<p class="list1_p2">${list1.pf_date }</p>
				</div>
			</c:if>
		</c:forEach>
		<div class="main_div2">
			<div class="main_div2_1">
				<c:forEach var="list2" items="${list }" varStatus="status">
					<c:if test="${list2.pf_order eq 2 }">
						<a href="${path}/perform/detail?pf_order=${list2.pf_order}"><img class="div2_1_img" src="${list2.thumb}"></a>
					</c:if>
					<c:if test="${list2.pf_order eq 3 }">
						<a href="${path}/perform/detail?pf_order=${list2.pf_order}"><img class="div2_1_img" src="${list2.thumb}"></a>
					</c:if>
					<c:if test="${list2.pf_order eq 4 }">
						<a href="${path}/perform/detail?pf_order=${list2.pf_order}"><img class="div2_1_img" src="${list2.thumb}"></a>
					</c:if>
				</c:forEach>
			</div>
			<div class="main_div2_2">
				<c:forEach var="list3" items="${list }" varStatus="status">
					<c:if test="${list3.pf_order eq 5 }">
						<a href="${path}/perform/detail?pf_order=${list3.pf_order}"><img class="div2_1_img" src="${list3.thumb}"></a>
					</c:if>
					<c:if test="${list3.pf_order eq 6 }">
						<a href="${path}/perform/detail?pf_order=${list3.pf_order}"><img class="div2_1_img" src="${list3.thumb}"></a>
					</c:if>
					<c:if test="${list3.pf_order eq 7 }">
						<a href="${path}/perform/detail?pf_order=${list3.pf_order}"><img class="div2_1_img" src="${list3.thumb}"></a>
					</c:if>
				</c:forEach>
			</div>
		</div>
		
		<p class="main_font2">TICKET OPEN</p>
		<div class="main_div3">
			<c:forEach var="list4" items="${list2 }" varStatus="status">
				<c:if test="${list4.pf_status eq '0' }">
					<c:if test="${status.count eq '1' }">
						<div class="main_div3_1" style="margin-left:65px;">
							<a href="${path}/perform/detail?pf_order=${list4.pf_order}"><img class="div3_1_img" src="${list4.thumb}"></a>
							<p class="div3_font_1">${list4.ticket_date }</p>
							<p id="t_date1" style="display:none;">${list4.t_date }</p>
							<a href="${path}/perform/detail?pf_order=${list4.pf_order}" class="div3_font_2">${list4.name }</a>
							<div><span class="dDay1"></span></div>
						</div>
					</c:if>
					<c:if test="${status.count eq '2' }">
						<div class="main_div3_1">
							<a href="${path}/perform/detail?pf_order=${list4.pf_order}"><img class="div3_1_img" src="${list4.thumb}"></a>
							<p class="div3_font_1">${list4.ticket_date }</p>
							<p id="t_date2" style="display:none;">${list4.t_date }</p>
							<a href="${path}/perform/detail?pf_order=${list4.pf_order}" class="div3_font_2">${list4.name }</a>
							<div><span class="dDay2"></span></div>
						</div>
					</c:if>
					<c:if test="${status.count eq '3' }">
						<div class="main_div3_1">
							<a href="${path}/perform/detail?pf_order=${list4.pf_order}"><img class="div3_1_img" src="${list4.thumb}"></a>
							<p class="div3_font_1">${list4.ticket_date }</p>
							<p id="t_date3" style="display:none;">${list4.t_date }</p>
							<a href="${path}/perform/detail?pf_order=${list4.pf_order}" class="div3_font_2">${list4.name }</a>
							<div><span class="dDay3"></span></div>
						</div>
					</c:if>
					<c:if test="${status.count eq '4' }">
						<div class="main_div3_1">
							<a href="${path}/perform/detail?pf_order=${list4.pf_order}"><img class="div3_1_img" src="${list4.thumb}"></a>
							<p class="div3_font_1">${list4.ticket_date }</p>
							<p id="t_date4" style="display:none;">${list4.t_date }</p>
							<a href="${path}/perform/detail?pf_order=${list4.pf_order}" class="div3_font_2">${list4.name }</a>
							<div><span class="dDay4"></span></div>
						</div>
					</c:if>
					<c:if test="${status.count eq '5' }">
						<div class="main_div3_1">
							<a href="${path}/perform/detail?pf_order=${list4.pf_order}"><img class="div3_1_img" src="${list4.thumb}"></a>
							<p class="div3_font_1">${list4.ticket_date }</p>
							<p id="t_date5" style="display:none;">${list4.t_date }</p>
							<a href="${path}/perform/detail?pf_order=${list4.pf_order}" class="div3_font_2">${list4.name }</a>
							<div><span class="dDay5"></span></div>
						</div>
					</c:if>
				</c:if>
			</c:forEach>
		</div>
		
		<script src="/resources/js/main.js"></script>
		
		<div class="btnDiv">
			<button type="button" class="tkBtn">티켓오픈 더보기 +</button>
		</div>
		
	 </div>
</div>
</body>

<!-- footer -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

</html>
