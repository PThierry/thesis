\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Packages/myPhDStyle}[2011/12/23 My Class]

%% Book options
\DeclareOption{10pt}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{a4paper}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{a5paper}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{b5paper}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{letterpaper}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{legalpaper}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{executivepaper}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{landscape}{\PassOptionsToClass{\CurrentOption}{book}}

\DeclareOption{10pt}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{oneside}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{twoside}{\PassOptionsToClass{\CurrentOption}{book}}

\newif\if@final
\@finaltrue
\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{book}\@finalfalse}
\DeclareOption{final}{\PassOptionsToClass{\CurrentOption}{book}\@finaltrue}

%\DeclareOption{titlepage}{\PassOptionsToClass{\CurrentOption}{book}}
%\DeclareOption{notitlepage}{\PassOptionsToClass{\CurrentOption}{book}}

\DeclareOption{openright}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{openany}{\PassOptionsToClass{\CurrentOption}{book}}

\DeclareOption{onecolumn}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{twocolumn}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{leqno}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{fleqn}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{openbib}{\PassOptionsToClass{\CurrentOption}{book}}


%% Custom package options
\newcommand\myLanguages{frenchb,english}
\def\myLanguage{english}
\DeclareOption{french}{\def\myLanguage{frenchb}}

\newif\if@chapterRectangle
\@chapterRectangletrue
\DeclareOption{chapterRectangle}{\@chapterRectangletrue}
\DeclareOption{nochapterRectangle}{\@chapterRectanglefalse}

\newif\if@maxime
\@maximetrue
\DeclareOption{maxime}{\@maximetrue}
\DeclareOption{nomaxime}{\@maximefalse}

\newif\if@glossaries
\@glossariestrue
\DeclareOption{glossaries}{\@glossariestrue}
\DeclareOption{noglossaries}{\@glossariesfalse}

\newif\if@phdtitlepage
\@phdtitlepagetrue
\DeclareOption{phdtitlepage}{\@phdtitlepagetrue}
\DeclareOption{nophdtitlepage}{\@phdtitlepagefalse}

\newif\if@biblatex
\@biblatextrue
\DeclareOption{biblatex}{\@biblatextrue}
\DeclareOption{nobiblatex}{\@biblatexfalse}

\newif\if@debug
\@debugtrue
\DeclareOption{debug}{\@debugtrue}
\DeclareOption{nodebug}{\@debugfalse}

%% Fallback
\DeclareOption*{
	\ClassWarning{myThesisStyle}{Unknown option '\CurrentOption'}
}

%% Execute default options
\ExecuteOptions{a4paper,12pt,twoside,onecolumn,final,openright,chapterRectangle,nomaxime,noglossaries,nophdtitlepage,debug,nobiblatex}

%% Process given options
\ProcessOptions\relax

%% Load base
\LoadClass{book}

%% Load additional packages and commands.
%\RequirePackage{mathptmx} % rm & math
%\RequirePackage[scaled=0.90]{helvet} % ss
%\RequirePackage{courier} % tt
%\normalfont
%\RequirePackage[T1]{fontenc}

\RequirePackage[latin1]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\rmfamily % manquant ?
\DeclareFontShape{T1}{lmr}{bx}{sc}{<-> ssub * cmr/bx/sc}{}
\DeclareFontShape{T1}{lmr}{b}{sc}{<-> ssub * cmr/b/sc}{}

\RequirePackage[\myLanguages,\myLanguage]{babel}

\RequirePackage[left=3.3cm,right=3.3cm,top=1.5cm,bottom=2cm,twoside,includefoot,includehead,headheight=1.5cm]{geometry} % outer=1cm, inner=2.1cm
\renewcommand{\baselinestretch}{1.07}
\RequirePackage{multirow} %% Use multirow in tables
\RequirePackage{ifpdf} %% To test if we compile with PDFLatex (ifpdf) or with LaTeX (else)
\RequirePackage{xifthen} %% provides \isempty test

\newcommand{\parend}{\vspace{\baselineskip}} %% End a paragraph with a larger space without creating badbox
\newcommand{\parendsmall}{\vspace{0.25\baselineskip}} %% End a paragraph with a larger space without creating badbox
%\newcommand{\textquote}[1]{``#1''} %% Quote a text : \textquote{mytext}

\RequirePackage{csquotes} %% Quote a text : \textquote{mytext}
\newcommand{\textquoteMy}[1]{``#1''} %% Quote a text : \textquoteMy{mytext} in maximes ??!

%% Additional TeX/LaTeX code...

\if@phdtitlepage
	\RequirePackage{Packages/myPhDTitlePage}
\fi

\if@final
%	\RequirePackage{lmodern}% http://ctan.org/pkg/lm Delete warning about font size
	\RequirePackage{aecompl} %% Better PDF/font rendering
	\pdfminorversion=5
	\pdfcompresslevel=9
	\pdfobjcompresslevel=3	
%	\pdfcompresslevel=0
%	\pdfobjcompresslevel=0
\else
	\@chapterRectanglefalse
	\pdfminorversion=5
	\pdfcompresslevel=0
	\pdfobjcompresslevel=0
\fi

\if@debug
	\newcommand{\debug}[1]{{\colorbox{yellow!50}{\Large \color{red}DEBUG #1}}} %% Show debug command
	%Show badness for vbox and hbox starting from value :
	\hbadness=1000
	\vbadness=1000
\else
	\newcommand{\debug}[1]{} %% Hide debug command
	%Show badness for vbox and hbox starting from value :
	\hbadness=7000
	\vbadness=7000
\fi


%%% Chapter Title Style %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%\renewcommand\chapter{
%	\@ifstar{Coucou}{\if@openright\cleardoublepage\else\clearpage\fi}%
%	\thispagestyle{plain}%
%	\global\@topnum\z@%
%	\@afterindentfalse%
%	\secdef\@chapter\@schapter%
%}
\newcommand\myChapter[1]{
	\clearpage
	\thispagestyle{plain}%
    \global\@topnum\z@
    \@afterindentfalse
    \if@twocolumn
		\@topnewpage[\@makeschapterhead{#1}]%
	\else
		\@makeschapterhead{#1}%
		\@afterheading
	\fi
}

\def\@makechapterhead#1{%
%  \vspace*{10\p@}%
	{%
		\parindent \z@ \raggedright \normalfont
		\begin{flushright}
			\ifnum \c@secnumdepth >\m@ne
				\if@mainmatter
					%\huge\bfseries 
					{\Large \scshape \@chapapp\space \thechapter}
					\par\nobreak
					%\vskip 0\p@
				\fi
			\fi
			\interlinepenalty\@M
			\Huge \bfseries #1\par\nobreak
			\hrulefill
		\end{flushright}
		\vskip 20\p@
	}%
}

\def\@makeschapterhead#1{%
%	\vspace*{10\p@}%
 	{%
		\parindent \z@ \raggedright
		\normalfont
		\interlinepenalty\@M
		\begin{flushright}
			\Huge \bfseries  #1\par\nobreak
		\end{flushright}
		\vskip 20\p@
	}%
}

%%% Part Style (empty to avoid chapterRectangle) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\renewcommand\part{%
	\if@openright
		\cleardoublepage
	\else
		\clearpage
	\fi
	\thispagestyle{empty}%
	\if@twocolumn
		\onecolumn
		\@tempswatrue
	\else
		\@tempswafalse
	\fi
	\null\vfil
	\secdef\@part\@spart
}

%%% Hyperref et Images %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Load Hyperref before xcolor
%% Load images and Hyperref in function of compiler : PDFLatex (ifpdf) or LaTeX (else)
\ifpdf
	\RequirePackage[table,usenames,dvipsnames]{xcolor} %% To have more colors and colors in cells in tables
	\RequirePackage{graphicx}
	\DeclareGraphicsExtensions{.jpg,.png}
	\RequirePackage[hyperindex=true]{hyperref}
	\RequirePackage{epstopdf}
	\RequirePackage{pdfpages}
	\RequirePackage{microtype} % Try to delete h/vbox Underfull/Overfull  
\else
	\RequirePackage[table,usenames,dvipsnames,dvipdfmx]{xcolor} %% To have more colors and colors in cells in tables
	\RequirePackage[dvipdfmx]{graphicx}
	\DeclareGraphicsExtensions{.ps,.eps}
	\RequirePackage[dvipdfmx,hyperindex=true]{hyperref} 
	%\RequirePackage[dvips,hyperindex=true]{hyperref}
\fi

\hypersetup{
	bookmarksopen=true,
	pdfmenubar=true, %menubar shown
	pdfhighlight=/O, %effect of clicking on a link
	colorlinks=true, %couleurs sur les liens hypertextes
	pdfpagemode=UseOutlines, %aucun mode de page UseNone, FullScreen, UseOutlines ...
	pdfpagelayout=TwoPageRight, %ouverture en simple page - SinglePage, TwoPageLeft, TwoPageRight
	%pdfcreator = Test,
	pdffitwindow=true, %pages ouvertes entierement dans toute la fenetre
}
\RequirePackage{epsfig}
\RequirePackage{wrapfig}
\RequirePackage{subfig}
%\renewcommand{\l@subfigure}{\@dottedxxxline{\ext@subfigure}{2}{3.8em}{3.2em}}
\renewcommand{\l@subfigure}{\l@subsection}
\renewcommand{\p@subfigure}{}
\renewcommand{\thesubfigure}{\thefigure.\arabic{subfigure}}
\captionsetup[subfigure]{labelformat=simple,labelsep=colon,listofformat=subsimple}
\captionsetup{
	justification=centering,
	%position=above,
	%skip=\onelineskip,
	%width=\linewidth,
	%labelfont={small},
	%font={small}
}
\captionsetup{lofdepth=2}

%%% Header and Footer %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\RequirePackage{fancyhdr}
\renewcommand{\headrulewidth}{1.0pt}

\pagestyle{fancy}
\fancyhf{} % clear all header and footer fields
\fancyhead[LE,RO]{\bfseries\thepage}    % Page number (boldface) in left on even
\fancyhead[RE]{\bfseries\nouppercase{\leftmark}}      % Chapter in the right on even pages
\fancyhead[LO]{\bfseries\nouppercase{\rightmark}}     % Section in the left on odd pages

\if@chapterRectangle
	\ifpdf
	\else
		\def\pgfsysdriver{pgfsys-dvipdfmx.def} %To use dvipdfm %.dvi compilation
	\fi

	\RequirePackage{Packages/myChapterRectangle}
	\setlength{\chapterRectangleWidth}{0.9cm}
	\setlength{\chapterRectangleSectionWidth}{0.3cm}
	\setlength{\chapterRectangleSubSectionWidth}{0.1cm}
	\renewcommand\chapterRectangleRatioPageHeight{0.95}
	
	\fancyfoot[CO]{\drawChapterRectangleOdd[chapter=\thechapterRectangleCurrentChapterCounter, section=\@arabic\c@section, subsection=\@arabic\c@subsection]}
	\fancyfoot[CE]{\drawChapterRectangleEven[chapter=\thechapterRectangleCurrentChapterCounter, section=\@arabic\c@section, subsection=\@arabic\c@subsection]}
\else
\fi

\fancypagestyle{plain}{%
	\fancyhf{} % clear all header and footer fields
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
	\if@chapterRectangle
		\fancyfoot[C]{\drawChapterRectangleOdd[chapter=\thechapterRectangleCurrentChapterCounter, section=\@arabic\c@section, subsection=\@arabic\c@subsection]}
	\fi
}

% Clear Header Style on the Last Empty Odd pages
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else%
\hbox{}%
\thispagestyle{empty}%              % Empty header styles
\newpage%
\if@twocolumn\hbox{}\newpage\fi\fi\fi}





%%% Table of contents for each chapter %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\RequirePackage[nottoc, notlof, notlot]{tocbibind}
\RequirePackage[nohints]{minitoc}
\setcounter{minitocdepth}{2}
\mtcindent=15pt
% Use \minitoc where to put a table of contents
\let\minitocORIG\minitoc
\renewcommand{\minitoc}{\minitocORIG \vspace{1.5em}}


%%% Math Definition %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\RequirePackage{xfrac}
\RequirePackage{stmaryrd} %% Use \rrbracket et \llbracket to have [| and|]
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\newtheoremstyle{breakTH}% name
	{}%         Space above, empty = `usual value'
	{}%         Space below
	{\itshape}% Body font
	{}%         Indent amount (empty = no indent, \parindent = para indent)
	{\bfseries}% Thm head font
	{.}%        Punctuation after thm head
	{\newline}% Space after thm head: \newline = linebreak
	{}%         Thm head spec
\theoremstyle{breakTH}
%%% Property
\ifx\thechapter\undefined
	\newtheorem{propertyx}{\protect\propertyname}
\else
	\newtheorem{propertyx}{\protect\propertyname}[chapter]
\fi
\newenvironment{property}{\pushQED{\qed}\renewcommand{\qedsymbol}{\propertyend}\propertyx}{\popQED\endpropertyx}
%%% Assumption
\ifx\thechapter\undefined
	\newtheorem{assumptionx}{\protect\assumptionname}
\else
	\newtheorem{assumptionx}{\protect\assumptionname}[chapter]
\fi
\newenvironment{assumption}{\pushQED{\qed}\renewcommand{\qedsymbol}{\assumptionend}\assumptionx}{\popQED\endassumptionx}
%%% Theorem
\ifx\thechapter\undefined
	\newtheorem{theoremx}{\protect\theoremname}
\else
	\newtheorem{theoremx}{\protect\theoremname}[chapter]
\fi
\newenvironment{theorem}{\pushQED{\qed}\renewcommand{\qedsymbol}{\theoremend}\theoremx}{\popQED\endtheoremx}
%%% Theorem
\ifx\thechapter\undefined
	\newtheorem{linearprogMyx}{\protect\linearprogMyname}
\else
	\newtheorem{linearprogMyx}{\protect\linearprogMyname}[chapter]
\fi
\newenvironment{linearprogMy}{\pushQED{\qed}\renewcommand{\qedsymbol}{\linearprogMyend}\linearprogMyx}{\popQED\endlinearprogMyx}
%%% Lemma
\ifx\thechapter\undefined
	\newtheorem{lemmax}{\protect\lemmaname}
\else
	\newtheorem{lemmax}{\protect\lemmaname}[chapter]
\fi
\newenvironment{lemma}{\pushQED{\qed}\renewcommand{\qedsymbol}{\lemmaend}\lemmax}{\popQED\endlemmax}
%%% Constraint
\ifx\thechapter\undefined
	\newtheorem{constraintx}{\protect\constraintname}
\else
	\newtheorem{constraintx}{\protect\constraintname}[chapter]
\fi
\newenvironment{constraint}{\pushQED{\qed}\renewcommand{\qedsymbol}{\constraintend}\constraintx}{\popQED\endconstraintx}
%%% Corollary
\ifx\thechapter\undefined
	\newtheorem{corollaryx}{\protect\corollaryname}
\else
	\newtheorem{corollaryx}{\protect\corollaryname}[chapter]
\fi
\newenvironment{corollary}{\pushQED{\qed}\renewcommand{\qedsymbol}{\corollaryend}\corollaryx}{\popQED\endcorollaryx}
%%% Condition
\ifx\thechapter\undefined
	\newtheorem{conditionx}{\protect\conditionname}
\else
	\newtheorem{conditionx}{\protect\conditionname}[chapter]
\fi
\newenvironment{condition}{\pushQED{\qed}\renewcommand{\qedsymbol}{\conditionend}\conditionx}{\popQED\endconditionx}
%%% Schedulability Test
\ifx\thechapter\undefined
	\newtheorem{schedulabilityTestx}{\protect\schedulabilityTestname}
\else
	\newtheorem{schedulabilityTestx}{\protect\schedulabilityTestname}[chapter]
\fi
\newenvironment{schedulabilityTest}{\pushQED{\qed}\renewcommand{\qedsymbol}{\schedulabilityTestend}\schedulabilityTestx}{\popQED\endschedulabilityTestx}

\newtheoremstyle{breakDF}% name
	{}%         Space above, empty = `usual value'
	{}%         Space below
	{}% Body font
	{}%         Indent amount (empty = no indent, \parindent = para indent)
	{\bfseries}% Thm head font
	{.}%        Punctuation after thm head
	{\newline}% Space after thm head: \newline = linebreak
	{}%         Thm head spec
\theoremstyle{breakDF}
%%% Definition
\ifx\thechapter\undefined
	\newtheorem{definitionx}{\protect\definitionname}
\else
	\newtheorem{definitionx}{\protect\definitionname}[chapter]
\fi
\newenvironment{definition}{\pushQED{\qed}\renewcommand{\qedsymbol}{\definitionend}\definitionx}{\popQED\enddefinitionx}
  
\theoremstyle{remark}
%%% Remark
\ifx\thechapter\undefined
	\newtheorem{remarkx}{\protect\remarkname}
\else
	\newtheorem{remarkx}{\protect\remarkname}[chapter]
\fi
\newenvironment{remark}{\pushQED{\qed}\renewcommand{\qedsymbol}{\remarkend}\remarkx}{\popQED\endremarkx}

\providecommand{\definitionname}{\iflanguage{frenchb}{D{\'e}finition}{Definition}}
\providecommand{\definitionend}{$\blacksquare$}
\providecommand{\propertyname}{\iflanguage{frenchb}{Propri{\'e}t{\'e}}{Property}}
\providecommand{\propertyend}{$\blacksquare$}
\providecommand{\assumptionname}{\iflanguage{frenchb}{Hypoth{\`e}se}{Assumption}}
\providecommand{\assumptionend}{$\blacksquare$}
\providecommand{\theoremname}{\iflanguage{frenchb}{Th{\'e}or{\`e}me}{Theorem}}
\providecommand{\theoremend}{$\blacksquare$}
\providecommand{\linearprogMyname}{Linear Programming Problem (LPP)}
\providecommand{\linearprogMyend}{$\blacksquare$}
\providecommand{\lemmaname}{\iflanguage{frenchb}{Lemme}{Lemma}}
\providecommand{\lemmaend}{$\blacksquare$}
\providecommand{\constraintname}{\iflanguage{frenchb}{Contrainte}{Constraint}}
\providecommand{\constraintend}{$\blacksquare$}
\providecommand{\corollaryname}{\iflanguage{frenchb}{Corollaire}{Corollary}}
\providecommand{\corollaryend}{$\blacksquare$}
\providecommand{\conditionname}{Condition}
\providecommand{\conditionend}{$\blacksquare$}
\providecommand{\schedulabilityTestname}{\iflanguage{frenchb}{Test d'ordonnan{\c{c}}abilit{\'e}}{Schedulability Test}}
\providecommand{\schedulabilityTestend}{$\blacksquare$}
\providecommand{\remarkname}{\iflanguage{frenchb}{Remarque}{Remark}}
\providecommand{\remarkend}{$\diamond$}

%% Algorithmes
\usepackage[english,ruled,longend,linesnumbered,titlenumbered]{algorithm2e}




%%% Glossaries / Maximes  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\if@maxime
	\RequirePackage{Packages/myMaximes}
\fi
\if@glossaries
	\RequirePackage{Packages/myGlossaries}
	\makeglossaries
	\robustify{\gls}% Make \gls not fragile, to use it into captions or sections
	\robustify{\glsentryfirst}
	\robustify{\glsentryfirstplural}
	\robustify{\glsentrydesc}
	\robustify{\glsentrytext}
	\newcommand\glsdisplayentry[1]{#1}
	\pdfstringdefDisableCommands{\let\glsentryfirst\glsdisplayentry}
	\pdfstringdefDisableCommands{\let\glsentryfirstplural\glsdisplayentry}
	\pdfstringdefDisableCommands{\let\glsentrytext\glsdisplayentry}
	\pdfstringdefDisableCommands{\let\glsentrydesc\glsdisplayentry}
\fi

%%% Listing/Code  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\RequirePackage{listings}
\definecolor{gris}{rgb}{0.95,0.95,0.95}
\definecolor{darkblue}{rgb}{0.0,0.0,0.6}
\definecolor{cyan}{rgb}{0.0,0.6,0.6}
\definecolor{verylightgray}{gray}{0.9}

%\lstset{
%	language=C,
%	numbers=left,
%	tabsize=4,
%	backgroundcolor=\color{gris},
%	frame=single,
%	breaklines=true,
%	stringstyle=\ttfamily,
%	framexleftmargin=6mm,
%	xleftmargin=6mm,
%	basicstyle=\small,
%	keywordstyle=\color{black}\bfseries,
%	commentstyle=\color{red}\textit,
%	stringstyle=\color{Orange}\ttfamily
%}

\lstdefinelanguage{XML}{
	morestring=[b]",
	morestring=[s]{>}{<},
	morecomment=[s]{<?}{?>},
	stringstyle=\color{black},
	identifierstyle=\color{darkblue},
	keywordstyle=\color{cyan},
	morekeywords={xmlns,version}% list your attributes here
}

\lstset{
	language=XML,
	basicstyle=\scriptsize,
	tabsize=2,
	backgroundcolor=\color{verylightgray},
	frame=single,
	breaklines=true,
	columns=fullflexible,
	showstringspaces=false,
	numbers=none,
	framexleftmargin=1mm,
	xleftmargin=1mm
}

%%% Big Center  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Use \begin{bigcenter} \end{bigcenter} ou \bigcentering to center on the full page (without text margin)

\newskip\@bigflushglue \@bigflushglue = -100pt plus 1fil
\def\bigcenter{\trivlist \bigcentering\item\relax}
\def\bigcentering{\let\\\@centercr\rightskip\@bigflushglue%
\leftskip\@bigflushglue
\parindent\z@\parfillskip\z@skip}
\def\endbigcenter{\endtrivlist\vspace{-0.5\baselineskip}}




%%% Bibliography  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% 
\if@biblatex
	\RequirePackage[backref=true,backend=bibtex8,backrefstyle=none,style=alphabetic,labelalpha=true,block=none,maxbibnames=5,maxcitenames=3,abbreviate=false,sorting=nty]{biblatex} 
	\RequirePackage{xstring}
	
	\def\getfirstparameter#1,#2\relax{#1}
	\newcommand{\etal}[2][]{%
	\ifx&#1&%
		\IfSubStr{#2}{,}{%
			\Citeauthor{\getfirstparameter#2\relax} \cite{#2}%
		}{%
			\Citeauthor{#2} \cite{#2}%
		}%
	\else%
 		#1 \cite{#2}%
	\fi%
	}
	% style=authoryear to verify author names (merged) or style=alphabetic for Alpha style
	\defbibheading{bibliographySection}[\bibname]{%
		\section*{#1}%
		\markboth{#1}{#1}
	}
	
	\setlength{\bibitemsep}{\baselineskip}
	\DefineBibliographyStrings{english}{%
		backrefpage = {Cited on page },
		backrefpages= {Cited on pages },
	}
	\DefineBibliographyStrings{french}{%
		backrefpage = {Cit{\'e} en page },
		backrefpages= {Cit{\'e} en pages },
	}
	
	\renewbibmacro*{pageref}{%
		\addperiod% NEW
		\iflistundef{pageref}
		{}
		{
			\newline \hspace*{\fill} \printtext[parens]{% NEW
				\ifnumgreater{\value{pageref}}{1}
					{\bibstring{backrefpages}\ppspace}
					{\bibstring{backrefpage}\ppspace}%
				\printlist[pageref][-\value{listtotal}]{pageref}%\addperiod
			}
		}
	}
	\patchcmd{\bibsetup}{\interlinepenalty=5000}{\interlinepenalty=10000}{}{}
	
	\RequirePackage{xpatch}% or use http://tex.stackexchange.com/a/40705
	
	\def\makenamesetup{%
		\def\bibnamedelima{~}%
		\def\bibnamedelimb{ }%
		\def\bibnamedelimc{ }%
		\def\bibnamedelimd{ }%
		\def\bibnamedelimi{ }%
		\def\bibinitperiod{.}%
		\def\bibinitdelim{~}%
		\def\bibinithyphendelim{.-}}    
	\newcommand*{\makename}[3]{\begingroup\makenamesetup\xdef#1{#2, #3}\endgroup}
	
	\newbibmacro*{name:bold}[2]{%
		\makename{\currname}{#1}{#2}%
		\makename{\findname}{\lastname}{\firstname}%
		\makename{\findinit}{\lastname}{\firstinit}%
		\ifboolexpr{ test {\ifdefequal{\currname}{\findname}} or test {\ifdefequal{\currname}{\findinit}} }{\bfseries}{}}
	
	\newcommand*{\underlinename}[3]{%
		\def\lastname{#1}%
		\def\firstname{#2}%
		\def\firstinit{#3}}
	\underlinename{}{}{}
	
	\xpretobibmacro{name:last}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
	\xpretobibmacro{name:first-last}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
	\xpretobibmacro{name:last-first}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
	\xpretobibmacro{name:delim}{\begingroup\normalfont}{}{}
	
	\xapptobibmacro{name:last}{\endgroup}{}{}
	\xapptobibmacro{name:first-last}{\endgroup}{}{}
	\xapptobibmacro{name:last-first}{\endgroup}{}{}
	\xapptobibmacro{name:delim}{\endgroup}{}{}
	
	% Force \fullcite to use the maxbibnames value instead maxcitenames
	\DeclareCiteCommand{\fullcite}
		{\defcounter{maxnames}{\blx@maxbibnames}%
		\usebibmacro{prenote}}
		{\usedriver
			{\DeclareNameAlias{sortname}{default}}
			{\thefield{entrytype}}}
		{\multicitedelim}
		{\usebibmacro{postnote}}
		
	% Author with small capitals
	\renewcommand{\mkbibnamefirst}[1]{\textsc{#1}}
	\renewcommand{\mkbibnamelast}[1]{\textsc{#1}}
	\renewcommand{\mkbibnameprefix}[1]{\textsc{#1}}
	\renewcommand{\mkbibnameaffix}[1]{\textsc{#1}}
\fi

\endinput