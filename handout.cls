\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{handout}[2023/02/22 Cadys Handout]

% --- package setup ---

\LoadClass{article}
\RequirePackage[a4paper,margin=1.5cm]{geometry}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[ngerman]{babel}
\RequirePackage[scaled]{helvet}
\renewcommand*\familydefault{\sfdefault}

\RequirePackage{sectsty}
\RequirePackage{lmodern}
\RequirePackage{csquotes}
\RequirePackage{tabto}
\RequirePackage{hyperref}
\RequirePackage{fancyhdr}
\RequirePackage{isodate}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{calc}
\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{pgfplotstable}
\RequirePackage{subcaption}
\RequirePackage{wrapfig}
\RequirePackage{multicol}
\RequirePackage{listings}
\RequirePackage{pmboxdraw}
\RequirePackage[normalem]{ulem}
\RequirePackage{menukeys}

\usetikzlibrary{calc}
\usetikzlibrary{intersections}
\usepgfplotslibrary{fillbetween}
\pgfplotsset{compat=1.18}

\numdate
\daymonthsepgerman{}
\monthyearsepgerman{}{}

\hypersetup{
	pdftex,
	pdfstartview=FitH,
	bookmarksopen=true,
	bookmarksopenlevel=2,
	hyperindex=true,
	bookmarks=true,
	unicode=true,
	colorlinks=true,
	allcolors=.,
	urlcolor=magenta,
	citecolor=cyan,
}

\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyfoot[R]{%
    \raisebox{4pt}{\pmboxdrawuni{2595}\pmboxdrawuni{2594}}%
    \hspace{-6pt}\thepage\hspace{-6pt}%
    \raisebox{-2pt}{\pmboxdrawuni{2581}\pmboxdrawuni{258F}}%
  }%
  \renewcommand*{\headrulewidth}{0pt}%
  \renewcommand*{\footrulewidth}{0pt}%
}

\pagestyle{plain}
\setlength{\parindent}{0mm}
\setlength\columnsep{14pt}

\lstdefinelanguage[ino]{C++}[11]{C++} {
	morekeywords={pinMode, analogWrite, digtalWrite, delay, File},
	sensitive=true,
}

\definecolor{codegray}{RGB}{128,128,128}
\definecolor{codeyellow}{RGB}{136,57,239}
\definecolor{codebg}{RGB}{245,241,239}
\lstdefinestyle{myStyle}{
	language=[ino]C++,
	frame=tb,
	backgroundcolor=\color{codebg},
	commentstyle=\color{codegray},
	keywordstyle=\color{cyan},
	numberstyle=\tiny\color{codegray},
	stringstyle=\color{codeyellow},
	basicstyle=\ttfamily\tiny,
	breakatwhitespace=false,
	breaklines=true,
	keepspaces=true,
	numbers=left,
	numbersep=2pt,
	showspaces=false,
	showstringspaces=false,
	showtabs=false,
	tabsize=2,
}\lstset{style=myStyle}
\renewcommand{\lstlistingname}{Auflistung}

% --- layout commands ---

\makeatletter%
\renewcommand{\author}[1]{\def\@author{#1}}
\newcommand{\location}[1]{\def\@location{#1}}

\newif\ifauthor
\authorfalse
\def\@author{}

\newif\iflocation
\locationfalse
\def\@location{}

\newcounter{handoutTitle}

\renewcommand*{\maketitle}{%
	\stepcounter{handoutTitle}%
	\pdfbookmark[1]{\@title~\@date}{handoutTitle__\arabic{handoutTitle}}%
	\textbf{\Large \@title} \hfill% 
	\ifx\@location\empty%
	\else%
		\@location, den~%
	\fi \isodate{\@date}\\%
	\ifx\@author\empty%
	\else%
		\@author\\%
	\fi
  \rule{\linewidth}{.5ex}%
}

% for secondary text
\newcommand\tsec[1] {%
  {\color{lightgray}\hypersetup{allcolors=gray}#1}%
}

\newcounter{handsec}
\newcounter{handsubsec}

\newcommand{\handsec}[1]{{\centering \section*{\uline{#1}}}\stepcounter{handsec}\pdfbookmark[2]{#1}{handsec__\arabic{handsec}}}
\newcommand{\handsubsec}[1]{\subsection*{--~#1}\stepcounter{handsubsec}\pdfbookmark[3]{#1}{handsubsec__\arabic{handsubsec}}}

% --- Math stuff ---

\newcommand*{\dd}{\mathop{}\!\mathrm{d}\!}
\DeclareMathOperator{\ee}{e}
\DeclareMathOperator{\ii}{i}