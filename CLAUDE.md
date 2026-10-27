# Notes for Claude

- The CV source lives in `CV/` and the website (`index.html`) repeats much of it (education, research, talks). Any content change to one must be mirrored in the other in the same commit.
- After editing `CV/kyvernitis-resume.tex`, run `make -C CV` to regenerate `files/CV_Aryana_Haghjoo.pdf` and commit the PDF too. Never edit the PDF directly.
