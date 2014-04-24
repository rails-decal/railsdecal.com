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

  $(".header-link").click(function(event) {
    event.preventDefault();

    $("ul#header-links li").removeClass("active");
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

  $(".time-element").hide();
  $(".time-element").waypoint(function(event, direction) {
    $(this).stop().fadeToggle("slow");
  }, {offset:'87%'});

  $("#evaluations").tablesorter({
    sortList: [[2,1], [3,1]]
  });
});
