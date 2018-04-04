.PHONY: help pdf tex

BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/chapters
OUTPUTDIR=$(BASEDIR)/output

help:
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make pdf                         generate a PDF file                '
	@echo '   make tex                         generate a Latex file              '
	@echo '                                                                       '
	@echo 'get local templates with: pandoc -D latex/html/etc                     '
	@echo 'or generic ones from: https://github.com/jgm/pandoc-templates          '

pdf:
	pandoc --verbose --toc \
	metadata.yaml "$(INPUTDIR)"/*.md \
	-V fontsize=12pt -V papersize:a4paper \
	-V documentclass=report \
	--filter pandoc-crossref \
	--number-sections \
	-o $(OUTPUTDIR)/thesis.pdf

tex:
	pandoc --verbose --toc --wrap=none \
	metadata.yaml "$(INPUTDIR)"/*.md \
	-V fontsize=12pt -V papersize:a4paper \
	-V documentclass=report \
	--filter pandoc-crossref \
	--number-sections \
	-s -o $(OUTPUTDIR)/thesis.tex