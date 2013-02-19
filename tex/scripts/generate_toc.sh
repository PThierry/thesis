#!/bin/bash

LANG=fr

parts=`find includes -maxdepth 1 -type d -name "part*" -exec basename {} \; | sort`;
cp document.tex.in document.tex

for part in $parts; do
	echo "* adding $part"
	echo "% starting $part" >> document.tex
	echo "\input{includes/$part/title.tex}" >> document.tex
	file_list=`find includes/$part -name "*.tex" | grep -v "title.tex" | sort`
	for file in $file_list; do
                echo "  adding file $file"
		echo "\input{$file}" >> document.tex;
	done
done

echo '
\backmatter

%\input{includes/\lang/appendix/title.tex}

\part{Appendices}
\begin{appendices}
' >> document.tex

appendices=`find includes -type d -name "appendix*" -exec basename {} \;`;

for appendix in $appendices; do
	echo "* adding $appendix"
	echo "% starting $appendix" >> document.tex
	file_list=`find includes/$appendix -name "*.tex"`
	for file in $file_list; do
                echo "  adding file $file"
		echo "\input{$file}" >> document.tex;
	done
done

echo '
\end{appendices}
\backmatter

%\printglossary

% bibliography
\nocite{*}
\bibliography{bibliography}
\bibliographystyle{plain}

\printindex

\end{document}' >> document.tex
