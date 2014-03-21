//= require reveal

initializeReveal();

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
