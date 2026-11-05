% =========================================================================
% IEEEtran.cls - Compatible IEEE Transactions / Conference LaTeX2e Class
% =========================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{IEEEtran}[2024/01/01 V1.8b Compatible IEEE Transactions Class]

\DeclareOption{journal}{}
\DeclareOption{conference}{}
\DeclareOption{twocolumn}{}
\DeclareOption{10pt}{}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[10pt,twocolumn]{article}

\RequirePackage[letterpaper,top=0.68in,bottom=0.68in,left=0.625in,right=0.625in,columnsep=0.22in]{geometry}
\RequirePackage{mathptmx}
\RequirePackage[scaled=0.90]{helvet}

\setlength{\parindent}{1.0em}
\setlength{\parskip}{0pt}

% IEEE Section Numbering: Roman I, Alphabetic A, Arabic 1)
\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thesubsection}{\thesection-\Alph{subsection}}
\renewcommand{\thesubsubsection}{\arabic{subsubsection})}

\makeatletter
\renewcommand{\section}{\@startsection{section}{1}{\z@}%
  {1.4ex plus 0.5ex minus 0.3ex}%
  {0.8ex plus 0.2ex}%
  {\normalfont\normalsize\bfseries\scshape\centering}}

\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
  {1.0ex plus 0.4ex minus 0.2ex}%
  {0.5ex plus 0.2ex}%
  {\normalfont\normalsize\itshape}}

\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{1.0em}%
  {0.8ex plus 0.3ex minus 0.1ex}%
  {-0.5em}%
  {\normalfont\normalsize\itshape}}

\def\@seccntformat#1{%
  \expandafter\ifx\csname #1\endcsname\section
    \thesection.\hspace{0.5em}%
  \else
    \expandafter\ifx\csname #1\endcsname\subsection
      \Alph{subsection}.\hspace{0.4em}%
    \else
      \arabic{subsubsection})\hspace{0.3em}%
    \fi
  \fi
}

% Title & Author Blocks
\newcommand{\IEEEauthorblockN}[1]{{\large #1\par}\vspace{3pt}}
\newcommand{\IEEEauthorblockA}[1]{{\small\itshape #1\par}}
\newcommand{\IEEEcompsocitemizethanks}{\relax}
\newcommand{\IEEEcompsocthanksitem}{\par}

\renewcommand{\@maketitle}{%
  \newpage
  \null
  \vspace{-0.8em}%
  \begin{center}%
    {\LARGE\bfseries \@title \par}%
    \vskip 1.0em%
    {\normalfont \@author \par}%
  \end{center}%
  \par
  \vskip 0.8em
}

% Abstract and Index Terms in IEEE Bold/Italic Run-in Style
\renewenvironment{abstract}{%
  \small\bfseries\itshape\noindent Abstract---\ignorespaces
}{\par\vspace{0.6em}\normalfont}

\newenvironment{IEEEkeywords}{%
  \small\bfseries\itshape\noindent Index Terms---\ignorespaces
}{\par\vspace{0.8em}\normalfont}

% Drop Cap Command \IEEEPARstart{First}{rest}
\newcommand{\IEEEPARstart}[2]{\noindent{\Large\bfseries #1}{\small\bfseries\MakeUppercase{#2}}}

% IEEE Figure and Table Captions
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \footnotesize
  \sbox\@tempboxa{#1.\hspace{0.6em}#2}%
  \ifdim \wd\@tempboxa >\hsize
    #1.\hspace{0.6em}#2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

\renewcommand{\figurename}{Fig.}
\renewcommand{\tablename}{TABLE}
\renewcommand{\thetable}{\Roman{table}}

% Bibliography formatting (8pt compact IEEE style)
\renewenvironment{thebibliography}[1]{%
  \section*{References}%
  \footnotesize
  \list{\@biblabel{\@arabic\c@enumiv}}%
       {\settowidth\labelwidth{\@biblabel{#1}}%
        \leftmargin\labelwidth
        \advance\leftmargin\labelsep
        \setlength{\itemsep}{0pt}%
        \setlength{\parsep}{0pt}%
        \usecounter{enumiv}%
        \let\p@enumiv\@empty
        \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m}
 {\def\@noitemerr
   {\@latex@warning{Empty `thebibliography' environment}}%
  \endlist}
\makeatother
\endinput
