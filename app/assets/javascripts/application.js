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
//= require reveal
//= require_tree .


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

  initializeReveal();

});

function initializeReveal() {
  // Full list of configuration options available here:
  // https://github.com/hakimel/reveal.js#configuration
  Reveal.initialize({
    maxScale: 10,
    controls: false,
    progress: true,
    history: true,
    backgroundTransition: 'slide',
    transition: 'linear',
    theme: 'solarized', // available themes are in /css/theme

    // Optional libraries used to extend on reveal.js
//    dependencies: [
//      { src: 'lib/js/classList.js', condition: function() { return !document.body.classList; } },
//      { src: 'plugin/markdown/marked.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
//      { src: 'plugin/markdown/markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
//      { src: 'plugin/highlight/highlight.js', async: true, callback: function() { hljs.initHighlightingOnLoad(); } },
//      { src: 'plugin/zoom-js/zoom.js', async: true, condition: function() { return !!document.body.classList; } },
//      { src: 'plugin/notes/notes.js', async: true, condition: function() { return !!document.body.classList; } },
//      { src: 'socket.io/socket.io.js', async: true },
//      { src: 'plugin/notes-server/client.js', async: true }
//    ]
  });
}
