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
LATEXOPT=
RM=rm
RMFLAGS=-rf

#############################################################################
## project's source and generated files
#############################################################################
TARGET	     = these_doctorat.pdf
SOURCE	     = document.tex
OBJS	     = $(SOURCE:.tex=.aux) $(SOURCE:.tex=.log) $(SOURCE:.tex=.out) $(SOURCE:.tex=.toc) $(SOURCE:.tex=.ist) $(SOURCE:.tex=.glo) $(SOURCE:.tex=.idx) $(SOURCE:.tex=.lof)
TODEL	     = tags *~ .*.swp

#############################################################################
## rules
#############################################################################

all :
	$(LATEX) $(LATEXOPT) $(SOURCE)
	$(LATEX) $(LATEXOPT) $(SOURCE)
	$(LATEX) $(LATEXOPT) $(SOURCE)
	mv $(SOURCE:.tex=.pdf) $(TARGET)

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
	okular $(TARGET)

