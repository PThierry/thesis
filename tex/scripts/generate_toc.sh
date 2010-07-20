#!/bin/bash

parts=`find includes/fr -type d -name "part*" -exec basename {} \; | sort`;
cp document.tex.in document.tex

for part in $parts; do
	echo "* adding $part"
	echo "% starting $part" >> document.tex
	echo "\input{includes/fr/$part/title.tex}" >> document.tex
	file_list=`find includes/fr/$part -name "*.tex" | grep -v "title.tex" | sort`
	for file in $file_list; do
                echo "  adding file $file"
		echo "\input{$file}" >> document.tex;
	done
done

echo '
\backmatter

\input{includes/\lang/appendix/title.tex}

\printglossary

% bibliography
\nocite{*}
\bibliography{bibliography}
\bibliographystyle{plain}

\printindex

\end{document}' >> document.tex
