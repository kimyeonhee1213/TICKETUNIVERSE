<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="/resources/css/perform_detail.css" rel="stylesheet"	type="text/css">
<link href="/resources/css/main.css" rel="stylesheet" type="text/css">
<title>공연 상세</title>
<%@ include file="../include/header.jsp"%>
<script>
//heart 좋아요 클릭시! 하트 뿅
$(function(){
    var $likeBtn =$('.icon.heart');

        $likeBtn.click(function(){
        $likeBtn.toggleClass('active');

        if($likeBtn.hasClass('active')){          
           $(this).find('img').attr({
              'src': '/resources/images/red_heart.png',
               alt:'찜하기 완료'
                });
          
          
         }else{
            $(this).find('i').removeClass('fas').addClass('far')
           $(this).find('img').attr({
              'src': '/resources/images/heart.png',
              alt:"찜하기"
           })
         }
     })
})


</script>


</head>
<body>
	<hr>
	<div class="container">
		<div class="row">
			<div class="summary">
				<div class="summaryTop">
					<p class="statusInfo">${data.pf_status}</p>
					<h1>${data.pf_name}</h1>
					<h5>${data.pf_date}</h5>
				</div>
				<hr class="hr-1">
				<div class="summaryBody">
					<div class="posterBox">
						<img class="poster_img" src="${data.thumb}">
					</div>
					<div class="info">
						<dl class="infoItem">
							<dt class="infoLabel">장소</dt>
							<dd class="infoDesc">${data.pf_place}</dd>
						</dl>
						<dl class="infoItem">
							<dt class="infoLabel">공연날짜</dt>
							<dd class="infoDesc">${data.pf_date}</dd>
						</dl>
						<dl class="infoItem">
							<dt class="infoLabel">공연시간</dt>
							<dd class="infoDesc">${data.pf_time}</dd>
						</dl>
						<dl class="infoItem">
							<dt class="infoLabel">가격</dt>
							<dd class="infoDesc">${data.pf_price}</dd>
						</dl>
						<dl class="infoItem">
							<dt class="infoLabel">관람연령</dt>
							<dd class="infoDesc">${data.pf_age}</dd>
						</dl>
						<dl class="infoItem">
							<dt class="infoLabel">출연</dt>
							<dd class="infoDesc">${data.artist_name}</dd>
						</dl>
						<dl class="infoItem">
							<dt class="infoLabel">예매사이트</dt>
							<dd class="infoDesc">${data.ticket_site}</dd>
						</dl>
						<dl class="infoItem">
							<dt class="infoLabel">티켓오픈 날짜</dt>
							<dd class="infoDesc">${data.ticket_date}</dd>
						</dl>
					</div>
					<div class="calendarBox">
			    		<h1 style="text-align: center;" id="calendarHeader"></h1>
						<div id="calendar" class="calendar"></div>
						<script>
							var date = "${data.pf_date}"; 
							
						    // 유효성 검증: 날짜가 올바른 형식인지 확인
						    var isValid = /^\d{4}\.\d{2}\.\d{2}$/.test(date);
						    if (!isValid) {
						      console.error("Invalid date format:", date);
						      date = null; // 잘못된 형식인 경우 처리 중단
						    }
						
						    // 유효한 경우 + 형식으로 변환
						    var markedDate = null;
						    if (date) {
						      var parts = date.split('.'); // "2025.01.02" -> ["2025", "01", "02"]
						      var year = parts[0];
						      var month = parseInt(parts[1], 10); // "01" -> 1
						      var day = parseInt(parts[2], 10);   // "02" -> 2
						      markedDate = year + '+' + month + '+' + day; // "2025+1+2"
						      
						    }
						    
						    function generateCalendar(year, month, markedDate) {
						      var calendar = document.getElementById('calendar');
						      calendar.innerHTML = ''; // 초기화
						
						      // 요일 헤더 생성
						      var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
						      daysOfWeek.forEach(function(day) {
						        var headerCell = document.createElement('div');
						        headerCell.className = 'header';
						        headerCell.textContent = day;
						        calendar.appendChild(headerCell);
						      });
						
						      // 현재 월의 첫 날과 마지막 날 계산
						      var firstDay = new Date(year, month, 1);
						      var lastDay = new Date(year, month + 1, 0);
						      var startDay = firstDay.getDay();
						      var totalDays = lastDay.getDate();
						
						      // 빈 칸 추가 (첫 주의 시작 요일 전까지)
						      for (var i = 0; i < startDay; i++) {
						        var empty = document.createElement('span');
						        empty.textContent = ' ';
						        calendar.appendChild(empty);
						      }
						
						      // 날짜 생성
						      for (var date = 1; date <= totalDays; date++) {
						        var fullDate = year + '+' + (month + 1) + '+' + date;
						        var dayElement = document.createElement('span');
						        dayElement.textContent = date;
						
						        // DB에서 받아온 날짜와 비교하여 강조 표시
						        if (markedDate === fullDate) {
						          dayElement.className = 'marked';
						        }
						
						        calendar.appendChild(dayElement);
						      }
						    }
						
						    // 특정 연도와 월로 달력 생성 (예: 2025년 1월)
						    if (markedDate) {
						    	var parts = markedDate.split('+'); // "2025.01.02" -> ["2025", "01", "02"]
							    var year = parts[0];
							    var month = parseInt(parts[1], 10); // "01" -> 1
							    var calendarHeader = document.getElementById('calendarHeader');
							    calendarHeader.innerText = year + '.' + month;
						      	generateCalendar(year, month - 1, markedDate);
						    } else {
						      console.error("No valid date to mark on the calendar.");
						    }
						</script>
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
		</div>
	</div>
</body>
</html>