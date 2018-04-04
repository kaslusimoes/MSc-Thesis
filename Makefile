.PHONY: help pdf tex

BASEDIR=$(CURDIR)
OUTPUTDIR=$(BASEDIR)/output

help:
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make pdf                         generate a PDF file                '
	@echo '   make tex                         generate a Latex file              '
	@echo '                                                                       '
	@echo 'get local templates with: pandoc -D latex/html/etc                     '
	@echo 'or generic ones from: https://github.com/jgm/pandoc-templates          '

pdf: ./chapters/*.md
	pandoc --verbose --toc summary.md chapters/*.md \
	-V fontsize=12pt -V documentclass:tufte-book -V papersize:a4paper \
	--filter pandoc-crossref --number-sections \
	-o $(OUTPUTDIR)/thesis.pdf


tex: ./chapters/*.md
	pandoc --verbose --toc --wrap=none \
	summary.md chapters/*.md \
	-V fontsize=12pt -V documentclass:tufte-book -V papersize:a4paper \
	--filter pandoc-crossref --number-sections \
	-s -o $(OUTPUTDIR)/thesis.tex