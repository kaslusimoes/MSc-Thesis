BASEDIR=$(CURDIR)
OUTPUTDIR=$(BASEDIR)/output

pdf: 
	pandoc summary.md chapters/*.md \
	-V fontsize=12pt -V documentclass:tufte-book -V papersize:a4paper \
	--filter pandoc-crossref --number-sections \
	-o $(OUTPUTDIR)/thesis.pdf