# aryana-haghjoo.github.io

Personal site — astrophysics research + photography.

## What's inside

- `index.html` — single-page site (About / Research / Photography / Contact)
- `assets/css/main.css` — all styling (dark cosmology theme, instax-style photo cards)
- `assets/js/main.js` — galaxy cursor, starfield generation, mobile nav
- `assets/img/` — your headshot, photography, and the Vera Rubin Observatory deep field background
- `files/CV_Aryana_Haghjoo.pdf` — linked from the About and CV sections (built from `CV/`, don't edit by hand)
- `CV/` — LaTeX source of the CV (`kyvernitis-resume.tex` + class file)

No build step for the site — just static HTML/CSS/JS. Works directly on GitHub Pages.

## Updating the CV

The CV and the site share content (education, research, talks), so change both in the same commit:

1. Edit `CV/kyvernitis-resume.tex` and the matching section of `index.html`.
2. `make -C CV` — compiles with XeLaTeX (needs the `plex` and `fontawesome5` packages) and copies the PDF to `files/CV_Aryana_Haghjoo.pdf`.
3. Commit the `.tex`, `index.html` and the regenerated PDF together.

## To swap in new photos later

Replace any file in `assets/img/photography/`, keeping the same filename, or add a new `<figure class="photo-card">` block in `index.html` following the existing pattern — each one just needs an `<img>` and a `<figcaption><span class="photo-loc">Location</span></figcaption>`.

## Credits

Background deep-field image: Vera C. Rubin Observatory (NOIRLab/NSF/AURA), used for educational/non-commercial purposes with credit in the site footer.
