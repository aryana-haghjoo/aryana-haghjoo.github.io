# Notes for Claude

- The CV source lives in `CV/` and the website (`index.html`) repeats much of it (education, research, talks). Any content change to one must be mirrored in the other in the same commit.
- After editing `CV/kyvernitis-resume.tex`, run `make -C CV` to regenerate `files/CV_Aryana_Haghjoo.pdf` and commit the PDF too. Never edit the PDF directly.
- The pre-commit hook in `.githooks/` does this automatically: when the CV source is committed it rebuilds and stages the PDF, and it stamps every PDF link in `index.html` with `?v=<PDF hash>` so browsers can't show a cached old CV. It needs `git config core.hooksPath .githooks` once per clone. Don't hand-edit or remove the `?v=` stamps; `.github/workflows/cv-sync.yml` fails if they don't match the committed PDF.
- When `assets/css/main.css` or `assets/js/main.js` changes, bump the `?v=` date on their links in `index.html` for the same reason.
