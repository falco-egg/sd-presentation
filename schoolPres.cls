\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{schoolPres}[2022/11/05 Cadys school Presentation]

% --- package setup ---

\LoadClass[16pt,aspectratio=169]{beamer}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[ngerman]{babel}

\RequirePackage{lmodern}
\RequirePackage{csquotes}
\RequirePackage{tabto}
\RequirePackage{hyperref}
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
\RequirePackage[]{listings}

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

\setlength{\parindent}{0mm}

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
	basicstyle=\ttfamily\footnotesize,
	breakatwhitespace=false,
	breaklines=true,
	keepspaces=true,
	numbers=left,
	numbersep=5pt,
	showspaces=false,
	showstringspaces=false,
	showtabs=false,
	tabsize=2,
}\lstset{style=myStyle}
\renewcommand{\lstlistingname}{Auflistung}

\newcommand\blfootnote[1]{%
  \begingroup
  \renewcommand\thefootnote{}\footnote{#1}%
  \addtocounter{footnote}{-1}%
  \endgroup
}

% --- Beamer ---

\mode<presentation>
\usetheme[compress]{Berlin}
\usecolortheme[RGB={95,72,108}]{structure}
\useinnertheme{rectangles}
\setbeamerfont{note page}{size=\footnotesize}
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{footline}{}

\definecolor{beamer-note-bg}{RGB}{12,12,12}
\setbeamertemplate{note page}{%
	\pagecolor{beamer-note-bg}\textcolor{white}{%
		\vspace{1em}\\
		\textbf{\insertframenumber: \insertsubsection}\\
		\insertnote
	}
}

\RequirePackage[absolute,overlay]{textpos}
% absolute - no need to move block into position
% overlay - remove footer

% Setting default units for textpos simplifies coding a little bit
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

% for secondary text
\newcommand\tsec[1] {%
  {\color{lightgray}\hypersetup{allcolors=gray}#1}%
}

% Place a picture over the slide
\newcommand<>{\fullsizegraphic}[1]{%
  \begin{textblock}{0}(0,0)%
    \only#2{%
      \begin{tikzpicture}%
        \fill [black] (current page.north west) rectangle (current page.south east);
        \node[overlay] at (current page.center)
          {\includegraphics[keepaspectratio,width=\paperwidth,height=\paperheight]{#1}};
      \end{tikzpicture}%
    }%
  \end{textblock}%
}

\defbeamertemplate*{title page}{customized}[1][]
{
	\begin{beamercolorbox}{title}%
		\vspace{-.5em}%
		\begin{center}%
			\usebeamerfont{author}{\insertauthor} -- \usebeamerfont{title}{\inserttitle} (\insertdate)\\
			\usebeamerfont{subtitle}{\small\insertsubtitle}
		\end{center}%
	\end{beamercolorbox}
}

\setbeamertemplate{section in toc}{%
  \leavevmode%
  \hspace{.42\textwidth}
  \llap{%
    \hbox to2.25ex{\hfil\usebeamercolor[fg]{structur{structure}e}{\tikz[baseline=-.73ex]{\fill (0,0) circle (.4ex)}\hfil}}
  }%
  \kern1.25ex\inserttocsection\par%
}

\newcommand{\FramedSection}[1]{
  \section{{#1}}%
  \begin{frame}%
    \vfill\begin{beamercolorbox}[sep=12pt, center]{title}%
      \usebeamerfont{title}{#1}\par%
    \end{beamercolorbox}\vfill%
  \end{frame}%
}

% --- Math stuff ---

\newcommand*{\dd}{\mathop{}\!\mathrm{d}\!}
\DeclareMathOperator{\ee}{e}
\DeclareMathOperator{\ii}{i}