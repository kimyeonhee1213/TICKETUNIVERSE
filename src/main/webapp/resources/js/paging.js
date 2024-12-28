/**
 * selectbox 선택한 값만 검색
 */

  $('#searchBtn').click(function(){
    
    document.form1.submit();
  });


/**
 * 검색 시 페이징처리 처리
 * 1) 페이지 버튼 클릭 시 pageNum값을 가지고 form태그로 이동하도록 처리
 * 2) 화면에 검색키워드가 미리 남겨지도록 처리.
 */

var pagination = document.querySelector("#pagination");
var pageUL = document.querySelector('#pageUL');
pagination.onclick = function() {
    event.preventDefault();
    if((event.target.className).indexOf("right") != -1){
        document.form2.page.value = Number(document.form2.page.value) +1;
        document.form2.submit();
        return;
    }else if((event.target.className).indexOf("left") != -1){
        document.form2.page.value = Number(document.form2.page.value) -1;
        document.form2.submit();
        return;
    }else if(event.target.tagName == 'A' || event.target.tagName == 'I'){
        document.form2.page.value = event.target.textContent;
        document.form2.submit();
    }
    else return;
}