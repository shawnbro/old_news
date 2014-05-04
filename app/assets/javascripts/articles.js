// articles.js
var articles;
var headlineAndLeadParagraph = {};
var counter = 0;

$( document ).ready( function() {
  //this generates a random date then adds the articles
  getDate();
  //load new date/article button
  $('h2#button').click(function() {
    getDate();
  })
})

 function getFrontPageArticles(randomDate){
  $('.article-space').empty();
  d = randomDate;
  var results =  $.getJSON("/articles?date="+randomDate, function(response) {
    articles = response;
    $('h2').text("On this date in "+randomDate[0]+randomDate[1]+randomDate[2]+randomDate[3])
    for(var i = 0; i < articles.length; i++) {
      if(articles[i].lead_paragraph !== null) {
        $("<div class='headline' id='"+i+"'><a href='"+articles[i].web_url+"'>"+articles[i].headline.main+"</div>").appendTo(".article-space");
        $("div#"+i).mouseenter(function(e) {
          article = e.target
          $(article).text(articles[article.id].lead_paragraph);
        })
        $("div#"+i).mouseleave(function(e) {
          article = e.target
          $(article).text(articles[article.id].headline.main)
        })
      }
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



