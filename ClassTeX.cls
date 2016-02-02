\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{TeXnote}

\LoadClass{article}

\RequirePackage{fancyhdr}
\RequirePackage[usenames]{color}
\RequirePackage{alltt}
\RequirePackage[letterpaper,margin=1in]{geometry}
\RequirePackage{parskip}
\RequirePackage{xstring}
\RequirePackage{comment}
\RequirePackage{wrapfig}
\RequirePackage{fancybox}

%Header

\renewcommand\@maketitle{
	\begin{minipage}{.65\linewidth}
	{\Huge
			\@classname}
	\end{minipage}\begin{minipage}{.35\linewidth}
	\shadowbox{\parbox{5cm}{
	Notes taken by: \@notetaker\ \\ 
	\@classnum, \@semester\ \\
	Lecture Date: \@lecdate}}
	\end{minipage}
					 
	\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}
	\vspace{-15pt}
	\bigskip
}


%Setup

\fancypagestyle{plain}{\fancyhead{}
	\renewcommand\headrulewidth{0pt}
	\renewcommand\footrulewidth{0.3pt}
	\rfoot{\scriptsize{\thepage/\pageref{LastPage}}}}

\newcommand\notetaker[1]{\gdef\@notetaker{#1}}
\newcommand\classname[1]{\gdef\@classname{#1}}
\newcommand\lecdate[1]{\gdef\@lecdate{#1}}
\newcommand\semester[1]{\gdef\@semester{#1}}
\newcommand\classnum[1]{\gdef\@classnum{#1}}

%Commands for notes
\newcommand\minornoteleft[2]{
	\begin{wrapfigure}{L}{0.35\textwidth}
		\vspace{-0.5cm}
		\begin{minipage}{0.35\textwidth}
			\framebox{\parbox{5cm}{\normalsize \textbf{#1}\\#2}}
		\end{minipage}
		\vspace{-0.5cm}
	\end{wrapfigure}}
		
\newcommand\minornoteright[2]{
	\begin{wrapfigure}{R}{0.35\textwidth}
		\vspace{-0.5cm}
		\begin{minipage}{0.35\textwidth}
			\framebox{\parbox{5cm}{\normalsize \textbf{#1}\\#2}}
		\end{minipage}
			\vspace{-0.5cm}
	\end{wrapfigure}}
		
\newcommand\importantnote[2]{
	\vspace{1cm}
	\begin{center}
			\framebox{\parbox{\textwidth}{\normalsize \textbf{#1}\\#2}}
	\end{center}
	\vspace{1cm}}
	
	\newcommand\notepage[2]{
		\begin{wrapfigure}{L}{0.35\textwidth}
		\begin{minipage}{0.35\textwidth}
			\framebox{\parbox{5cm}{\normalsize \textbf{#1}\\#2}}
		\end{minipage}
		\end{wrapfigure}}


\gdef\@notetaker{\ClassError{AlgoPS}{No \noexpand\notetaker given. You must specify your name using the command \noexpand\notetaker{your name}}}
\gdef\@classnum{\ClassError{TeXnote}{No \noexpand\classnum given. You must specify the number of the class (ex. CS 2XXX) using the command \noexpand\classnum{Class Number}}}
\gdef\@lecdate{\ClassError{TeXnote}{No \noexpand\lecdate given.  You must specify the date of this lecture using the command \noexpand\lecdate{lecture date}}}
\gdef\@semester{\ClassError{TeXnote}{No \noexpand \semester given.  You must specify the semester of this lecture (e.g. Spring 2014) using the command \noexpand\semester{Semester}}}
\gdef\@classname{\ClassError{TeXnote}{No \noexpand \classname given.  You must specify the name of this class (e.g. Intro to Quantom Bogosort) using the command \noexpand\classname{Class Name}}}
\pagestyle{fancy}
\fancyhf{}
\lhead{\small{\@classnum}}
\chead{\small{\@classname \ -- \@lecdate}}
\rhead{\small{Lecture Notes}}
\newlength{\oldleftmargini}


\AtEndDocument{\label{LastPage}}

