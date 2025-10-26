ENGINE = pdflatex
doc ?= template
BUILD_DIR = ./build
MAIN_TEX = ./main.tex
CONTENT_TEX = ./content/
PDF_FILE = $(BUILD_DIR)/$(doc).pdf

.PHONY: all clean build_dir

all: $(PDF_FILE)

build_dir:
	@mkdir -p $(BUILD_DIR)

$(PDF_FILE): $(MAIN_TEX) $(CONTENT_TEX) build_dir
	$(ENGINE) -output-directory=$(BUILD_DIR) -jobname=$(doc) "\def\doc{$(doc)} \input{$(MAIN_TEX)}"

clean: $(BUILD_DIR)
	@rm -rf $(BUILD_DIR)/*
