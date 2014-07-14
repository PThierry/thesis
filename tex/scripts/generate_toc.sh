#!/bin/bash

LANG=fr

parts=`find includes -maxdepth 1 -type d -name "part*" -exec basename {} \; | sort`;
cp document.tex.in document.tex

for part in $parts; do
	echo "* adding $part"
	echo "% starting $part" >> document.tex
        echo "\cleardoublepage" >> document.tex
	echo "\input{includes/$part/title.tex}" >> document.tex
	file_list=`find includes/$part -name "*.tex" | grep -v "title.tex" | sort`
	for file in $file_list; do
                echo "  adding file $file"
		echo "\input{$file}" >> document.tex;
	done
done

#echo '
#\backmatter
#
#%\input{includes/\lang/appendix/title.tex}
#
#\part{Appendices}
#\begin{appendices}
#' >> document.tex

#appendices=`find includes -type d -name "appendix*" -exec basename {} \;`;

#for appendix in $appendices; do
#	echo "* adding $appendix"
#	echo "% starting $appendix" >> document.tex
#	file_list=`find includes/$appendix -name "*.tex"`
#	for file in $file_list; do
#                echo "  adding file $file"
#		echo "\input{$file}" >> document.tex;
#	done
#done

echo '
% clearing all page headers/footers
\renewcommand{\headrulewidth}{0pt}			% disactive header bar
\fancyhead{}
%\fancyfoot{}

\backmatter

\bookmarksetup{startatroot}
\input{includes/conclusion.tex}
%\backmatter
' >> document.tex

echo '
%\end{appendices}

\newpage
\hbox{}
\cleardoublepage

\glossarystyle{altlisthypergroup}
\glsaddall
\printglossaries

% bibliography
\addcontentsline{toc}{chapter}{Bibliographie}
\printbibliography[title=Bibliographie,keyword=notown]
\newpage


\thispagestyle{empty}
\cleardoublepage
\hbox{}
\cleardoublepage
\hbox{}
\newpage
%\ifodd\value{page}\hbox{}\newpage\fi
%\ifodd\value{page}\hbox{}\newpage\fi

%\begingroup
%\let\cleardoublepage\hbox{}
%\let\clearpage\hbox{}
\input{includes/endpage.tex}
%\endgroup
%\includepdf{includes/endpage.pdf}
\end{document}' >> document.tex
