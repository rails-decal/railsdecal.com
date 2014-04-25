// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-tablesorter
//= require bootstrap
//= require typed
//= require waypoints

$(document).ready(function() {

  jQuery("a").click(function(event){
    //check if it has a hash (i.e. if it's an anchor link)
    if(this.hash){
      var hash = this.hash.substr(1);
      var $toElement = jQuery("[id="+hash+"]");
      var toPosition = $toElement.position().top;
      //scroll to element
      $("body,html").animate({
        scrollTop : toPosition - 70
      } ,1000)
    }
  });
  //do the same with urls with hash too (so on page load it will slide nicely)
  if (location.hash) {
    var hash = location.hash;
    window.scroll(0,0);
    $("a[href='"+ location.pathname + hash +"']").click();
  }

  $(".header-link").click(function(event) {
    event.preventDefault();

    $("ul.nav li").removeClass("active");
    $(this).parent().addClass("active");
    $('html, body').animate({
      scrollTop: $("#" + $(this).data().element).offset().top - 70
    }, 500);
  });

  $("#typer").typed({
    strings: ["Facebook.", "Twitter.", "Yelp.", "Google.", "great website. We'll teach you how."],
    typeSpeed: 80,
    backDelay: 500
  });

  $("#evaluations").tablesorter({
    sortList: [[2,1], [3,1]]
  });

  $("#schedule").waypoint(function(direction) {
    if (direction == "up") {
      $("ul.nav li").removeClass("active");
      $("ul.nav li.home").addClass("active");
    } else {
      $("ul.nav li").removeClass("active");
      $("ul.nav li.schedule").addClass("active");
    }
  }, {offset: '50%'});

  // This allows the white timeline line to already exist
  // before the fadein of each row
  $("#timeline").css("min-height", function(){
    return $( ".timeline-row" ).size()*100;
  });

  $(".timeline-row").hide();
  $(".timeline-row").waypoint(function(event, direction) {
    $(this).stop().fadeToggle("slow");
  }, {offset:'87%'});

  $(".left-side").waypoint(function(event, direction) {
    $(this).animate({right:'0'}, 700);
  }, {offset:'75%'}, {triggerOnce: true});
  $(".right-side").waypoint(function(event, direction) {
    $(this).animate({left:'0'}, 700);
  }, {offset:'75%'}, {triggerOnce: true});

});
