// articles.js
var articles;
var headlineAndLeadParagraph = {};
var counter = 0;

console.log("hey");
$( document ).ready( function() {
  getDate();
})



 function getFrontPageArticles(randomDate){

   console.log(randomDate);
  var results =  $.getJSON("/articles?date="+randomDate, function(response) {
    articles = response;
      $("<div class='article'><div class='article_space'><div class='headline'>"+articles[counter]["headline"]["main"]+"</div></div>").appendTo("body");

      $("<div class='lead_paragraph'>"+articles[counter]["lead_paragraph"]+"</div>").appendTo("div.article_space");
      $("<button id='next'>Next</button>").appendTo("body");
      $("button#next").on("click", function() {
        $("div.headline").empty();
        $("div.lead_paragraph").empty();
        counter++;
      })
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



