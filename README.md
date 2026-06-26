# aryana-haghjoo.github.io

Personal site — astrophysics research + photography.

## What's inside

- `index.html` — single-page site (About / Research / Photography / Contact)
- `assets/css/main.css` — all styling (dark cosmology theme, instax-style photo cards)
- `assets/js/main.js` — galaxy cursor, starfield generation, mobile nav
- `assets/img/` — your headshot, photography, and the Vera Rubin Observatory deep field background
- `files/CV_Aryana_Haghjoo.pdf` — linked from the About section

No build step, no dependencies — just static HTML/CSS/JS. Works directly on GitHub Pages.

## To swap in new photos later

Replace any file in `assets/img/photography/`, keeping the same filename, or add a new `<figure class="photo-card">` block in `index.html` following the existing pattern — each one just needs an `<img>` and a `<figcaption><span class="photo-loc">Location</span></figcaption>`.

## Credits

Background deep-field image: Vera C. Rubin Observatory (NOIRLab/NSF/AURA), used for educational/non-commercial purposes with credit in the site footer.
