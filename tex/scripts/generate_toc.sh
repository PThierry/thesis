#!/bin/bash

parts=`find includes/en -type d -name "part*" -exec basename {} \; | sort`;
cp document.tex.in document.tex

for part in $parts; do
	echo "* adding $part"
	echo "% starting $part" >> document.tex
	echo "\input{includes/en/$part/title.tex}" >> document.tex
	file_list=`find includes/en/$part -name "*.tex" | grep -v "title.tex" | sort`
	for file in $file_list; do
                echo "  adding file $file"
		echo "\input{$file}" >> document.tex;
	done
done

echo '

%\input{includes/\lang/appendix/title.tex}

\part{Appendices}
\begin{appendices}
' >> document.tex

appendices=`find includes/en -type d -name "appendix*" -exec basename {} \;`;

for appendix in $appendices; do
	echo "* adding $appendix"
	echo "% starting $appendix" >> document.tex
	#echo "\input{includes/en/$appendix/title.tex}" >> document.tex
	file_list=`find includes/en/$appendix -name "*.tex"`
	for file in $file_list; do
                echo "  adding file $file"
		echo "\input{$file}" >> document.tex;
	done
done

echo '
\end{appendices}
\backmatter

\printglossary

% bibliography
\nocite{*}
\bibliography{bibliography}
\bibliographystyle{plain}

\printindex

\end{document}' >> document.tex
