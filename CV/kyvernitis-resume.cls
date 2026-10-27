% Class Identifier and Version
\ProvidesClass{kyvernitis-resume}[2023/06/06 Kyvernitis class]
\NeedsTeXFormat{LaTeX2e}

% Set font size and paper type
\LoadClass[11pt,letterpaper]{article}

% Enable custom and named colors
\RequirePackage[dvipsnames]{xcolor}

\RequirePackage{multicol}

% Remove paragraph indentation
\RequirePackage[parfill]{parskip}
\setlength{\parskip}{5pt plus 1pt}

% Set margin width
\RequirePackage[hmargin=1.25cm,vmargin=0.75cm]{geometry}

% Use cool fonts
\RequirePackage{fontspec}

% Using IBM Plex Sans
%\RequirePackage[sfdefault,light]{plex-sans}
\RequirePackage[sfdefault,light,semibold]{plex-sans}

% Use extended columns definitions
\RequirePackage{array}

% Make custom tables
\RequirePackage{tabularx}

% Use FontAwesome icons
\RequirePackage{fontawesome5}

% Adjust page width in the middle of the page
\RequirePackage{changepage}

% Adjust bullet size
\RequirePackage{scalerel}

% Keep section headings with their content (no orphaned headings)
\RequirePackage{needspace}

% Compact itemize spacing (publication lists)
\RequirePackage{enumitem}
\setlist[itemize]{itemsep=3pt, parsep=0pt, topsep=3pt, leftmargin=1.5em}

% Use hyperref (loaded last among packages)
\RequirePackage{hyperref}

% Remove page numbers
\pagestyle{empty}

% Define navy-blue color for later use. Color code is taken from Canva
\definecolor{navyblue}{RGB}{0, 83, 137}
\definecolor{links}{RGB}{3, 43, 198}

% Define new resizable bullet with default 0.7 size for later use
% Taken from https://tex.stackexchange.com/questions/534192/medium-sized-circle-as-a-bullet
\newcommand{\vbullet}[1][.7]{\mathbin{\ThisStyle{\vcenter{\hbox{%
  \scalebox{#1}{$\SavedStyle\bullet$}}}}}%
}

% Setup Hyperlink style
\hypersetup{
    colorlinks=true,
    urlcolor=links
}

% Define some social accounts and contact information formats
% (trailing % signs prevent stray spaces in the output)
\newcommand{\linkedin}[1]{\href{https://linkedin.com/in/#1}{\textcolor{black}{\faLinkedinIn}\hspace{0.5em}#1}}
\newcommand{\email}[1]{\href{mailto:#1}{\textcolor{black}{\faEnvelope[regular]}\hspace{0.5em}#1}}
\newcommand{\github}[1]{\href{https://github.com/#1}{\textcolor{black}{\faGithub}\hspace{0.5em}#1}}
\newcommand{\twitter}[1]{\href{https://twitter.com/#1}{\textcolor{black}{\faTwitter}\hspace{0.5em}#1}}
\newcommand{\facebook}[1]{\href{https://www.facebook.com/#1}{\textcolor{black}{\faFacebookF}\hspace{0.5em}#1}}
\newcommand{\website}[1]{\href{https://#1}{\textcolor{black}{\faGlobeAmericas}\hspace{0.5em}#1}}
\newcommand{\phone}[1]{\textcolor{black}{\faPhone*}\hspace{0.5em}#1}
\newcommand{\nationality}[1]{\textcolor{black}{\faFlagUsa}\hspace{0.5em}#1}
\newcommand{\address}[1]{\textcolor{black}{\faMapMarker*}\hspace{0.5em}#1}

% Define commands for fullname and job title
\def\fullname#1{\def\@name{#1}}
\def\@name{}
\def\jobtitle#1{\def\@title{#1}}
\def\@title{}

% Convenience commands
\newcommand{\italicitem}[1]{\item{\textit{#1}}}
\newcommand{\bolditem}[1]{\item{\textbf{#1}}}
\newcommand{\entry}[2]{#1 & #2 \tabularnewline}

% Font used for the name in the header: Cormorant Garamond Bold (ships with
% TeX Live / Overleaf). Falls back to the body font in bold if unavailable.
\IfFontExistsTF{CormorantGaramond-Bold.ttf}{%
    \newfontfamily\namefont{CormorantGaramond-Bold.ttf}[Ligatures=TeX]%
}{%
    \newcommand{\namefont}{\bfseries}%
}

% Define the resume header
% #1-#4: contact lines shown on the right (e.g. \email{}, \website{}, \linkedin{}, \github{})
\newcommand{\resumeheader}[4]{%
    \noindent
    \begin{tabularx}{\textwidth}{@{}X r@{}}
        \begin{tabular}[c]{@{}l@{}}
            {\namefont\fontsize{30}{36}\selectfont\color{navyblue}\@name}%
            \ifx\@title\@empty\else
                \\ \textit{\small\@title}%
            \fi
        \end{tabular}
        &
        \begin{tabular}[c]{@{}l@{}}
            \small#1 \\
            \small#2 \\
            \small#3 \\
            \small#4
        \end{tabular}
    \end{tabularx}%
}

% Renew section command for resume section
\renewenvironment{section}[1]{%
    \par\needspace{4\baselineskip}%
    \phantomsection
    \addcontentsline{toc}{section}{#1}%
    \vspace{4pt}%
    {\color{navyblue}\textbf{\textit{#1}}}\par\nopagebreak
    \vspace{2pt}{\color{navyblue}\hrule}\nopagebreak
    \begin{list}{}{%
        \setlength{\leftmargin}{1em}%
        \setlength{\topsep}{3pt}%
    }
    \item[]
}{%
    \end{list}%
}

% Two-line entry header: title/date on the first row, description/location on
% the second. Long titles wrap inside the left column instead of pushing the
% date onto its own line.
\newcommand{\entryheader}[4]{%
    \noindent
    \begin{tabularx}{\linewidth}{@{}>{\raggedright\arraybackslash}X@{\hspace{1em}}r@{}}
        \textbf{#1} & \textit{#3}
    \end{tabularx}\par\nopagebreak
    \def\@tempa{#2#4}%
    \ifx\@tempa\@empty\else
        \vspace{-\parskip}%
        \noindent
        \begin{tabularx}{\linewidth}{@{}>{\raggedright\arraybackslash}X@{\hspace{1em}}r@{}}
            \textit{#2} & \textit{#4}
        \end{tabularx}\par\nopagebreak
    \fi
}

% Renew subsection command for resume subsections
% All arguments are compulsory
% #1: Name, #2: Description, #3: Time Period, #4: Location
\renewenvironment{subsection}[4]{%
    \par\needspace{4\baselineskip}%
    \phantomsection
    \addcontentsline{toc}{subsection}{#1}%
    \entryheader{#1}{#2}{#3}{#4}%
    \begin{list}{$\vbullet$}{%
        \setlength{\leftmargin}{2em}%
        \setlength{\topsep}{0pt}%
        \setlength{\itemsep}{0pt}%
        \setlength{\parsep}{0pt}%
    }
}{%
    \end{list}%
    \vspace{0.3em}%
}

% Define command for resume subsections with no bullets
% The body is optional plain text (e.g. a thesis title); it may be left empty.
% #1: Name, #2: Description, #3: Time Period, #4: Location
\newenvironment{subsectionnobullet}[4]{%
    \par\needspace{2.5\baselineskip}%
    \phantomsection
    \addcontentsline{toc}{subsection}{#1}%
    \entryheader{#1}{#2}{#3}{#4}%
    \itshape
}{%
    \par
}

% Define new sectiontable command, which makes a section with a table
% All arguments are compulsory
% #1: Name of the section, #2: Body of the section
\newcommand{\sectiontable}[2]{
    \begin{section}{#1}
        \begin{adjustwidth}{0.0in}{0.1in}
            \renewcommand{\arraystretch}{1.1}%
            \begin{tabularx}{\linewidth}{@{} >{\bfseries}l @{\hspace{5ex}} >{\raggedright\arraybackslash}X @{}}
                #2
            \end{tabularx}
        \end{adjustwidth}
    \end{section}
}
