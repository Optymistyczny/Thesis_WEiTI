


% \AtBeginEnvironment{tabular}{\fontsize{9}{11.5}\selectfont}
% \AtBeginEnvironment{longtable}{\fontsize{9}{11.5}\selectfont}







% % Advanced interword spacing


% %----------------------
% % Basic configuration
% %----------------------
% 

% \let\oldsection\section
% \renewcommand{\section}{
% 	\thispagestyle{plain}
% 	\oldsection
% }
% 

% % Section number in header
% \renewcommand{\sectionmark}[1]{
% 	\markboth{#1}{#1}
% }

% %---------------------
% % Wybór języka pracy
% %---------------------
% \newcommand{\@lang}{pl}
% \usepackage[polish]{babel}
% \usepackage{csquotes}



% %--------------------------
% % "Zagnieżdżenie" w pracy
% %--------------------------
% % part
% % % section
% % % % subsetion

%--------------------------
% Table of Contents setup
%--------------------------


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

\let\standardappendix\appendix
\renewcommand\appendix[1]{
    \refstepcounter{section}
    \renewcommand\thesection{\Alph{section}} % Numeracja literowa
    \tocless{\section*}{\@appendixtitle~\thesection\hspace*{2.5em} #1}
    \addcontentsline{app}{subsection}{\hspace*{0em}\thesection.\hspace*{0.5em} #1}
}



