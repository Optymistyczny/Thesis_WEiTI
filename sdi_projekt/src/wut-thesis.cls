% +---------------+--------------------+--------------------+--------------------+
% | Nazwa         | Rozmiar dla 10pt  | Rozmiar dla 11pt   | Rozmiar dla 12pt   |
% +---------------+--------------------+--------------------+--------------------+
% | \tiny         | 5pt               | 6pt                | 6pt                |
% | \scriptsize   | 7pt               | 8pt                | 8pt                |
% | \footnotesize | 8pt               | 9pt                | 10pt               |
% | \small        | 9pt               | 10pt               | 10.95pt            |
% | \normalsize   | 10pt              | 10.95pt            | 12pt               |
% | \large        | 12pt              | 12pt               | 14.4pt             |
% | \Large        | 14.4pt            | 14.4pt             | 17.28pt            |
% | \LARGE        | 17.28pt           | 17.28pt            | 20.74pt            |
% | \huge         | 20.74pt           | 20.74pt            | 24.88pt            |
% | \Huge         | 24.88pt           | 24.88pt            | 29.86pt            |
% +---------------+--------------------+--------------------+--------------------+

%----------------------------
% Document class parameters
%----------------------------
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=wut/wut-thesis.cls,
    prefix=wut
}
\DeclareStringOption[5mm]{bindingoffset} %variable
\DeclareStringOption[4mm]{footnoteindent}%variable
\DeclareStringOption[11pt]{fontsize}     %variable
\DeclareBoolOption[true]{hyphenation}    %variable
\ProcessKeyvalOptions*


\ProvidesClass{src/wut-thesis}
\LoadClass[
    \wutfontsize,
    twoside,
    % draft, % podświetlenie miejsc, w których tekst wychodzi poza margines
]{mwart}


% Hyphenation
\ifwuthyphenation
\else
    \tolerance=1
    \emergencystretch=\maxdimen
    \hyphenpenalty=10000
    \hbadness=10000
\fi
% Required by caption package
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@1.2\hsize{\hfil\box\@tempboxa\hfil} % szerokość podpisów w odniesieniu do szerokości tekstu strony
  \fi
  \vskip\belowcaptionskip}

%---------------------
% Basic dependencies
%---------------------
\RequirePackage{amsmath}       % Basic mathematical typesetting
\RequirePackage{amssymb}       % Advanced math symbols
\RequirePackage{amsthm}        % Theorems typesetting
\RequirePackage{array}         % Advanced table column formats
\RequirePackage{enumitem}      % Itemize/enumerate
\RequirePackage{fancyhdr}      % Custom header/footer styles
\RequirePackage{fourier}       % Adobe Utopia font
\RequirePackage{graphicx}      % Enhanced images support
% \RequirePackage{ifluatex}      % LuaTeX-specific options
\RequirePackage{kantlipsum}    % English kantian-style lipsum
\RequirePackage{lipsum}        % Lorem ipsum
\RequirePackage{listings}      % Code listings
\RequirePackage{longtable}     % Multi-page tables
\RequirePackage{multirow}      % Advanced table cells
\RequirePackage{setspace}      % Set space between lines
\RequirePackage{scrextend}     % Allows \addmargin environment
\RequirePackage{tablefootnote} % Table footnotes
\RequirePackage{tocloft}       % Custom ToC/LoF/LoT
\RequirePackage{url}           % URL-sensitive line breaks
\RequirePackage{xspace}        % Remove duplicated spaces
\RequirePackage{layout}
\RequirePackage{booktabs}
\RequirePackage{etoolbox}
\RequirePackage{subcaption} % do podwójnych tabel

\RequirePackage{float}
% \usepackage{etoolbox} % Pakiet do modyfikacji zachowania poleceń
%----------------------------
% Parametrized dependencies
%----------------------------
\RequirePackage % do podkreślania tekstu - użyte w tabeli
[
    normalem
]{ulem}
% Bibliography in biber
\RequirePackage[
    backend=biber,
    datamodel=thesis,
    style=numeric,
    giveninits=true
]{biblatex}
\input{biblatex-config.tex}
% Custom figure and table captions
\RequirePackage[
    font=small,
    labelfont=bf,
    labelsep=period
]{caption}
\AtBeginEnvironment{tabular}{\fontsize{9}{11.5}\selectfont}
\AtBeginEnvironment{longtable}{\fontsize{9}{11.5}\selectfont}


% Custom footnote typesetting
\RequirePackage[
    hang
]{footmisc}
\setlength{\footnotemargin}{\wutfootnoteindent}

% A4 paper and margins
\RequirePackage[
    a4paper,
    left=30mm,
    right=20mm,
    top=25mm,
    bottom=25mm,
    bindingoffset=\wutbindingoffset
]{geometry}

% Clickable hyperlinks
\RequirePackage[
    % bookmarksnumbered=true,
    % bookmarksopenlevel=3,
]
{hyperref}
\hypersetup{
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=black
}
% Advanced interword spacing
\RequirePackage[
    protrusion=true,
    expansion=true,
    letterspace=400 % wzięte ze strony tytułowej
]{microtype}

%----------------------
% Basic configuration
%----------------------
\setlength{\parindent}{5mm} % Wcięcie akapitowe
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}
\setlength{\textfloatsep}{10pt}  % Odstęp między floatem na górze lub dole strony a tekstem.
\setlength{\floatsep}{10pt}      % Odstęp między dwoma floatami w pionie.
\setlength{\intextsep}{10pt}     % Odstęp między floatem wstawionym w tekście (np. [h]) a tekstem.

% Section header formatting -- tu chyba jest też zmieniana czcionka, w razie czego można spróbować tylko z:
% \usepackage{titlesec}
% \titlespacing*{\section}{0pt}{10pt}{10pt}  % {nagłówek}{lewy margines}{odstęp przed}{odstęp po}
% \titlespacing*{\subsection}{0pt}{8pt}{8pt}
% \titlespacing*{\subsubsection}{0pt}{6pt}{6pt}
\SetSectionFormatting{section}{0.5cm}{\FormatHangHeading{\Large}}{0.5cm} % odstęp między nagłówkiem sekcji a tekstem
\SetSectionFormatting{subsection}{0.4cm}{\FormatHangHeading{\large}}{0.4cm} % odstęp między nagłówkiem podsekcji a tekstem
\SetSectionFormatting{subsubsection}{0.3cm}{\FormatHangHeading{\normalsize}}{0.3cm} % odstęp między nagłówkiem podpodsekcji a tekstem

\let\oldsection\section
\renewcommand{\section}{
	\thispagestyle{plain}
	\oldsection
}
\renewcommand{\lstlistingname}{Kod źródłowy}
%------------------
% Header & footer
%------------------
\fancypagestyle{plain}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\fancyfoot[LE,RO]{\thepage}
}
\fancypagestyle{headings}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt} %to z 1 pt na 0 pt
	\fancyfoot[LE,RO]{\thepage} %to ok
}
% Section number in header
\renewcommand{\sectionmark}[1]{
	\markboth{#1}{#1}
}

%---------------------
% Wybór języka pracy
%---------------------
\newcommand{\@lang}{pl}
\usepackage[polish]{babel}
\usepackage{csquotes}

\newtheorem{theorem}{Twierdzenie}
\newtheorem{lemma}{Lemat}
\newtheorem{corollary}{Wniosek}
\newtheorem{definition}{Definicja}
\newtheorem{axiom}{Aksjomat}
\newtheorem{assumption}{Założenie}

\AtBeginDocument{
    \renewcommand{\listfigurename}{Spis rysunków}
    \renewcommand{\listtablename}{Spis tabel}
    \renewcommand{\tablename}{Tabela}
    \usepackage{strona_tytulowa_pliki/FrontPage}
    % Zmniejszenie marginesów dla podpisów
    \captionsetup{
        width=0.9\textwidth, % Większa szerokość podpisu
        font=small, % Zmniejszony rozmiar czcionki
        % justification=centering% – wyrównanie do środka (domyślne)
        % justification=justified% – pełne wyrównanie do obu stron
        % justification=raggedleft% – wyrównanie do prawej strony
        % justification=raggedright% – wyrównanie do lewej strony
        justification=justified, % Justowanie do lewej
        format=hang, % Formatowanie z wiszącym wcięciem
        indention=-30pt % Ujemne wcięcie pierwszego wiersza
    }
    \makeatletter
    \renewcommand{\part}[2]{%
    \cleardoublepage
    \phantomsection % Ustawienie punktu odniesienia dla linku
    \addcontentsline{toc}{part}{Część #2.\hspace{5pt}#1}
    \thispagestyle{empty} % Pusta strona bez numeru
    \vspace*{\fill} % Wyrównanie do środka strony (góra-dół)
    {\centering\Huge\bfseries #1\par} % Wyśrodkowanie nazwy części
    \vspace*{\fill} % Wypełnienie reszty strony poniżej tytułu
    \newpage % Przejście do nowej strony
}
\makeatother
}

\newcommand{\@faculty}{eiti} % potrzebne do licencji i innych

\newcommand{\engtitle}[1]{
    \newcommand{\@engtitle}{#1}
}
\newcommand{\poltitle}[1]{
    \newcommand{\@poltitle}{#1}
}

%-------------------------
% Streszczenie po polsku
%-------------------------
\newenvironment{pl_abstract}{
    \thispagestyle{plain} % Styl strony
    \par % Rozpocznij paragraf
    \fontsize{12}{13.8}\selectfont % Ustaw czcionkę
    \vspace*{1cm} % Odstęp pod tytułem dokumentu
    \begin{center}
        \textbf{\Large\@poltitle} % Wycentrowany pogrubiony tytuł dokumentu
    \end{center}
    \vspace*{4cm} % Odstęp pod tytułem dokumentu
    \begin{center}
        \noindent\textbf{\large Abstrakt\xspace}
    \end{center}
    % \vspace{0.5cm} % Dodatkowy odstęp pod "Streszczenie"
    \par\noindent\ignorespaces
}{
    % \par % Zakończenie paragrafu
    % \vspace*{\fill} % Przestrzeń po abstrakcie
    \ignorespacesafterend % Usuń odstępy po środowisku
}
\newenvironment{slowa_klucze}{
    % \par % Rozpoczyna nowy akapit
    \fontsize{12}{13.8}\selectfont % Lokalna zmiana czcionki
    \thispagestyle{plain} % Styl strony
    \vspace{0.5cm} % Odstęp
    \noindent \textbf{Słowa kluczowe:\xspace} 
    \ignorespaces % Ignoruje białe znaki przed treścią środowiska
}{
    \par % Kończy akapit
    \unskip % Usuwa białe znaki na końcu
}
%----------------------------
% Streszczenie po angielsku
%----------------------------
\newenvironment{eng_abstract}{
    \thispagestyle{plain} % Styl strony
    \par % Rozpocznij paragraf
    \fontsize{12}{13.8}\selectfont % Ustaw czcionkę
    \vspace*{1cm} % Odstęp pod tytułem dokumentu
    \begin{center}
        \textbf{\Large\@engtitle} % Wycentrowany pogrubiony tytuł dokumentu
    \end{center}
    \vspace*{4cm} % Odstęp pod tytułem dokumentu
    \begin{center}
        \noindent\textbf{\large Abstract\xspace}
    \end{center}
    % \vspace{0.5cm} % Dodatkowy odstęp pod "Streszczenie"
    \par\noindent\ignorespaces
}{
    % \par % Zakończenie paragrafu
    % \vspace*{\fill} % Przestrzeń po abstrakcie
    \ignorespacesafterend % Usuń odstępy po środowisku
}
\newenvironment{second_keywords}{
    \par % Rozpoczyna nowy akapit
    \fontsize{12}{13.8}\selectfont % Lokalna zmiana czcionki
    \thispagestyle{plain} % Styl strony
    \vspace{0.5cm} % Odstęp
    \noindent \textbf{Keywords:\xspace} 
    \ignorespaces % Ignoruje białe znaki przed treścią środowiska
}{
    \par % Kończy akapit
    \unskip % Usuwa białe znaki na końcu
}

%----------------------------
% Oświadczenie o autorstwie
%----------------------------
\newcommand{\makeauthorship}{
    \thispagestyle{plain}
    \begin{figure}[ht]
        \vspace{-55pt}
        \noindent\makebox[\textwidth]{
        \includegraphics[width=1.19\textwidth]{src/\@lang/authorship/\@faculty.pdf}
        }
    \end{figure}
}

%----------------------------
% Oświadczenie o licencji
%----------------------------
\newcommand{\makelicense}{
    \thispagestyle{plain}
    \begin{figure}[ht]
        \vspace{-55pt}
        \noindent\makebox[\textwidth]{
        \includegraphics[width=1.19\textwidth]{src/\@lang/license/\@faculty.pdf}
        }
    \end{figure}
}

%--------------------------
% "Zagnieżdżenie" w pracy
%--------------------------
% part
% chapter
% % section
% % % subsetion

\usepackage{tocloft}
%--------------------------
% Table of Contents setup
%--------------------------
\setlength{\cftbeforesecskip}{2pt}
\renewcommand{\cftsecfont}{\bf\normalsize}
\renewcommand{\cftsecpagefont}{\normalfont}
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftsecdotsep}{\cftdotsep}
\setlength{\cftpartnumwidth}{3em} % Opcjonalne dostosowanie szerokości numeracji
\setlength{\cftsecnumwidth}{2em}    % Szerokość miejsca na numer sekcji
\setlength{\cftsubsecnumwidth}{2.5em} % Szerokość miejsca na numer podsekcji
\setlength{\cftsubsubsecnumwidth}{3.5em} % Szerokość miejsca na numer podpodsekcji

%------------------------
% List of Figures setup
%------------------------
% \renewcommand*\l@figure{\@dottedtocline{1}{0.5em}{2.25em}} % powoduje zignorowanie innych ustawień wyświetlania, w tym kropki w spisie.
\newcommand{\listoffigurestoc}{
    \listoffigures
    \addcontentsline{toc}{section}{\listfigurename}
}
\renewcommand{\cftfigaftersnum}{.} % Kropka po numerze
\setlength{\cftfignumwidth}{1.5em} 

%-----------------------
% List of Tables setup
%-----------------------
% \renewcommand*\l@table{\@dottedtocline{1}{0.5em}{2.25em}} % powoduje zignorowanie innych ustawień wyświetlania, w tym kropki w spisie.
\newcommand{\listoftablestoc}{
    \listoftables
    \addcontentsline{toc}{section}{\listtablename}
}
\renewcommand{\cfttabaftersnum}{.} % Kropka po numerze
\setlength{\cfttabnumwidth}{1.5em} 

%--------------------------
% Skrót (akronim) - makro
%--------------------------
\newcommand{\acronymlist}{
    \section*{Wykaz symboli i skrótów}
}
\newcommand{\acronym}[2]{
    \par\noindent\hspace{0.4em}
    {\textbf{#1} -- #2}
}

%-------------------
% Spis załączników
%-------------------
\newcommand{\nocontentsline}[3]{}

\newcommand{\tocless}[2]{%
    \bgroup\let\addcontentsline=\nocontentsline#1{#2}\egroup
}

\newcommand{\@appendixtitle}{
        Załącznik
}

% \let\standardappendix\appendix
% \renewcommand\appendix[1]{
%     \refstepcounter{section}
%     \tocless{\section*}{\@appendixtitle~\arabic{section}.\hspace*{2.5em} #1}
%     \addcontentsline{app}{subsection}{\hspace*{0em}\arabic{section}.\hspace*{0.5em} #1}
% }
\let\standardappendix\appendix
\renewcommand\appendix[1]{
    \refstepcounter{section}
    \renewcommand\thesection{\Alph{section}} % Numeracja literowa
    \tocless{\section*}{\@appendixtitle~\thesection\hspace*{2.5em} #1}
    \addcontentsline{app}{subsection}{\hspace*{0em}\thesection.\hspace*{0.5em} #1}
}
\newcommand\listofappendicestoc{
    \section*{Spis załączników}\@starttoc{app}
    \standardappendix
    \renewcommand{\thesection}{\arabic{section}}
}
\setstretch{1.15}
% List formatting
% Odstępy między tekstem a listami, marginesami oraz czcionki
\setlist[itemize,1]{topsep=3pt,itemsep=1.5pt, parsep=2pt,label=\large$\bullet$, leftmargin=24pt}
\setlist[itemize,2]{topsep=3pt,itemsep=1pt, parsep=2pt,leftmargin=16pt}
\setlist[itemize,3]{topsep=3pt,itemsep=0.4pt, parsep=2pt,leftmargin=14pt}
\setlist[enumerate,1]{topsep=3pt,itemsep=1.5pt, parsep=2pt,leftmargin=24pt}
\setlist[enumerate,2]{topsep=3pt,itemsep=1pt, parsep=2pt,leftmargin=16pt}
\setlist[enumerate,3]{topsep=3pt,itemsep=0.4pt, parsep=2pt,leftmargin=14pt}
\setlist[description,1]{labelindent=12pt, topsep=3pt,itemsep=1.5pt, parsep=2pt}
% Section header formatting
\setlist[itemize]{before=\fontsize{11}{12.65}\selectfont}      % dla standardowych, krótkich list nie zmieniamy czcionki.
\setlist[enumerate]{before=\fontsize{11}{12.65}\selectfont}    % czcionkę zmieniamy ręcznie dla list długich
\setlist[description]{before=\fontsize{11}{12.65}\selectfont}