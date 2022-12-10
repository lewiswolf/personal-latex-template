## Prerequisites

Of course, you need to have a LaTeX compiler installed, I personally use [MacTex](https://formulae.brew.sh/cask/mactex-no-gui).

This LaTeX template was designed to be used with VSCode. Upon opening the project directory in VSCode for the first time, you will be prompted to install the suggested extensions, which are required and preconfigured by this repository.

This template also requires you to install [pipenv](https://pypi.org/project/pipenv/) if you want to use syntax highlighting for codeblocks.

## Usage

The easiest way to get the template up and running is to download install.sh and run `$ sh install.sh` in your project directory. To opt for an editor-neutral approach, use `$ sh install.sh --nocode`, but you will need to configure your own build tasks ( `pdflatex ...` ).

You can configure your document in index.tex, and easily switch between article, journal and report document types. Just uncomment the document type and all of the relevant preamble.

To add chapters or other tex files to your index.tex file, use `\include{filename}` for .tex files and `\includepdf{filename.pdf}` for everything else.

I'm a big fan of the APA citation and reference style, so to cite things use `\citep{}` for a parenthetical citation or `\citet{}` for a text-style citation.

Talk about music as much as you want:

```latex
D\musFlat{} is better than C\musSharp{}.
```

All the cool maths packages are installed so your functions can be extra:

```latex
\[ \mathcal{L} \mathbb{I} \mathsf{T} \]
```

Custon mathematics operators include:

```latex
\( \argmin \)
\( \argmax \)
```

If you want nice syntax highlighting, you have to first install the project with `$ sh install.sh --env`:

```latex
\begin{minted}{python}
print('hello world')
\end{minted}
```

Labels and cross references are automatically formatted and clickable:

```latex
\prettyref{chapter:chap1}
\prettyref{figure:fig1}
\prettyref{section:sec1}

\chapter{Some Chapter}\label{chapter:chap1}
\begin{figure}\label{figure:fig1}\end{figure}
\section{Some Section}\label{section:sec1}
```

Add images with `\includegraphics[options]{filepath}`.

Change the font color with `\textcolor{color}{text}.`

Finish your essay early with `\lipsum[1]`.
