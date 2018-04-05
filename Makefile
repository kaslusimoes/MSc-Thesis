.PHONY: help clean cleanall pdf tex tex2pdf

PDFLATEX=xelatex

BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/source
OUTPUTDIR=$(BASEDIR)/output
STYLEDIR=$(BASEDIR)/style

help:
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make pdf                         generate a PDF file                '
	@echo '   make tex                         generate a Latex file              '
	@echo '                                                                       '
	@echo 'get local templates with: pandoc -D latex/html/etc                     '
	@echo 'or generic ones from: https://github.com/jgm/pandoc-templates          '

clean:
	rm "$(OUTPUTDIR)"/thesis.{aux,log,out,toc,lof}

cleanall:
	rm "$(OUTPUTDIR)"/thesis.{aux,log,out,toc,lof,tex,pdf}

pdf:
	pandoc --verbose \
	--include-in-header="$(STYLEDIR)"/preamble.tex \
	metadata.yaml "$(INPUTDIR)"/*.md \
	--template="$(STYLEDIR)/template.tex" \
	-V fontsize=12pt \
	-V papersize:a4 \
	-V documentclass=report \
	--filter pandoc-crossref \
	--filter pandoc-citeproc \
	--pdf-engine="$(PDFLATEX)" \
	-o $(OUTPUTDIR)/thesis.pdf

tex:
	pandoc --verbose --wrap=none \
	--include-in-header="$(STYLEDIR)"/preamble.tex \
	metadata.yaml "$(INPUTDIR)"/*.md \
	--template="$(STYLEDIR)/template.tex" \
	-V fontsize=12pt \
	-V papersize:a4 \
	-V documentclass=report \
	--filter pandoc-crossref \
	--filter pandoc-citeproc \
	-s -o $(OUTPUTDIR)/thesis.tex

tex2pdf:
	"$(PDFLATEX)" -output-directory="$(OUTPUTDIR)" thesis.tex
	"$(PDFLATEX)" -output-directory="$(OUTPUTDIR)" thesis.tex
	rm "$(OUTPUTDIR)"/thesis.{aux,log,out,toc,lof}
