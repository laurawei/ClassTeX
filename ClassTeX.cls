\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ClassTeX}

\LoadClass{article}

\RequirePackage{fancyhdr}
\RequirePackage[usenames]{color}
\RequirePackage{alltt}
\RequirePackage[letterpaper,margin=1in]{geometry}
\RequirePackage{parskip}
\RequirePackage{xstring}
\RequirePackage{comment}
\RequirePackage{wrapfig}

%% Header %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\@maketitle{
	\setlength\parindent{0in}
	\addtolength\parskip{1ex}
	\setlength\fboxrule{.5mm}\setlength{\fboxsep}{1.2mm}
	\newlength\courseheader
	\setlength\courseheader\textwidth
	\addtolength\courseheader{-4mm}
	\parbox[t][0cm][t]{10cm}{\Huge
			\@classname}
	
	\begin{flushright}
	\parbox[t][1cm][t]{5cm}{
	Notes taken by: \@notetaker\ \\ 
	\@classnum, \@semester\ \\
	Lecture Date: \@lecdate}
	\end{flushright}

				 
	\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}
	\vspace{-15pt}
	\bigskip
}


%% Page setup %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\fancypagestyle{plain}{\fancyhead{}
	\renewcommand\headrulewidth{0pt}
	\renewcommand\footrulewidth{0.3pt}
	\rfoot{\scriptsize{\thepage/\pageref{LastPage}}}}

\newcommand\notetaker[1]{\gdef\@notetaker{#1}}
\newcommand\classname[1]{\gdef\@classname{#1}}
\newcommand\lecdate[1]{\gdef\@lecdate{#1}}
\newcommand\semester[1]{\gdef\@semester{#1}}
\newcommand\classnum[1]{\gdef\@classnum{#1}}

\newcommand\minornoteleft[2]{
	\begin{wrapfigure}{L}{0.35\textwidth}
		\framebox{\parbox[h][4cm][t]{5cm}{\normalsize \textbf{#1}\\#2}}
	\end{wrapfigure}}
		
\newcommand\minornoteright[2]{
	\begin{wrapfigure}{R}{0.35\textwidth}
		\framebox{\parbox[h][4cm][t]{5cm}{\normalsize \textbf{#1}\\#2}}
	\end{wrapfigure}}
		
\newcommand\importantnote[2]{
	\begin{center}
			\framebox{\parbox[h][3cm][t]{\textwidth}{\normalsize \textbf{#1}\\#2}}
	\end{center}}


%\gdef\@notetaker{\ClassError{AlgoPS}{No \noexpand\notetaker given}{You must specify your name using the command \noexpand\notetaker{your name}}}
\gdef\@classnum{\ClassError{TeXnote}{No \noexpand\classnum given. You must specify the number of the class (ex. CS 2XXX) using the command \noexpand\classnum{Class Number}}}
\gdef\@lecdate{\ClassError{TeXnote}{No \noexpand\lecdate given.  You must specify the date of this lecture using the command \noexpand\lecdate{lecture date}}}
\gdef\@semester{\ClassError{TeXnote}{No \noexpand \semester given.  You must specify the semester of this lecture (e.g. Spring 2014) using the command \noexpand\semester{Semester}}}
\gdef\@classname{\ClassError{TeXnote}{No \noexpand \classname given.  You must specify the name of this class (e.g. Intro to Quantom Bogosort) using the command \noexpand\classname{Class Name}}}
\pagestyle{fancy}
\fancyhf{}
\lhead{\small{CS 4820\ Spring 2016}}
\chead{\small{\@lecdate \ -- Lecture\ -- \@classname}}
\rhead{\small{\thepage/\pageref{LastPage}}}
\newlength{\oldleftmargini}


\AtEndDocument{\label{LastPage}}
%
% vim: syntax=tex
%
