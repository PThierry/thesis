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
RM=rm
RMFLAGS=-rf
MAKE=make

#############################################################################
## project's source and generated files
#############################################################################
TARGET	     = these_doctorat
SOURCE	     = document.tex
OBJS	     = $(SOURCE:.tex=.aux) $(SOURCE:.tex=.log) $(SOURCE:.tex=.out) $(SOURCE:.tex=.toc) \
               $(SOURCE:.tex=.ist) $(SOURCE:.tex=.glo) $(SOURCE:.tex=.idx) $(SOURCE:.tex=.lof) \
               $(SOURCE:.tex=.brf) $(SOURCE:.tex=.bmt) $(SOURCE:.tex=.ind) $(SOURCE:.tex=.ilg) \
	       $(SOURCE:.tex=.lot) *.ps *.mlf* *.mlt* *.mtc* document-fig*.tex *.log document-fig*.pdf tmp.inputs
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



all : help

pdf :
	$(LATEX) $(LATEXOPT) $(LATEXOPT) $(SOURCE)
	makeindex $(SOURCE:.tex=.idx)
	makeindex -s $(SOURCE:.tex=.ist) -o $(SOURCE:.tex=.gls) $(SOURCE:.tex=.glo)
	$(LATEX) $(LATEXOPT) $(LATEXOPT) $(SOURCE)
	$(LATEX) $(LATEXOPT) $(LATEXOPT) $(SOURCE)
	mv $(SOURCE:.tex=.pdf) $(TARGET)_$(LANG).pdf

clean : 
	$(RM) $(RMFLAGS) $(OBJS) $(TODEL)

distclean : clean
	$(RM) $(RMFLAGS) $(TARGET)

dist : distclean
	$(TAR) $(TARFLAGS) $(DISTTARGET) .

install : $(TARGET)
	@echo you must be root to install

view:
	if [ ! -f $(TARGET) ]; then make all; fi
	acroread $(TARGET)_$(LANG).pdf

