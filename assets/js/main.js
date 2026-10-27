// ===========================================
// Aryana Haghjoo — Personal Site
// Cursor, starfield, nav behavior
// ===========================================

(function () {
  "use strict";

  /* ---- Galaxy cursor ---- */
  var cursor = document.getElementById('galaxyCursor');
  var isTouch = window.matchMedia('(max-width: 768px)').matches;

  if (cursor && !isTouch) {
    var mouseX = window.innerWidth / 2;
    var mouseY = window.innerHeight / 2;
    var hovering = false;
    var pending = false;

    // follow the pointer directly; batch to one transform write per frame
    function renderCursor() {
      pending = false;
      cursor.style.transform = 'translate(' + mouseX + 'px, ' + mouseY + 'px) translate(-50%, -50%)' +
        (hovering ? ' scale(1.4)' : '');
    }
    function scheduleRender() {
      if (!pending) {
        pending = true;
        requestAnimationFrame(renderCursor);
      }
    }

    window.addEventListener('mousemove', function (e) {
      mouseX = e.clientX;
      mouseY = e.clientY;
      scheduleRender();
    });
    scheduleRender();

    document.addEventListener('mouseleave', function () {
      cursor.style.opacity = '0';
    });
    document.addEventListener('mouseenter', function () {
      cursor.style.opacity = '1';
    });

    // subtle scale-up on interactive elements
    var interactiveEls = document.querySelectorAll('a, button, .photo-card');
    interactiveEls.forEach(function (el) {
      el.addEventListener('mouseenter', function () {
        hovering = true;
        cursor.classList.add('gc-hover');
        scheduleRender();
      });
      el.addEventListener('mouseleave', function () {
        hovering = false;
        cursor.classList.remove('gc-hover');
        scheduleRender();
      });
    });
  }

  /* ---- Starfield generation ---- */
  var starsLayer = document.getElementById('starsLayer');
  if (starsLayer) {
    var starCount = window.innerWidth < 720 ? 60 : 130;
    var fragment = document.createDocumentFragment();
    for (var i = 0; i < starCount; i++) {
      var star = document.createElement('div');
      star.className = 'star';
      star.style.left = Math.random() * 100 + '%';
      star.style.top = Math.random() * 100 + '%';
      var size = Math.random() * 1.6 + 0.6;
      star.style.width = size + 'px';
      star.style.height = size + 'px';
      star.style.animationDelay = (Math.random() * 4) + 's';
      star.style.animationDuration = (3 + Math.random() * 3) + 's';
      fragment.appendChild(star);
    }
    starsLayer.appendChild(fragment);
  }

  /* ---- Mobile nav toggle ---- */
  var navToggle = document.getElementById('navToggle');
  var navLinks = document.getElementById('navLinks');
  if (navToggle && navLinks) {
    navToggle.addEventListener('click', function () {
      var isOpen = navLinks.classList.toggle('is-open');
      navToggle.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
    });
    navLinks.querySelectorAll('a').forEach(function (link) {
      link.addEventListener('click', function () {
        navLinks.classList.remove('is-open');
        navToggle.setAttribute('aria-expanded', 'false');
      });
    });
  }

})();
