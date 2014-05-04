// articles.js
var articles;
var headlineAndLeadParagraph = {};
var counter = 0;

$( document ).ready( function() {
  getDate();
})

 function getFrontPageArticles(randomDate){
  d = randomDate;
  var results =  $.getJSON("/articles?date="+randomDate, function(response) {
    articles = response;
    $('h2').text("On this date in "+randomDate[0]+randomDate[1]+randomDate[2]+randomDate[3])
    for(var i = 0; i < articles.length; i++) {
      $("<div class='headline' id='"+i+"'>"+articles[i].headline.main+"</div>").appendTo(".article-space");
      // $("<div class='lead_paragraph'>"+articles[i]["lead_paragraph"]+"</div>").appendTo("div#"+i+"");
    }
  })

 }

  function correctDateSyntax(time) {
    if(time < 10) {
      time = '0' + time;
      return time.toString();
    } else {
      return time.toString();
    }
  }

  function getDate() {
    var today = new Date();
    var month = today.getMonth() + 1;
    month = correctDateSyntax(month);
    var date = today.getDate();
    date = correctDateSyntax(date);

    var randomYear = parseInt((Math.random() * (today.getFullYear() - 1850)) + 1850).toString();

    var randomDate = randomYear + month + date;
    getFrontPageArticles(randomDate);
  }



