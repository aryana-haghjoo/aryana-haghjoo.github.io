# Build the CV and publish it to the path the website links to.
#   make        -> compile and copy to ../files/CV_Aryana_Haghjoo.pdf
#   make clean  -> remove build artifacts
SRC     := kyvernitis-resume
BUILD   := build
OUT     := ../files/CV_Aryana_Haghjoo.pdf

.PHONY: all clean

all: $(OUT)

$(OUT): $(SRC).tex kyvernitis-resume.cls fonts/CormorantGaramond-Bold.ttf
	latexmk -xelatex -interaction=nonstopmode -halt-on-error -outdir=$(BUILD) $(SRC).tex
	@pdffonts $(BUILD)/$(SRC).pdf | grep -q CormorantGaramond || \
		{ echo "ERROR: name font (Cormorant Garamond) missing from the PDF; see CV/fonts/" >&2; exit 1; }
	cp $(BUILD)/$(SRC).pdf $(OUT)

clean:
	rm -rf $(BUILD)
