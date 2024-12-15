/**
 * 
 */
 
var clockTitle1 = document.querySelector(".dDay1");
var clockTitle2 = document.querySelector(".dDay2");
var clockTitle3 = document.querySelector(".dDay3");
var clockTitle4 = document.querySelector(".dDay4");
var clockTitle5 = document.querySelector(".dDay5");

function ticketDateClock() {
  var today = new Date();
  
  /* 1 */
  var t_date1 = document.getElementById('t_date1').innerText;
  var ticketDate1 = new Date(`${t_date1}`);
  var untilticketDate1 = new Date(ticketDate1 - today);
  var day1 = String(Math.floor(untilticketDate1 / (1000 * 3600 * 24)));
  
  /* 2 */
  var t_date2 = document.getElementById('t_date2').innerText;
  var ticketDate2 = new Date(`${t_date2}`);
  var untilticketDate2 = new Date(ticketDate2 - today);
  var day2 = String(Math.floor(untilticketDate2 / (1000 * 3600 * 24)));
  
  /* 3 */
  var t_date3 = document.getElementById('t_date3').innerText;
  var ticketDate3 = new Date(`${t_date3}`);
  var untilticketDate3 = new Date(ticketDate3 - today);
  var day3 = String(Math.floor(untilticketDate3 / (1000 * 3600 * 24)));
  
  /* 4 */
  var t_date4 = document.getElementById('t_date4').innerText;
  var ticketDate4 = new Date(`${t_date4}`);
  var untilticketDate4 = new Date(ticketDate4 - today);
  var day4 = String(Math.floor(untilticketDate4 / (1000 * 3600 * 24)));
  
  /* 5 */
  var t_date5 = document.getElementById('t_date5').innerText;
  var ticketDate5 = new Date(`${t_date5}`);
  var untilticketDate5 = new Date(ticketDate5 - today);
  var day5 = String(Math.floor(untilticketDate5 / (1000 * 3600 * 24)));
  
  clockTitle1.innerText = `D-${day1}`;
  clockTitle2.innerText = `D-${day2}`;
  clockTitle3.innerText = `D-${day3}`;
  clockTitle4.innerText = `D-${day4}`;
  clockTitle5.innerText = `D-${day5}`;
}
setInterval(ticketDateClock, 1000);

