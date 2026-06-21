# aryana-haghjoo.github.io

Personal site — astrophysics research + photography.

## What's inside

- `index.html` — single-page site (About / Research / Photography / Contact)
- `assets/css/main.css` — all styling (dark cosmology theme, instax-style photo cards)
- `assets/js/main.js` — galaxy cursor, starfield generation, mobile nav
- `assets/img/` — your headshot, photography, and the Vera Rubin Observatory deep field background
- `files/CV_Aryana_Haghjoo.pdf` — linked from the About section

No build step, no dependencies — just static HTML/CSS/JS. Works directly on GitHub Pages.

## How to publish this on GitHub Pages

1. Go to your repo `aryana-haghjoo.github.io` (the same one you just unpublished).
2. Delete the old files in it, OR just push these new files on top — either way, the new `index.html` and `assets/` will replace the old site.
3. Upload all the files in this folder (keeping the folder structure intact) to the root of that repo. Easiest way:
   - On github.com, open the repo → **Add file → Upload files** → drag the whole contents of this folder in (including the `assets` and `files` subfolders).
   - Or, if you use git locally: `git add . && git commit -m "New site" && git push`.
4. Go to **Settings → Pages** in that repo and make sure the source is set to deploy from the branch you pushed to (e.g. `main`, root folder `/`). If it's set to "GitHub Actions" with no workflow file, switch the source dropdown to **"Deploy from a branch"** instead, since this site has no build step.
5. Click **Visit site** once it finishes deploying (usually under a minute) — back at `https://aryana-haghjoo.github.io`.

## To swap in new photos later

Replace any file in `assets/img/photography/`, keeping the same filename, or add a new `<figure class="photo-card">` block in `index.html` following the existing pattern — each one just needs an `<img>` and a `<figcaption><span class="photo-loc">Location</span></figcaption>`.

## Credits

Background deep-field image: Vera C. Rubin Observatory (NOIRLab/NSF/AURA), used for educational/non-commercial purposes with credit in the site footer.
