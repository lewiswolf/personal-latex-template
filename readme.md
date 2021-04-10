## Prerequisites

Of course, you need to have a LaTeX compiler installed, I personally use [MacTex](https://formulae.brew.sh/cask/mactex-no-gui).

This LaTeX template was designed to be used with VSCode. Upon opening the project directory in VSCode for the first time, you will be prompted to install the suggested extensions, which are required and preconfigured by this repository.

This template also requires you to install [pipenv](https://pypi.org/project/pipenv/) or else everything breaks.

## Usage

The easiest way to get the template up and running is to download install.sh and run `$ sh install.sh` in your project directory. To opt for an editor-neutral approach, use `$ sh install.sh --nocode`, but you will need to configure your own build tasks ( `pipenv run pdflatex ...` ).

You can configure your document in index.tex, and easily switch between article, journal and report documnet types.

To add chapters or other tex files to your index.tex file, use `\include{filename}` for .tex files and `\includepdf{filename.pdf}` for everything else.

I'm a big fan of the APA citation and reference style, so to cite things use `\citep{}` for a parenthetical citation or `\citet{}` for a text-style citation. To use citations, comment out the line `\nocite{*}` in _index.tex_ and populate _bib.bib_.

All the cool maths packages are installed so your functions can be extra `\[ \mathcal{L} \mathbb{I} \mathsf{T} \]`.

Add images with `\includegraphics[options]{filepath}`.

Change the font color with `\textcolor{color}{text}.`

Finish your essay early with `\lipsum[1]`.

If you want nice syntax highlighting:

```latex
\begin{minted}{python}
print('hello world')
\end{minted}
```
