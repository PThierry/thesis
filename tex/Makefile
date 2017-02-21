#
# Makefile for textemplate in /cygdrive/z/Programs/msysgit/msysgit/home/phil/dev/latex_utils/doc
#
# Made by t0090690
# Login   <t0090690@fr.thalesgroup.com>
#
# Started on  Wed Nov 18 14:29:46 2009 t0090690
# Last update Wed Nov 18 14:29:46 2009 t0090690
#


#############################################################################
## basic macros
#############################################################################

LATEX=pdflatex
LATEXOPT=-shell-escape
BIBTEX=bibtex
BIBTEXOPT=-min-crossrefs=0
PDFVIEWER?=okular
MAKEGLOSSARY=makeglossaries
MAKEGLOSSARYOPT=-L french

TEXINPUTS    = $(shell kpsewhich -var-value=TEXINPUTS)
LATEXENV = TEXINPUTS='./styles:./dict:$(TEXINPUTS)'

RM=rm
RMFLAGS=-rf
MAKE=make

#############################################################################
## project's source and generated files
#############################################################################
TARGET	     = these_doctorat
SOURCE	     = document.tex
BOOK         = book.tex
SOURCE_PREFIX= document
OBJS	     = $(SOURCE:.tex=.aux) $(SOURCE:.tex=.log) $(SOURCE:.tex=.out) $(SOURCE:.tex=.toc) \
               $(SOURCE:.tex=.ist) $(SOURCE:.tex=.glo) $(SOURCE:.tex=.idx) $(SOURCE:.tex=.lof) \
               $(SOURCE:.tex=.brf) $(SOURCE:.tex=.bmt) $(SOURCE:.tex=.ind) $(SOURCE:.tex=.ilg) \
	       $(SOURCE:.tex=.lot) $(SOURCE:.tex=.bbl) $(SOURCE:.tex=.blg) $(SOURCE:.tex=.maf) \
	       $(SOURCE:.tex=.glg) $(SOURCE:.tex=.gls) $(SOURCE:.tex=.xdy) $(SOURCE:.tex=.run.xml) \
               $(SOURCE:.tex=-blx.bib) $(BOOK:.tex=.log) $(BOOK:.tex=.out) $(BOOK:.tex=.toc) \
               $(BOOK:.tex=.ist) $(BOOK:.tex=.glo) $(BOOK:.tex=.idx) $(BOOK:.tex=.lof) \
               $(BOOK:.tex=.brf) $(BOOK:.tex=.bmt) $(BOOK:.tex=.ind) $(BOOK:.tex=.ilg) \
	       $(BOOK:.tex=.lot) $(BOOK:.tex=.bbl) $(BOOK:.tex=.blg) $(BOOK:.tex=.maf) \
	       $(BOOK:.tex=.glg) $(BOOK:.tex=.gls) $(BOOK:.tex=.xdy) $(BOOK:.tex=.aux) \
               *.ps *.mlf* *.mlt* *.mtc* document-fig*.tex *.log document-fig*.pdf tmp.inputs document.tex
TODEL	     = tags *~ .*.swp
LANG	     = $(shell cat config/config.tex|grep "newcommand.*lang"|sed -re "s:.*\{([fe][rn])\}.*:\1:")


#############################################################################
## rules
#############################################################################

help :
	@echo "- all 		: this help message"
	@echo "- pdf		: compile the document"
	@echo "- view		: display the compiled document if present"
	@echo "- clean		: cleanup temporary files"
	@echo "- distclean 	: cleanup all files but sources"
	@echo "- install	: install the document"

images:
	if [ ! -d images ]; then mkdir images; fi; for file in *-fig*.ps; do convert -trim +repage $$file images/$${file%%.ps}.png; done


all : help

#makeindex -s $(SOURCE:.tex=.ist) -o $(SOURCE:.tex=.gls) $(SOURCE:.tex=.glo)
compile :
	/bin/bash scripts/generate_toc.sh
	$(LATEXENV) $(LATEX) $(LATEXOPT) $(SOURCE)
	$(MAKEGLOSSARY) $(MAKEGLOSSARYOPT) $(SOURCE_PREFIX)
	$(BIBTEX) $(BIBTEXOPT) $(SOURCE_PREFIX)
	while [ `cat $(SOURCE:.tex=.log) | grep 'may have changed.' | wc -l` -ge 1 ]; do $(LATEXENV) $(LATEX) $(LATEXOPT) $(SOURCE); done
	$(LATEXENV) $(LATEX) $(LATEXOPT) $(SOURCE) # for bibliography backrefs
	mv $(SOURCE:.tex=.pdf) $(TARGET).uncompressed.pdf

book: pdf
	cp $(TARGET).compressed.pdf $(TARGET).pdf
	$(LATEX) book.tex

pdf: prepare_for_publication

prepare_for_publication: compile
	sed -re 's:\(TeX Live 2012/Debian\):TeX Live 2012/Debian:g' -i $(TARGET).uncompressed.pdf
	INFILE=$(TARGET).uncompressed.pdf OUTFILE=$(TARGET).uncompressed.2.pdf ./scripts/del_lastpage.sh
	pdftk $(TARGET).uncompressed.2.pdf output $(TARGET).compressed.pdf compress

testpdf:
	$(LATEXENV) $(LATEX) $(LATEXOPT) $(SOURCE)

clean : 
	$(RM) $(RMFLAGS) $(OBJS) $(TODEL)

distclean : clean
	$(RM) $(RMFLAGS) $(TARGET).compressed.pdf
	$(RM) $(RMFLAGS) $(TARGET).uncompressed.pdf
	$(RM) $(RMFLAGS) $(TARGET).uncompressed.2.pdf

dist : distclean
	$(TAR) $(TARFLAGS) $(DISTTARGET) .

install : $(TARGET)
	@echo you must be root to install

view:
	if [ ! -f $(TARGET).compressed.pdf ]; then make pdf; fi
	$(PDFVIEWER) $(TARGET).compressed.pdf

