% A class for Universität Heidelberg Dr. rer. nat. thesis
%
% Author: Jeongbin Park
% Description: A thesis template according to the rules of the Combined Faculty of Natural Sciences and Mathematics.

\ProvidesClass{hdbiothesis}[23/09/2019 Heidelberg University Dr. rer. nat. Thesis class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions \relax

\LoadClass{book}

\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}
\RequirePackage{pgffor}
\RequirePackage{etoolbox}
\RequirePackage{stfloats}
\RequirePackage{cite}
\RequirePackage{caption}
\RequirePackage{multirow}
\RequirePackage{adjustbox}
\RequirePackage{longtable}
\RequirePackage{emptypage}

\setlength\LTleft{0pt}
\setlength\LTright{0pt}

\RequirePackage{fancyhdr}
\setlength{\headheight}{\baselineskip}
\renewcommand{\sectionmark}[1]{\markright{#1}}

\fancypagestyle{firstpage}{%
\fancyhf{} % clear all six fields
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{firstcoverpage}{%
\fancyhf{} % clear all six fields
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{followingpage}{%
\fancyhf{} % clear all six fields
\fancyhead[LE,RO]{\textbf{\thepage}}
\fancyhead[LO,RE]{\nouppercase{\rightmark}}
\renewcommand{\headrulewidth}{0.7pt}
\renewcommand{\footrulewidth}{0pt}
}
\pagestyle{followingpage}

\linespread{1.3}

\makeatletter

\def\@referees{}
\newcommand{\setreferees}[1]{\def\@referees{#1}}
\def\@examdate{}
\newcommand{\examdate}[1]{\def\@examdate{#1}}
\def\@bornin{}
\newcommand{\bornin}[1]{\def\@bornin{#1}}
\newcommand{\insertcopyrightnotice}{
    \thispagestyle{firstpage}
    \null\vfill
    \doclicenseThis
    \newpage
}

\renewcommand\maketitle{
    \def\@refereestable{Referees: }
    \foreach \@i in \@referees {
        \protected@xappto\@refereestable{\null & \@i \\}
    }
    \begin{titlepage}
    {
        \linespread{1.6}
        \fontsize{15}{18}\selectfont{}
        \thispagestyle{firstpage}
        \null\vfil
        \noindent\makebox[\textwidth][c]{
            \begin{minipage}[t][10cm][t]{\textwidth}
                \begin{center}
                    {Dissertation\\*submitted to the\\*
                    Combined Faculty of Natural Sciences and Mathematics\\*
                    of the Ruperto Carola University Heidelberg, Germany\\*
                    for the degree of\\*Doctor of Natural Sciences\par}
                \end{center}
            \end{minipage}
        }
        \null\vfill
        \begin{center}
            {Presented by\\*\@author\par\vskip 1.6em}
            \begin{tabular}{ l l }
                born in: & \@bornin \\
                Oral examination: & \@examdate
            \end{tabular}
        \end{center}
        \if@twoside
            \newpage\null
            \thispagestyle{firstpage}
        \fi
        \newpage
        \thispagestyle{firstpage}
        \noindent\makebox[\textwidth][c]{
            \begin{minipage}[t][10cm][c]{\textwidth}
                \begin{center}\@title\end{center}
            \end{minipage}
        }
        \null\vfill
        \begin{center}
            \begin{tabular}{ l l }
            \@refereestable
            \end{tabular}
        \end{center}
        \if@twoside
            \newpage\null
            \thispagestyle{firstpage}
        \fi
    }
    \end{titlepage}%
    \setcounter{footnote}{0}%
}
\makeatother

\newenvironment{coverpage}[1]
{
    \cleardoublepage
    \thispagestyle{firstcoverpage}
    \renewcommand{\sectionmark}[1]{\markright{#1}{}}
    \chaptermark{#1}\sectionmark{#1}
    \null\vskip 50pt
    \begin{center}
    \section*{#1}
    \addcontentsline{toc}{chapter}{#1}
    \null\vskip 20pt
    \end{center}
}{
    \newpage
}

% https://tex.stackexchange.com/questions/95838/how-to-write-a-perfect-equation-parameters-description
\RequirePackage{amsmath}
\RequirePackage{array}
\newenvironment{conditions}
  {\par\vspace{\abovedisplayskip}\noindent\begin{tabular}{>{$}l<{$} @{${}:{}$} l}}
  {\end{tabular}\par\vspace{\belowdisplayskip}\vspace{\baselineskip}}