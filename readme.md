# personal-latex-template

A custom designed LaTeX template suitable for any academic application.

# Dependencies

- [MacTex](https://formulae.brew.sh/cask/mactex-no-gui) (or another CLI LaTeX compiler)
- [VSCode](https://formulae.brew.sh/cask/visual-studio-code) (optional, but recommended)

You will need an appropriate LaTeX compiler installed on your machine, ideally just a CLI version such as the MacOS version listed above. This LaTeX template was designed primarily to be used with VSCode, and is packaged alongside multiple shortcuts for ease of use. When you use the template for the first time, VScode will prompt you to install the required extensions.

There is also a script for use alongside [Zotero](https://formulae.brew.sh/cask/zotero) in the `zotero` directory. The script is to be applied as a post-script alongside [better-bibtex](https://retorque.re/zotero-better-bibtex/), and adds additional formatting to your exported bibtex. Using Zotero is not required for this template, but is aesthetically recommended.

# Install & Run

There is an install script packaged with this repository. I recommend you to use it as a [bash alias](https://linuxize.com/post/how-to-create-bash-aliases/). Mine, corresponding to `./bin/install.sh`, is:

```bash
alias mktex="sh <path/to/install.sh>"
```

Then, when you begin a project, run:

```bash
mkdir <my_dir>
cd my_dir
mktex
```

If you are using VSCode, this template is preconfigured to build the project whenever any of the `.tex` files are saved. If you do not wish to use VSCode, you can run `mktex --nocode` and the template will be environmentally neutral. You will need to configure your own build script, however an example build script is provided in `./bin.build.sh`.

If in your LaTeX you want to use codeblocks with syntax highlighting, you will first need to make sure python and [pipenv](https://pypi.org/project/pipenv/) are installed, and then run `mktex --env` to initialise your project. If you use `--env` in combination with the `--nocode` flag, you will also need to refer to the alternative build script `./bin/build-pipenv.sh`.

# Usage

This script overwrites the formatting for the native article, journal and report classes. For the report specifically, additional accreditation fields have been added. Each `index.tex` should be written as some combination of:

```latex
\documentclass[a4paper, 11pt]{article}
\documentclass[a4paper, 11pt]{journal}
\documentclass[a4paper, 11pt]{report}

\input{style/template}

\begin{document}
	% article
	\title{\LaTeX~Template}
	\author{Lewis Wolstanholme}
	\date{\getDate\today}
	\maketitle

	% journal
	\title{\LaTeX~Template}
	\subtitle{\getDate\today}
	\author{Lewis Wolstanholme}
	\maketitle

	% report
	\title{\LaTeX~Template}
	\author{Lewis Wolstanholme}
	\supervisors{Prof. Andrew McPherson}
	\institution{School of Electronic Engineering and Computer Science \\ Queen Mary University of London}
	\project{PhD Thesis}
	\date{\getDate\today}
	\maketitle

	\dots
\end{document}
```

Each document class comes packaged with customised abstract, acknowledgement, and appendix environments. The article class also has the environment `\begin{abstract*}` which is an unindented version of `\being{abstract}`.

```latex
\begin{abstract}
	\dots
\end{abstract}

\begin{acknowledgements}
	\dots
\end{acknowledgements}

\begin{appendix}
	\dots
\end{appendix}
```

The bibliography and `.bib` files should be configured as follows. I'm a big fan of the APA citation style, so to cite something use `\citep{}` for a parenthetical citation or `\citet{}` for a text-style citation. You can also use `\bibentry{}` to print a full reference in the text body.

```latex
\bibliography{%
	./src/bib_1.bib,
	./src/bib_2.bib
}
```

To add additional latex files, use `\include{filename}` for .tex files and `\includepdf{filename.pdf}` for everything else.

# Style & Formatting

Talk about music as much as you want:

```latex
D\musFlat{} is better than C\musSharp{}.
```

All the cool maths packages are installed so your functions can be extra:

```latex
\[ \mathcal{L} \mathbb{I} \mathsf{T} \]
```

Custom mathematics operators include:

```latex
\( \argmin \)
\( \argmax \)
\( \ceil{x} \)
\( \floor{x} \)
\( \round{x} \)
```

You can customise the VSCode spell checker in `.vscode/settings.json`, by editing the lines:

```json
// add extra languages globally
"cSpell.language": "en-GB",
"cSpell.overrides": [
	// add extra languages per file
	// {
	//     "filename": "**/src/...",
	//     "language": "en-GB, de-DE, es-ES"
	// },
]
```

For an image, which can accredited at the end of the document using `\listofimages`, caption it using:

```latex
\begin{figure}
	\includegraphics[options]{filepath}
	\captionsetup{labelformat=empty, textformat=empty}
	\caption{}
\end{figure}
```

And for a regular figure use:

```latex
\begin{figure}
	\includegraphics[options]{filepath}
	\caption*{}
\end{figure}
```


If you want nice syntax highlighting, you have to first install the project with `mktex --env`, and then:

```latex
\begin{minted}{python}
print('hello world')
\end{minted}
```

Labels and cross references are automatically formatted and clickable:

```latex
\chapter{Some Chapter}\label{chapter:chap1}
\begin{equation}\label{equation:eq1}\end{equation}
\begin{figure}\label{figure:fig1}\end{figure}
\section{Some Section}\label{section:sec1}
\begin{table}\label{table:tab1}\end{table}

\prettyref{chapter:chap1}
\prettyref{figure:eq1}
\prettyref{figure:fig1}
\prettyref{section:sec1}
\prettyref{figure:tab1}
```

Add images with `\includegraphics[options]{filepath}`.

Change the font color with `\textcolor{color}{text}.`

Finish your essay early with `\lipsum[1]`.
