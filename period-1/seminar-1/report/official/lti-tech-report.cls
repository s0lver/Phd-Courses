%
%% This is the Cinvestav Thesis CLS file. It is based on the book.cls
%%
%%
%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{cinvestav}
              [2005/09/16 v1.4f
 Standard LaTeX document class]
\RequirePackage{ifthen}
\RequirePackage{setspace}
%\RequirePackage[T1]{fontenc}
%\RequirePackage{avant}
\renewcommand{\familydefault}{\sfdefault}
%\bibfont{\sfdefault}


\newcommand{\thesisen}[1]
   {\def\@thesisnameen{thesis}
    \def\@Thesisnameen{Thesis}
    \def\@degreenameen{#1}
   }
\newcommand{\thesis}[1]
   {\def\@thesisname{tesis}
    \def\@Thesisname{Tesis}
    \def\@degreename{#1}
   }
 
\newcommand{\eslang}[1]{\def\@eslang{#1}}
\eslang{}
\newcommand{\esfinal}[1]{\def\@esfinal{#1}}
\esfinal{}
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage{fancyhdr}
%\RequirePackage{hyperref}
\RequirePackage{algorithm}

% Properly clear the global variables and commands
% (is is more a convention to prevent confusion with
% symbols defined at other scopes)
\global\let\@eslang\@empty
%\global\let\@eslang\relax
\DeclareOption{ENG}{\eslang{true}} %gtp
\DeclareOption{DRAFT}{\esfinal{true}} %gtp
\DeclareOption{draft}{\esfinal{true}} %gtp
\DeclareOption{ESP}{}
%\esplang{true}
%\eslang{true}



\DeclareOption{PhD}{\thesis{Doctor en Ciencias}\thesisen{Doctor of Science}}
			% default -- nothing more to do
\DeclareOption{MSc}{
\thesis{Maestro en Ciencias}
\thesisen{Master of Science}
} %gtp


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\if@compatibility\else
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\fi
\renewcommand\@ptsize{2}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}\esfinal{true}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility
\@openrighttrue
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
\ExecuteOptions{letterpaper,12pt,twoside,onecolumn,final,openright}
\ProcessOptions
\input{bk1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand{\baselinestretch}{1.2}
%\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
          \thesection. \ %
        \fi
        ##1}}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}}}
\fi
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }
  \if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
%  \global\let\@acknowledgmenttoproject\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
%  \global\let\acknowledgmenttoproject\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
%\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thechapter {}
%\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand \thesection {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}}
\newcommand\mainmatter{%
    \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}}
\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse}
\newcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{plain}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
               \if@openright
                \null
                \thispagestyle{empty}%
                \newpage
               \fi
              \fi
              \if@tempswa
                \twocolumn
              \fi}
\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\newcommand\newappendix{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@newappendix\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         %\addcontentsline{toc}{chapter}% cambio capitulo
                                   {\protect\numberline{\thechapter}#1}%
                       \else
                         %\addcontentsline{toc}{chapter}{#1}% cambio capitulo
                       \fi
                    \else
                      %\addcontentsline{toc}{chapter}{#1}% cambio capitulo
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@newappendix[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}% cambio capitulo
                                   {\protect\numberline{\thechapter}#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}% cambio capitulo
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}% cambio capitulo
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@makechapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@
  }}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }}
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@compatibility
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi

\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter \fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter \fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter \fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}
\newcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{
  \ifx\@eslang\@empty
\'Indice General
\else
\contentsname
\fi
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
 \newcommand*\l@chapter[2]{%
   \ifnum \c@tocdepth >\m@ne
     \addpenalty{-\@highpenalty}%
     \vskip 1.0em \@plus\p@
     \setlength\@tempdima{1.5em}%
     \begingroup
       \parindent \z@ \rightskip \@pnumwidth
       \parfillskip -\@pnumwidth
       \leavevmode \bfseries
       \advance\leftskip\@tempdima
       \hskip -\leftskip
       #1\nobreak\hfil  \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
       \penalty\@highpenalty
     \endgroup
    \fi}
%\newcommand*\l@chapter{\@dottedtocline{0}{1.0em}{1.5em}}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{
\ifx\@eslang\@empty
\'Indice de Figuras
\else
\listfigurename
\fi
}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{
\ifx\@eslang\@empty
\'Indice de Tablas
\else
\listtablename
\fi
}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {
\chapter*{\bibname}%
\redefinefancya
\sffamily
\addcontentsline{toc}{chapter}{\bibname}
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
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
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Table of Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{Bibliography}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{headings}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\ifx\@eslang\@empty

\RequirePackage[spanish]{babel}
\selectlanguage{spanish}

\else

\RequirePackage[english]{babel}
\selectlanguage{english}

\fi




\def\@techreportnumber{01}
\def\@shorttitle{Agrega un t\'itulo corto}
\def\@publishedday{01}
\def\@publishedmonth{01}
\def\@publishedyear{01}
\def\@title{SIN T\'ITULO!?!}
\def\@titleen{NO TITLE!?!}
\def\@author{FALTA EL AUTOR!?!}
\def\@adscripcion{FALTA la adscripcion!?!}

\def\@campus{Tamaulipas}
\def\@titlesize{\Large}
\def\@Thesisname{Tesis}
\def\@Thesisnameen{Thesis}
\def\@thesisname{tesis}
\def\@thesisnameen{thesis}
\def\@date{Agrega fecha de graduaci\'on}
\def\@city{Ciudad Victoria, Tamaulipas}
\def\@degreein{Ciencias Computaci\'{o}n}
\def\@degreeinen{Computer Science}

 \def\@keywords{Agrega tus keywords}
 \def\@correspondingauthor{Agrega el nombre y correo electr\'onico}
 \def\@grants{Aggrega los agradecimientos de financiamiento} % here
 \def\@dateofsubmission{Fecha en que fue sometido el art'\iculo}
 \def\@tobecited{Indique como ser\'a citado}
 \def\@placeanddateofpublication{Será agregado por la instituci\'{o}}

\newcommand{\shorttitle}[1]{\def\@shorttitle{#1}}
\newcommand{\publishedday}[1]{\def\@publishedday{#1}}
\newcommand{\publishedyear}[1]{\def\@publishedyear{#1}}
\newcommand{\publishedmonth}[1]{\def\@publishedmonth{#1}}
\newcommand{\techreportnumber}[1]{\def\@techreportnumber{#1}}
\renewcommand{\title}[1]{\def\@title{#1}}
\newcommand{\titleen}[1]{\def\@titleen{#1}}
\newcommand{\acknowledgmenttoproject}[1]{\def\@acknowledgmenttoproject{#1}} % here
\newcommand{\campus}[1]{\def\@campus{#1}}
\renewcommand{\author}[1]{\def\@author{#1}}
\newcommand{\adscripcion}[1]{\def\@adscripcion{#1}}
\renewcommand{\date}[1]{\def\@date{#1}}
\newcommand{\titlesize}[1]{\def\@titlesize{#1}}
\newcommand{\city}[1]{\def\@city{#1}}
\newcommand{\degreein}[1]{\def\@degreein{#1}}
\newcommand{\degreeinen}[1]{\def\@degreeinen{#1}}


\newcommand{\keywords}[1]{\def\@keywords{#1}}
\newcommand{\correspondingauthor}[1]{\def\@correspondingauthor{#1}}
\newcommand{\grants}[1]{\def\@grants{#1}} % here
\newcommand{\dateofsubmission}[1]{\def\@dateofsubmission{#1}}
\newcommand{\tobecited}[1]{\def\@tobecited{#1}}
 \newcommand{\placeanddateofpublication}[1]{\def\@placeanddateofpublication{#1}}



% The following commands set the department name.

\newif\if@department
\newcommand{\department}[1]{\def\@department{#1}\@departmenttrue}
\newcommand{\nodepartment}{\@departmentfalse}
\department     {Laboratorio de Tecnolog\'{i}as de la Informaci\'{o}n}

\newif\if@departmenten
\newcommand{\departmenten}[1]{\def\@departmenten{#1}\@departmententrue}
\newcommand{\nodepartmenten}{\@departmentenfalse}
\departmenten   {Information  Technology Laboratory}
% The following commands will process the "MA", "MS", "PhD", or "EdD"
% option.  (The default is "PhD".)

\newcommand{\dissertation}[1]
   {\def\@thesisname{dissertation}
    \def\@Thesisname{Dissertation}
    \def\@degreename{#1}
   }

% The following commands set the year in which the degree will be
% awarded, as well as the year of copyright.

\def\@degreeyear{\number\month}

  \def\@publishedmonth{\ifcase\month\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December\fi}
  \def\@publishedmonthen{\ifcase\month\or
    Enero\or Febrero\or Marzo\or Abril\or Mayo\or Junio\or
    Julio\or Agosto\or Septiembre\or Octubre\or Noviembre\or Diciembre\fi}
  \def\@degreeday{}

\def\@copyrightyear{\number\year}
\newif\if@cyrset
\@cyrsetfalse
\newcommand{\degreeyear}[1]
   {\def\@degreeyear{#1}\if@cyrset\else\def\@copyrightyear{#1}\fi}

%\newcommand{\publishedmonth}[1]{\def\@publishedmonth{#1}}
%\newcommand{\publishedmonthen}[1]{\def\@publishedmonthen{#1}}
\newcommand{\degreeday}[1]{\def\@degreeday{#1}}
\newcommand{\copyrightyear}[1]{\def\@copyrightyear{#1}\@cyrsettrue}








%
% When this file is included from other than uclathes,
% \@spacing may be undefined.
%
% NEEDSWORK:  This test always fails, even when uclathes.cls is loaded.
\def\@stdsinglespacing{1.0}
\ifx\@singlespacing\@stdsinglespacing
  % Spacing has already been set (in uclathes.cls).
\else
  % Spacing was not set, set it here as if we were uclathes.cls.
  % \typeout{Spacing not set.}
  \def\@singlespacing{1.0}
  \ifx\@esfinal\@empty
  \def\@doublespacing{1.544}	  % see above for explanation of value
  \else
  \def\@doublespacing{2.0}	  % see above for explanation of value
\fi
  \let\@spacing=\@singlespacing
\fi

%
% The following macro pair save and restore ``twocolumn'' status.
%
\newif\if@ColumnSaveValue
\newcommand{\ColumnSave}{
  \if@twocolumn
    \@ColumnSaveValuetrue
  \else
    \@ColumnSaveValuefalse
  \fi
  \pagebreak
  \onecolumn
}
\newcommand{\ColumnSaveHeading}[1]{
  \if@twocolumn
    \@ColumnSaveValuetrue
    \pagebreak
    \twocolumn[#1]
  \else
    \@ColumnSaveValuefalse
    \pagebreak
    #1
  \fi
}
\newcommand{\ColumnRestore}{\if@ColumnSaveValue\twocolumn\fi}







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%			      TITLE PAGE			       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}
\newcommand\@makesimpletitlepage{
        \ifx\@eslang\@empty
        \renewcommand{\listtablename}{\'{I}ndice de Tablas}
        \renewcommand{\tablename}{Tabla}

         \fi
   \begin {titlepage}
      \ColumnSave
      \begin {center}
        \ifx\@eslang\@empty
        \sffamily
        {\Huge \sffamily\bfseries Centro de Investigaci\'{o}n y de Estudios Avanzados del IPN} \\
        \vspace{1.5cm}
              
        {\Large Programa Institucional de Computaci\'{o}n}\\
        \vspace{0.5cm}
        {\Large \@department\\ \Large Unidad \@campus}\\
        \vspace{1.5cm}
              {\Huge \textbf{\@titlesize \@title} }\\
              \vspace{1cm}
              {\huge  \@Thesisname} \\
              \vspace{1cm}
              \textbf{\LARGE \bf \@author} \\
              \vspace{1cm}
\else
        \sffamily
        {\Huge \sffamily\bfseries Research Center for Advanced Study} \\
        \vspace{1.5cm}
        {\Large Institutional Computing Program}\\
        \vspace{0.5cm}
        {\Large \@departmenten\\ \Large \@campus\ Campus}\\
        \vspace{1.5cm}
              {\Huge \textbf{\@titlesize \@titleen} }\\
              \vspace{1cm}
              {\huge  \@Thesisnameen} \\
              \vspace{1cm}
              \textbf{\LARGE \bf \@author} \\
              \vspace{1cm}
\fi
                  \today
      \end {center}

      \ColumnRestore
   \end {titlepage}
}

\RequirePackage{graphicx}
\newcommand\@maketitlepage{
        \ifx\@eslang\@empty
        \renewcommand{\listtablename}{\'{I}ndice de tablas}
        \renewcommand{\tablename}{Tabla}
         \fi
   \begin {titlepage}
      \ColumnSave
      \begin {center}
        \sffamily
        \begin{tabular}{cc}
          \begin{minipage}{3cm}
            \ifpdf
            \vspace{-1cm}\hspace{-2.2cm}\includegraphics[scale=0.08]{../../../../images/cinvestav2.jpg}
            \else
            \vspace{-1cm}\hspace{-2.2cm}\includegraphics[scale=0.08]{../../../../images/cinvestav2.jpg}
            \fi
          \end{minipage}&
          \vspace{-.5cm}
            \begin{minipage}{10cm}
              \centering
              \vspace{-1.5cm}{\hspace{-3cm} \large\textsc{Centro de Investigaci\'{o}n y de Estudios Avanzados}}\\
%                {\hspace{-3cm} \large\textsc{del}}\\
                \vspace{.1cm}{\hspace{-3cm} \large \textsc{del Instituto Polit\'{e}cnico Nacional}} \\
            \end{minipage}
            \end{tabular}
%            \hspace{-3cm}
            \begin{minipage}{10cm}
              \centering
              \vspace{0.0cm}
            {\large \@department\\ }%\large Unidad \@campus
              \vspace{1cm}
              {\large Reporte T\'{e}cnico:}\\
              \vspace{0.5cm}
              {\large \@titlesize \@title }\\
          \end{minipage}

              \vspace{.5cm}
              {\normalsize
               \@author \\
               \vspace{0.3cm}
              {\normalsize \@adscripcion}\\
            }
      \end {center}
            \vspace{0.5cm}
            {\bf Resumen:}\\
            \@abstract

              \vspace{1cm}
%          \end{tabular}
     
%\vspace{.5cm}
\@city \hspace{6cm} \@month , \@publishedyear\\
%      {\normalsize 
%        \begin{tabular}{lr}
%          \hspace{-0.5cm}\@city & \@publishedmonthen , \@degreeyear\\
%        \end{tabular}
%      }
      \ColumnRestore
   \end {titlepage}
}
\newcommand\@maketitlepageen{
   \begin {titlepage}
      \ColumnSave
      \begin {center}
        \sffamily
        \begin{tabular}{cc}
          \begin{minipage}{3cm}
            \ifpdf
            \vspace{-1cm}\hspace{-2.2cm}\includegraphics[scale=0.08]{cinvestav2.jpg}
            \else
            \vspace{-1cm}\hspace{-2.2cm}\includegraphics[scale=0.08]{cinvestav2.jpg}
            \fi
          \end{minipage}&
          \vspace{-.5cm}
            \begin{minipage}{10cm}
              \centering
              \vspace{-1.5cm}{\hspace{-3cm} \large\textsc{Research Center for Advanced Studies}}\\
%                {\hspace{-3cm} \large\textsc{from the National Polytechnic Institute}}\\
                \vspace{.1cm}{\hspace{-3cm} \large \textsc{from the National Polytechnic Institute}} \\
            \end{minipage}
            \end{tabular}
%            \hspace{-3cm}
            \begin{minipage}{15cm}
              \centering
              \vspace{1.0cm}
            {\large \@departmenten\\ }%\large Unidad \@campus
              \vspace{2.5cm}
              {\large Technical Report:}\\
              \vspace{1cm}
              {\large \textbf{\@titlesize \@title} }\\
              \vspace{2cm}
          \end{minipage}

            {\large
               \@author \\
               \vspace{1cm}
              {\normalsize \@adscripcion}\\
            }
            \vspace{2cm}
            LTI-TR-\@publishedyear-\@techreportnumber\\
      \end {center}
 
            \vspace{3cm}

%          \end{tabular}
     
%\vspace{.5cm}
\@city \hspace{6cm} \@publishedmonth , \@publishedyear\\
%      {\normalsize 
%        \begin{tabular}{lr}
%          \hspace{-0.5cm}\@city & \@publishedmonthen , \@degreeyear\\
%        \end{tabular}
%      }
      \ColumnRestore
   \end {titlepage}
}

\newcommand\@maketitlepageena{

   \begin {titlepage}
      \ColumnSave
      \begin {center}
        \sffamily
        \begin{tabular}{cc}
          \begin{minipage}{3cm}
            \ifpdf
            \vspace{-1cm}\hspace{-1cm}\includegraphics[scale=0.1]{cinvestav2.jpg}
            \else
            \vspace{-1cm}\hspace{-1cm}\includegraphics[scale=0.1]{cinvestav2.eps}
            \fi
          \end{minipage}&
            \begin{minipage}{10cm}
              \centering
              \vspace{-1cm}{\LARGE \sffamily\bfseries Research Center for Advanced Studies} \\
              
            \@pagetitleline{\large Institutional Computing Program\\\large \@departmenten\\ \large \@campus\ Campus}
            \end{minipage}\\
            \begin{minipage}{3cm}
              \@pagetitlelinedos
            \end{minipage}&
%            \hspace{-3cm}
            \begin{minipage}{10cm}
              \centering
              \vspace{1.5cm}
              {\huge \textbf{\@titlesize \@titleen} }\\
              \vspace{1cm}
              {\huge  \@Thesisnameen} \\
              \vspace{1cm}
              {\large  
              as the fulfillment of the\\ requirement for the degree of:} \\
             \vspace{1cm}
              {\large \bf \@degreenameen\ }\\
             \vspace{1.2cm}
              {\large by} \\
             \vspace{1cm}
              \textbf{\Large \bf \@author} \\
          \end{minipage}
          \end{tabular}
     
      \end {center}
\@city \hspace{10cm} \@publishedmonthen , \@publishedyear\\
      {\normalsize 
        \begin{tabular}{lr}
          \hspace{-0.5cm}\@city & \@publishedmonthen , \@degreeyear\\
        \end{tabular}
      }

      \ColumnRestore
   \end {titlepage}


}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%			    COPYRIGHT PAGE			       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@copyright
\@copyrighttrue
\newcommand\nocopyright{\@copyrightfalse}

\def\@copyrightinfo{All Rights Reserved}
\newcommand\copyrightinfo[1]{\def\@copyrightinfo{#1}}

\newcommand\@makecopyrightpage{
   \ColumnSave
   \thispagestyle{empty}
 %  \null
%   \vfill
   \if@copyright
   \vspace{0.5cm}
   \begin{center}
   {\large \bf Abstract:}\\
   \end{center}
   \@abstract
   \small
   \begin{center}
   KEYWORDS: \@keywords\\
   \vspace{1cm}
   Corresponding author: \@correspondingauthor\\
   \vspace{0.5cm}
   % \@grants\\ HERE
   \vspace{0.5cm}
   \normalsize \normalfont \copyright\ Copyright by \departmenten, CINVESTAV-Tamaulipas. All rigths reserved\\
   \vspace{0.5cm}
   Date of submission: \@dateofsubmission\\
   \vspace{0.5cm}
   \@tobecited\\
   \vspace{0.5cm}
   Place and date of publication: \@placeanddateofpublication \  \@publishedmonth \ \@publishedday, \@publishedyear\\
 \end{center}

   
   \fi
   \ColumnRestore
}


\newif\if@copyrightto
\@copyrighttotrue
\newcommand\nocopyrightp{\@copyrighttofalse}

\newcommand\@makeacknowledgmenttoprojectpage{
   \ColumnSave
   \thispagestyle{empty}
   \null
   \vfill
   \if@copyrightto
      \begin{center}
	 \@acknowledgmenttoproject
      \end{center}
   \fi
   \ColumnRestore
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%			    SIGNATURE PAGE			       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The following definitions for "\chair" and "\member" allow for one or
% three chairs (co-chairs) and up to six additional committee members.

\newcounter{chairs}
\setcounter{chairs}{0}
\newcommand\chair[1]{
   \ifcase\value{chairs}
      \def\@chairA{#1} \or \def\@chairB{#1} \or \def\@chairC{#1}
   \else
      \typeout{Too many co-chairs.}
   \fi
   \addtocounter{chairs}{1}
}

\newcounter{members}
\setcounter{members}{0}
\newcommand\member[1]{
   \ifcase\value{members}
      \def\@memberA{#1} \or \def\@memberB{#1} \or \def\@memberC{#1} \or
      \def\@memberD{#1} \or \def\@memberE{#1} \or \def\@memberF{#1}
   \else
      \typeout{Too many committee members.}
   \fi
   \addtocounter{members}{1}
}

% The following definition for "\@signatureline" draws a line and puts
% a name underneath the line.  If the standard "single" line spacing is
% changed, it may be desirable to change the "\vskip" before the name.

\newcommand\@signatureline[1]{
   \rule{4in}{0.01in} \\ \vskip-10pt{#1} \\
   \vskip 36pt plus0pt minus15pt%
}

\newcommand\@pagetitleline[1]{
   \rule{4in}{0.03in} \\ 
%   {\vspace{-0.35cm}\rule{4in}{0.03in}} \\ 
%   {\vspace{-0.4cm}\rule{4in}{0.01in}} \\ \vskip-2pt{#1} \\
   {\vspace{-0.35cm}\rule{4in}{0.00in}} \\ 
   {\vspace{-0.4cm}\rule{4in}{0.00in}} \\ \vskip-2pt{#1} \\
   \vskip 46pt plus0pt minus15pt%
}
\newcommand\@pagetitlelinedos{
   \hspace{0.60cm}
\rule{0.00in}{6.5in}
\hspace{0.05cm}
\rule{0.00in}{6.5in}\hspace{0.07cm}
\rule{0.00in}{6.5in}

%\rule{0.03in}{6.5in}
%\hspace{0.05cm}
%\rule{0.03in}{6.5in}\hspace{0.07cm}
%\rule{0.01in}{6.5in}
}
\newcommand\@makesignaturepage{
   \ColumnSave
   \chapter*{}
   
%   \setcounter{page}{2}
   
   \noindent
   \renewcommand\baselinestretch{\@doublespacing}\@normalsize
   \thispagestyle{empty}%

   \begin{center}
   \normalsize \normalfont La \@thesisname\ presentada por \@author\ fue aprobada por:\\ 
 \end{center}
 \vskip 20pt
\begin{center}
  \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
\end{center}
   \vskip 72pt plus0pt minus24pt
   \begin {flushright}
      \ifnum\c@members>5 \@signatureline{\@memberF}\fi
      \ifnum\c@members>4 \@signatureline{\@memberE}\fi
      \ifnum\c@members>3 \@signatureline{\@memberD}\fi
      \ifnum\c@members>2 \@signatureline{\@memberC}\fi
      \ifnum\c@members>1 \@signatureline{\@memberB}\fi
      \ifnum\c@members>0 \@signatureline{\@memberA}
         \else\typeout{Comit\'{e} sin miembros.}\fi
      \ifnum\c@chairs>2
         \@signatureline{\@chairC, Co-Director}
         \@signatureline{\@chairB, Co-Director}
         \@signatureline{\@chairA, Co-Director}
      \else\ifnum\c@chairs>1
         \@signatureline{\@chairB, Co-Director}
         \@signatureline{\@chairA, Co-Director}
      \else\ifnum\c@chairs>0
         \@signatureline{\@chairA, Director}
      \else\typeout{Sin director de Tesis.}
      \fi\fi\fi
   \end {flushright}
   \vfill
   \begin {center}
     \@city, \@degreeday\  de \@publishedmonth\ de \@degreeyear
   \end {center}
   \ColumnRestore
   \renewcommand\baselinestretch{\@spacing}\@normalsize
}

\newcommand\@makesignaturepageen{
   \ColumnSave
   \chapter*{}
   \thispagestyle{empty}%
   
   \pagenumbering{roman}
%   \setcounter{page}{2}
   
   \noindent
   \renewcommand\baselinestretch{\@doublespacing}\@normalsize
   \begin{center}
   \normalsize \normalfont The \@thesisnameen\ of \@author\ is approved by:
 \end{center}
 \vskip 20pt
\begin{center}
 \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
\end{center}
\vskip 72pt plus0pt minus24pt
   \begin {flushright}
      \ifnum\c@members>5 \@signatureline{\@memberF}\fi
      \ifnum\c@members>4 \@signatureline{\@memberE}\fi
      \ifnum\c@members>3 \@signatureline{\@memberD}\fi
      \ifnum\c@members>2 \@signatureline{\@memberC}\fi
      \ifnum\c@members>1 \@signatureline{\@memberB}\fi
      \ifnum\c@members>0 \@signatureline{\@memberA}
         \else\typeout{No comitte member.}\fi
      \ifnum\c@chairs>2
         \@signatureline{\@chairC, Committte Co-chair}
         \@signatureline{\@chairB, Committte Co-chair}
         \@signatureline{\@chairA, Committte Co-chair}
      \else\ifnum\c@chairs>1
         \@signatureline{\@chairB, Committte Co-chair}
         \@signatureline{\@chairA, Committte Co-chair}
      \else\ifnum\c@chairs>0
         \@signatureline{\@chairA, Committe Chair}
      \else\typeout{No comittee chair.}
      \fi\fi\fi
   \end {flushright}
   \vfill
   \begin {center}
     \@city, \@publishedmonthen\ \@degreeday\, \@degreeyear
   \end {center}
   \ColumnRestore
   \renewcommand\baselinestretch{\@spacing}\@normalsize
   \pagebreak
   \newpage
   \pagebreak
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%			   DEDICATION PAGE			       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@dedication
\def\@dedication{}
\newcommand\dedication[1]{\@dedicationtrue\def\@dedication{#1}}

\newcommand\@makededication{
   \if@dedication
      \ColumnSave
      \thispagestyle{empty}%

      \par\pagestyle{plain}
      \renewcommand\baselinestretch{\@spacing}\@normalsize\normalfont
      \vspace*{0pt}		% force spacing at top of page
      \vfill
      \begin{center}
	 \@dedication
      \end{center}
      \vfill
      \ColumnRestore
   \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%			 ACKNOWLEDGMENTS PAGE			       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@acks
\def\@acknowledgments{}
\newcommand\acknowledgments[1]{\@ackstrue\def\@acknowledgments{#1}}

\newcommand\@makeacknowledgmentsheading{
  {
    \centering
   \thispagestyle{empty}%

    \ifx\@eslang\@empty
%      \addcontentsline{toc}{chapter}{Agradecimientos}
      \chapter*{Agradecimientos}
    \else
%      \addcontentsline{toc}{chapter}{Acknowledgements}
      \chapter*{Acknowledgements}
    \fi
    \vskip 12pt
  }
}


\newcommand\@makeacknowledgments{
   \if@acks
      \ColumnSaveHeading{\@makeacknowledgmentsheading}
      \thispagestyle{empty}%

      \par\pagestyle{plain}
      \renewcommand\baselinestretch{\@spacing}\@normalsize
      \noindent \normalsize \normalfont \@acknowledgments
      \vfill
      \ColumnRestore
   \fi
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%			 NOMENCLATURE PAGE			       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@nomenc
\def\@nomenclature{}
\newcommand\nomenclature[1]{\@nomenctrue\def\@nomenclature{#1}}

\newcommand\@nomenclaturesheading{
  {
    \centering
   \thispagestyle{empty}%

    \ifx\@eslang\@empty
      \addcontentsline{toc}{chapter}{Nomenclatura}
      \chapter*{Nomenclatura}
    \else
      \addcontentsline{toc}{chapter}{Nomenclature}
      \chapter*{Nomenclature}
    \fi
    \vskip 12pt
  }
}


\newcommand\@makenomenclature{
   \if@nomenc
      \ColumnSaveHeading{\@nomenclaturesheading}
      \thispagestyle{empty}%

      \par\pagestyle{plain}
      \renewcommand\baselinestretch{\@spacing}\@normalsize
      \noindent \normalsize \normalfont \@nomenclature
      \vfill
      \ColumnRestore
   \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%			      VITA PAGE				       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This definition for the "\vitaitem" command allows for up to 26 vita
% items.  The use of "\normalfont" in each definition permits any macros that
% are sensitive to type style (and which might be disrupted by the mode
% set for the "tabular" processing) to work properly.

\newcounter{vitaitems}
\setcounter{vitaitems}{0}
\newcommand\@vitadate[1]{{\parbox[t]{1.25in}{\normalfont{#1}}}}
\newcommand\@vitatext[1]{{\parbox[t]{4.45in}{\normalfont{#1}}}}
\newcommand\vitaitem[2]{
   \ifcase\value{vitaitems}
      \def\@vitaA{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaB{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaC{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaD{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaE{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaF{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaG{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaH{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaI{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaJ{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaK{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaL{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaM{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaN{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaO{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaP{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaQ{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaR{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaS{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaT{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaU{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaV{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaW{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaX{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaY{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaZ{\@vitadate{#1} & \@vitatext{#2}}
   \else
      \typeout{Too many vita items.}
   \fi
   \addtocounter{vitaitems}{1}
}

% These definitions for the "\publication" and "\presentation" commands
% allow for up to 26 publications and/or presentations.  Note that UCLA
% requires publications and presentations to be combined into a single
% list with a single title; the "@pubs" and "@pres" flags are used to
% determine what the title will look like.

\newcounter{publications}
\setcounter{publications}{0}
\newif\if@pubs \newif\if@pres
\newcommand\publication[1]{
   \@pubstrue
   \ifcase\value{publications}
      \def\@pubA{#1} \or \def\@pubB{#1} \or \def\@pubC{#1} \or
      \def\@pubD{#1} \or \def\@pubE{#1} \or \def\@pubF{#1} \or
      \def\@pubG{#1} \or \def\@pubH{#1} \or \def\@pubI{#1} \or
      \def\@pubJ{#1} \or \def\@pubK{#1} \or \def\@pubL{#1} \or
      \def\@pubM{#1} \or \def\@pubN{#1} \or \def\@pubO{#1} \or
      \def\@pubP{#1} \or \def\@pubQ{#1} \or \def\@pubR{#1} \or
      \def\@pubS{#1} \or \def\@pubT{#1} \or \def\@pubU{#1} \or
      \def\@pubV{#1} \or \def\@pubW{#1} \or \def\@pubX{#1} \or
      \def\@pubY{#1} \or \def\@pubZ{#1}
   \else
      \typeout{Too many publications/presentations.}
   \fi
   \addtocounter{publications}{1}
}
\newcommand\presentation[1]{
   \@prestrue
   \ifcase\value{publications}
      \def\@pubA{#1} \or \def\@pubB{#1} \or \def\@pubC{#1} \or
      \def\@pubD{#1} \or \def\@pubE{#1} \or \def\@pubF{#1} \or
      \def\@pubG{#1} \or \def\@pubH{#1} \or \def\@pubI{#1} \or
      \def\@pubJ{#1} \or \def\@pubK{#1} \or \def\@pubL{#1} \or
      \def\@pubM{#1} \or \def\@pubN{#1} \or \def\@pubO{#1} \or
      \def\@pubP{#1} \or \def\@pubQ{#1} \or \def\@pubR{#1} \or
      \def\@pubS{#1} \or \def\@pubT{#1} \or \def\@pubU{#1} \or
      \def\@pubV{#1} \or \def\@pubW{#1} \or \def\@pubX{#1} \or
      \def\@pubY{#1} \or \def\@pubZ{#1}
   \else
      \typeout{Too many publications/presentations.}
   \fi
   \addtocounter{publications}{1}
}

\newcommand\@printvitaitem[1]{
   \noindent
   \begin {tabular} {@{}p{1.25in}@{}p{4.45in}@{}}
      #1
   \end {tabular}
}

\newcommand\@printpubitem[1]{\par \noindent #1}

\newcommand\@makevitapage{
   % Save the old stretch.
   \let\OldArrayStretch=\arraystretch
   \renewcommand\arraystretch{1.67}
   \ifnum\c@vitaitems>0
      \ColumnSave
      \par\pagestyle{plain}
      \renewcommand\baselinestretch{\@spacing}\@normalsize
      \addcontentsline{toc}{chapter}{Vita}
      \chapter*{Vita} 
      \vskip 12pt
      \ifnum\c@vitaitems>0  \@printvitaitem{\@vitaA} \fi
      \ifnum\c@vitaitems>1  \@printvitaitem{\@vitaB} \fi
      \ifnum\c@vitaitems>2  \@printvitaitem{\@vitaC} \fi
      \ifnum\c@vitaitems>3  \@printvitaitem{\@vitaD} \fi
      \ifnum\c@vitaitems>4  \@printvitaitem{\@vitaE} \fi
      \ifnum\c@vitaitems>5  \@printvitaitem{\@vitaF} \fi
      \ifnum\c@vitaitems>6  \@printvitaitem{\@vitaG} \fi
      \ifnum\c@vitaitems>7  \@printvitaitem{\@vitaH} \fi
      \ifnum\c@vitaitems>8  \@printvitaitem{\@vitaI} \fi
      \ifnum\c@vitaitems>9  \@printvitaitem{\@vitaJ} \fi
      \ifnum\c@vitaitems>10 \@printvitaitem{\@vitaK} \fi
      \ifnum\c@vitaitems>11 \@printvitaitem{\@vitaL} \fi
      \ifnum\c@vitaitems>12 \@printvitaitem{\@vitaM} \fi
      \ifnum\c@vitaitems>13 \@printvitaitem{\@vitaN} \fi
      \ifnum\c@vitaitems>14 \@printvitaitem{\@vitaO} \fi
      \ifnum\c@vitaitems>15 \@printvitaitem{\@vitaP} \fi
      \ifnum\c@vitaitems>16 \@printvitaitem{\@vitaQ} \fi
      \ifnum\c@vitaitems>17 \@printvitaitem{\@vitaR} \fi
      \ifnum\c@vitaitems>18 \@printvitaitem{\@vitaS} \fi
      \ifnum\c@vitaitems>19 \@printvitaitem{\@vitaT} \fi
      \ifnum\c@vitaitems>20 \@printvitaitem{\@vitaU} \fi
      \ifnum\c@vitaitems>21 \@printvitaitem{\@vitaV} \fi
      \ifnum\c@vitaitems>22 \@printvitaitem{\@vitaW} \fi
      \ifnum\c@vitaitems>23 \@printvitaitem{\@vitaX} \fi
      \ifnum\c@vitaitems>24 \@printvitaitem{\@vitaY} \fi
      \ifnum\c@vitaitems>25 \@printvitaitem{\@vitaZ} \fi
      \fi
      \ifnum\c@publications>0{
         \ifx\@spacing\@doublespacing\parskip 24pt plus 4pt
	 \else                       \parskip 12pt plus 2pt
	 \fi
	 \vskip 36pt
            \ifx\@eslang\@empty
	      \if@pubs
	         \if@pres \addcontentsline{toc}{chapter}{Publicaciones y Presentaciones}
	         \else    \addcontentsline{toc}{chapter}{Publicaciones}
  	         \fi
	      \else       \addcontentsline{toc}{chapter}{Presentaciones}
              \fi
            \else
	      \if@pubs
	         \if@pres \addcontentsline{toc}{chapter}{Publications and Presentations}
	         \else    \addcontentsline{toc}{chapter}{Publications}
  	         \fi
	      \else       \addcontentsline{toc}{chapter}{Presentations}
	      \fi
            \fi

         \chapter*{
            \ifx\@eslang\@empty
	      \if@pubs
	         \if@pres Publicaciones y Presentaciones
	         \else    Publicaciones
  	         \fi
	      \else       Presentaciones
              \fi
            \else
	      \if@pubs
	         \if@pres Publications and Presentations
	         \else    Publications
  	         \fi
	      \else       Presentations
	      \fi
            \fi
          }
	 \nobreak \vskip 12pt
         \ifnum\c@publications>0  \@printpubitem{\@pubA} \fi
         \ifnum\c@publications>1  \@printpubitem{\@pubB} \fi
         \ifnum\c@publications>2  \@printpubitem{\@pubC} \fi
         \ifnum\c@publications>3  \@printpubitem{\@pubD} \fi
         \ifnum\c@publications>4  \@printpubitem{\@pubE} \fi
         \ifnum\c@publications>5  \@printpubitem{\@pubF} \fi
         \ifnum\c@publications>6  \@printpubitem{\@pubG} \fi
         \ifnum\c@publications>7  \@printpubitem{\@pubH} \fi
         \ifnum\c@publications>8  \@printpubitem{\@pubI} \fi
         \ifnum\c@publications>9  \@printpubitem{\@pubJ} \fi
         \ifnum\c@publications>10 \@printpubitem{\@pubK} \fi
         \ifnum\c@publications>11 \@printpubitem{\@pubL} \fi
         \ifnum\c@publications>12 \@printpubitem{\@pubM} \fi
         \ifnum\c@publications>13 \@printpubitem{\@pubN} \fi
         \ifnum\c@publications>14 \@printpubitem{\@pubO} \fi
         \ifnum\c@publications>15 \@printpubitem{\@pubP} \fi
         \ifnum\c@publications>16 \@printpubitem{\@pubQ} \fi
         \ifnum\c@publications>17 \@printpubitem{\@pubR} \fi
         \ifnum\c@publications>18 \@printpubitem{\@pubS} \fi
         \ifnum\c@publications>19 \@printpubitem{\@pubT} \fi
         \ifnum\c@publications>20 \@printpubitem{\@pubU} \fi
         \ifnum\c@publications>21 \@printpubitem{\@pubV} \fi
         \ifnum\c@publications>22 \@printpubitem{\@pubW} \fi
         \ifnum\c@publications>23 \@printpubitem{\@pubX} \fi
         \ifnum\c@publications>24 \@printpubitem{\@pubY} \fi
         \ifnum\c@publications>25 \@printpubitem{\@pubZ} \fi
      }
      \ColumnRestore
   \fi
   \renewcommand\arraystretch{\OldArrayStretch}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%			    ABSTRACT PAGE			       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@abstract
\def\@abstract{}
\newcommand\abstract[1]{\@abstracttrue\def\@abstract{#1}}

%
% one argument: the baselinestretch
% The RFTADP requires doublespacing, but in techreports
% you may wish something less.
%
\newcommand{\@makeabstractpage}[1]{
   \if@abstract
      \ColumnSave
      \par\pagestyle{plain}
      \phantomsection   
      \addcontentsline{toc}{chapter}{Resumen}
      \chapter*{Prefacio}
      % \begin{center}
      %    {\large \sffamily\bfseries \@titlesize \@title}\\[12pt]
      %    \normalsize \normalfont por\\[12pt]
      %    {\sffamily\bfseries \large \@author} \\
      %    \normalsize \normalfont
      %    \@degreename\if@department\ del \@department \fi\\
      %    Centro de Investigaci\'{o}n y de Estudios Avanzados del Instituto Polit\'{e}cnico Nacional, \@degreeyear \\
      % \end{center}
      \ifx\@spacing\@doublespacing\vskip 12pt\else\vskip 24pt\fi
      \renewcommand\baselinestretch{#1}\@normalsize
      %
      % Set up spacing.
      % If it's single spacing, indent the margins.
      % If double spacing is required than things are already
      % ugly enough (and we loose enough space) that we may
      % as well use the whole \textwidth.
      %
      \ifthenelse{\equal{#1}{\@stdsinglespacing}}{
	\begin{center}
	\begin{minipage}{4.75in}
	\setlength{\parindent}{1.5em}
	\@abstract
        \end{minipage}
	\end{center}
      }{
	\@abstract
      }

      \renewcommand\baselinestretch{\@spacing}\@normalsize
      \ColumnRestore
  \else
      \typeout{Sin resumen.}
   \fi
}


\newif\if@abstracten
\def\@abstracten{}
\newcommand\abstracten[1]{\@abstractentrue\def\@abstracten{#1}}

\newcommand{\@makeabstractpageen}[1]{
   \if@abstracten
      \ColumnSave
      \par\pagestyle{plain}
      \phantomsection   
      \addcontentsline{toc}{chapter}{Abstract}
      \chapter*{Preface}
%       \begin{center}
% %         \textsc{\large Abstract of the \@Thesisname}\\[12pt]
%          {\large \sffamily\bfseries \@titlesize \@titleen}\\[12pt]
%          \normalsize \normalfont by\\[12pt]
%          {\sffamily\bfseries \large \@author} \\

%          \normalsize \normalfont
%          % si fuera departamento seria in
% 	 \@degreenameen\if@department\ from the \@departmenten \fi\\ 
%          Research Center for Advanced Study from the   National Polytechnic Institute, \@degreeyear \\
%       \end{center}
      \ifx\@spacing\@doublespacing\vskip 12pt\else\vskip 24pt\fi
      \renewcommand\baselinestretch{#1}\@normalsize
      %
      % Set up spacing.
      % If it's single spacing, indent the margins.
      % If double spacing is required than things are already
      % ugly enough (and we loose enough space) that we may
      % as well use the whole \textwidth.
      %
      \ifthenelse{\equal{#1}{\@stdsinglespacing}}{
	\begin{center}
	\begin{minipage}{4.75in}
	\setlength{\parindent}{1.5em}
	\@abstracten
        \end{minipage}
	\end{center}
      }{
	\@abstracten
      }

      \renewcommand\baselinestretch{\@spacing}\@normalsize
      \ColumnRestore
  \else
      \typeout{No abstract.}
   \fi
}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%		      PRINT ALL PRELIMINARY PAGES		       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\makeintropagesnorm{


  \ifx\@eslang\@empty
    \@maketitlepageen
  \else
    \@maketitlepageen
    \if@twoside
      \typeout{Two-side detected.}    
      \pagebreak   % the back side of the title page
    \fi
  \if@openright\cleardoublepage\else\clearpage\fi
%  \@maketitlepageen
  \fi

  % If we're printing two sided,
  % insert a blank page for the back of the title page.
  % NOTE:  This extra page makes the output non-conforming
  % to the RFTADP, unless you throw it away.
  \if@twoside
    \typeout{Two-side detected.}    
    \pagebreak   % the back side of the title page
  \fi
  \if@openright\cleardoublepage\else\clearpage\fi
  \@makecopyrightpage
  \if@openright\cleardoublepage\else\clearpage\fi
%  \@makeacknowledgmenttoprojectpage
%  \if@openright\cleardoublepage\else\clearpage\fi

%  \if@openright\cleardoublepage\else\clearpage\fi
%  \@makededication
%  \if@openright\cleardoublepage\else\clearpage\fi
%  \@makeacknowledgments

  \if@openright\cleardoublepage\else\clearpage\fi
   \ifx\@eslang\@empty
  \addcontentsline{toc}{chapter}{\'Indice General
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}
       \else
  \addcontentsline{toc}{chapter}{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}
\fi
       \pagenumbering{roman}
   \tableofcontents
%  \if@openright\cleardoublepage\else\clearpage\fi
%   \ifx\@eslang\@empty
%  \addcontentsline{toc}{chapter}{\'Indice de Figuras}
%  \else
%  \addcontentsline{toc}{chapter}{\listfigurename}
%  \fi
% \addcontentsline{toc}{chapter}{\MakeUppercase\listfigurename}
%  \listoffigures
%  \if@openright\cleardoublepage\else\clearpage\fi
%  \ifx\@eslang\@empty
%  \addcontentsline{toc}{chapter}{\'Indice de Tablas}
%  \else
%  \addcontentsline{toc}{chapter}{\listtablename}
%  \fi
%  \addcontentsline{toc}{chapter}{\listtablename}
%  \listoftables
%  \if@openright\cleardoublepage\else\clearpage\fi
%  \ifx\@eslang\@empty
%  \addcontentsline{toc}{chapter}{\'Indice de Algoritmos}
%  \renewcommand{\listalgorithmname}{\'{I}ndice de Algoritmos}
%  \else
%  \addcontentsline{toc}{chapter}{List of Algorithms}
%  \fi
  
%  \listofalgorithms
  \if@openright\cleardoublepage\else\clearpage\fi
  \@makevitapage
%  \if@openright\cleardoublepage\else\clearpage\fi
%  \@makeabstractpage{\@doublespacing}
%  \if@openright\cleardoublepage\else\clearpage\fi
%  \@makeabstractpageen{\@doublespacing}
%  \if@openright\cleardoublepage\else\clearpage\fi
  \@makenomenclature
  \if@openright\cleardoublepage\else\clearpage\fi

  \redefinefancy
  \newpage \pagenumbering{arabic}
% \onehalfspacing
   \setstretch{1.544}
  %\doublespacing
  
}


\newcommand\makeintropagesdraft{
  \@makesimpletitlepage
  \@makecopyrightpage
  \if@openright\cleardoublepage\else\clearpage\fi
  \ifx\@eslang\@empty
  \addcontentsline{toc}{chapter}{\'Indice General
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}
       \pagenumbering{roman}
%  \addcontentsline{toc}{chapter}{\'Indice de Figuras}
  \else
  \addcontentsline{toc}{chapter}{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}
       \pagenumbering{roman}
%  \addcontentsline{toc}{chapter}{\listfigurename}
  \fi
   \tableofcontents
  \if@openright\cleardoublepage\else\clearpage\fi
  \ifx\@eslang\@empty
  \addcontentsline{toc}{chapter}{\'Indice de Figuras}
  \else
  \addcontentsline{toc}{chapter}{\listfigurename}
  \fi
%  \addcontentsline{toc}{chapter}{\MakeUppercase\listfigurename}
  \listoffigures
  \if@openright\cleardoublepage\else\clearpage\fi
  \ifx\@eslang\@empty
  \addcontentsline{toc}{chapter}{\'Indice de Tablas}
  \else
  \addcontentsline{toc}{chapter}{\listtablename}
  \fi
%  \addcontentsline{toc}{chapter}{\MakeUppercase\listtablename}
  \listoftables
  \if@openright\cleardoublepage\else\clearpage\fi
  \ifx\@eslang\@empty
  \addcontentsline{toc}{chapter}{\'Indice de Algoritmos}
  \renewcommand{\listalgorithmname}{\'{I}ndice de Algoritmos}
  \else
  \addcontentsline{toc}{chapter}{List of Algorithms}
  \fi
  \listofalgorithms
  \if@openright\cleardoublepage\else\clearpage\fi
  \@makeabstractpage{\@doublespacing}
  \if@openright\cleardoublepage\else\clearpage\fi
  \@makeabstractpageen{\@doublespacing}
  \if@openright\cleardoublepage\else\clearpage\fi
  \@makenomenclature
  \if@openright\cleardoublepage\else\clearpage\fi
  \redefinefancy
  \newpage \pagenumbering{arabic}
% \onehalfspacing
%cambio
% \setstretch{1.544}
 \setstretch{2.0}
 %\doublespacing
\DeclareFixedFont{\tenpt}{\encodingdefault}{\familydefault}{\seriesdefault}{\shapedefault}{10pt}
\tenpt
}

\newcommand\makeintropages{
  \ifx\@esfinal\@empty
  \makeintropagesnorm
  \else
  \makeintropagesdraft
  \fi
  \chapter{}
}


\ifx\@esfinal\@empty
\RequirePackage[left=2.5cm,top=2cm,right=2cm,bottom=2cm,includeheadfoot,letterpaper,textwidth=2in]{geometry}
\else
\RequirePackage[left=2.5cm,top=2cm,right=2cm,bottom=2cm,includeheadfoot,letterpaper,textwidth=2in]{geometry}
\fi



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%http://www-ra.phys.utas.edu.au/~jstevens/code_thesis_style.html
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%% This is file `phdthesis.sty`,
%%
%% This style file changes the appearance of the pages to improve
%% the aesthetics of PhD theses (in my opinion =)
%%
%% Copyright (C) 2007  Jamie Stevens
%%
%%
%%  This program is free software: you can redistribute it and/or modify
%%  it under the terms of the GNU General Public License as published by
%%  the Free Software Foundation, either version 3 of the License, or
%%  (at your option) any later version.
%%
%%  This program is distributed in the hope that it will be useful,
%%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%%  GNU General Public License for more details.
%%
%%  You should have received a copy of the GNU General Public License
%%  along with this program.  If not, see <http://www.gnu.org/licenses/>.
%%
%\NeedsTeXFormat{LaTeX2e}[1994/06/01]
%\ProvidesPackage{phdthesis}[2007/09/11 v1.0 PhD Thesis Style]

%% change the equation number appearance
%% load up the AMS math package
\RequirePackage{amsmath}


 \RequirePackage{fancyhdr}
 \RequirePackage[sf,sl,outermarks]{titlesec}
%% make the equation numbers have little ovals around them
%\def\tagform@#1{\maketag@@@{\cornersize{0.8}\ovalbox{\ignorespaces\sffamily{#1}\unskip\@@italiccorr}}}

%% Load up PS insertion package
\RequirePackage{psboxit}
\PScommands


\fancyfoot{}
\fancyhead{}
%% make the odd pages have the section name on the top right
%\fancyhead[RO]{\sffamily\bfseries \rightmark}
%% make the even pages have the chapter name on the top left
%\fancyhead[LE]{\sffamily\bfseries \leftmark}


\renewcommand{\footrulewidth}{0.0pt}
\renewcommand{\footruleskip}{0mm}
\pagestyle{fancy}

% \fancypagestyle{plain}{
%   \fancyhf{}
%   \fancyfoot[LE]{\psboxit{box 0.8 setgray fill}
%     {\framebox[10mm][c]{\rule{0cm}{4mm}\color{black}{\bfseries \thepage}}}}
%   \fancyfoot[RO]{\psboxit{box 1 setgray fill}
%     {\hspace{\textwidth}\psboxit{box 0.8 setgray fill}
%       {\framebox[10mm][c]{\rule{0cm}{4mm}\color{black}{\bfseries \thepage}}}}}
%   \renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{#1}}{}}
%   \renewcommand{\sectionmark}[1]{\markright{\MakeUppercase{#1}}{}}
%   \renewcommand{\headrulewidth}{0.0pt}
%   \renewcommand{\footrulewidth}{0.5pt}
% }
\fancypagestyle{plain}{
\fancyhf{}
\fancyfoot[LE]{\bfseries \thepage}
\fancyfoot[RO]{\hspace{\textwidth} \bfseries \thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.0pt}
}


\newcommand\redefinefancy{
%	\fancyhead[RO]{{\footnotesize\rightmark}\hspace{2em}\thepage}
%	\fancyhead[LE]{\thepage\hspace{2em}\footnotesize{\leftmark}}

%\fancyfoot[LE]{\bfseries \thepage}
%\fancyfoot[RO]{{\hspace{\textwidth}\bfseries \thepage}}
\fancyfoot[LE]{}
\fancyfoot[RO]{}
\fancyfoot[LE,RO]{}
\fancyfoot[LO]{}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0.0pt}
\fancyhead[RE]{\sffamily\bfseries \rightmark }
\fancyhead[LO]{\sffamily\bfseries \leftmark \@shorttitle}
\fancyhead[RO,LE]{\thepage}
%\fancyhead[RO]{\sffamily\bfseries \rightmark}
%\fancyhead[LE]{\sffamily\bfseries \leftmark}
%\fancyhead[RE,LO]{\thepage}
}
\newcommand\redefinefancya{
%	\fancyhead[RO]{{\footnotesize\rightmark}\hspace{2em}\thepage}
%	\fancyhead[LE]{\thepage\hspace{2em}\footnotesize{\leftmark}}

%\fancyfoot[LE]{\bfseries \thepage}
%\fancyfoot[RO]{{\hspace{\textwidth}\bfseries \thepage}}
\fancyfoot[LE]{}
\fancyfoot[RO]{}
\fancyfoot[LE,RO]{}
\fancyfoot[LO]{}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0.0pt}
\fancyhead[RE]{\sffamily\bfseries \rightmark }
\fancyhead[LO]{\sffamily\bfseries \leftmark }
\fancyhead[RO,LE]{\thepage}
%\fancyhead[RO]{\sffamily\bfseries \rightmark}
%\fancyhead[LE]{\sffamily\bfseries \leftmark}
%\fancyhead[RE,LO]{\thepage}
}

\renewcommand{\chaptermark}[1]{\markboth{\thechapter \ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection. \ #1}{}}

\RequirePackage{graphicx}
\RequirePackage{type1cm}
\RequirePackage{eso-pic}
\RequirePackage{color}


%% this next section (till \makeatother) makes sure that blank pages
%% are actually completely blank, cause they're not usually
\makeatletter
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
	\hbox{}
	\vspace*{\fill}
	\thispagestyle{empty}
	\newpage
	\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\ifx\@esfinal\@empty
\else
\AddToShipoutPicture{%
            \setlength{\@tempdimb}{.5\paperwidth}%
            \setlength{\@tempdimc}{2.0cm}%
            \setlength{\unitlength}{1pt}%
            \put(\strip@pt\@tempdimb,\strip@pt\@tempdimc){%
        \makebox(0,0){\rotatebox{0}{\textcolor[gray]{0.75}%
        {\fontsize{1cm}{1cm}\selectfont{DRAFT}}}}%
            }%
}
\fi

\makeatother


%% now change the chapter style
%% load up the quotchap package

\RequirePackage[avantgarde]{quotchap}

%% make the quotation appear next to the chapter number
\renewcommand\chapterheadstartvskip{\vspace*{-3\baselineskip}}



\titleformat{\section}[hang]{\sffamily\bfseries}
{\Large\thesection}{12pt}{\Large}[{}]

\titleformat{\section}[block]
{\Large\sffamily\bfseries\filright}{{\thesection}}{1em}{}

\titleformat{\subsection}[block]
{\large\sffamily\bfseries\filright}{{\thesubsection}}{1em}{}



%%
%% End of file `phdthesis.sty`



\tolerance=10000
\pretolerance=10000


\setcounter{tocdepth}{4}
\setcounter{secnumdepth}{4}

\RequirePackage{ifpdf}

% \ifpdf
%    \pdfinfo { /Title  \@title)
%               /Creator (TeX)
%               /Producer (pdfTeX)
%               /Author (\@author)
% %              /CreationDate (D:20030101000000)  %format D:YYYYMMDDhhmmss
% %              /ModDate (D:20030815213532)
%               /Subject (\@title)
%               /Keywords (PhD, Thesis)}
%    \pdfcatalog { /PageMode (/UseOutlines)
%                  /OpenAction (fitbh)  }
% \fi



%\bibliographystyle{apalike}

\endinput
%%
%% End of file `cinvestav.cls'.


