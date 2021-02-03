## Installation

Of course, you need to have a LaTeX compiler installed, I personally use [MacTex](https://www.tug.org/mactex/).

This LaTeX template was designed to be used with VSCode. Upon opening the project directory in VSCode for the first time, you will be prompted to install the suggested extensions, which are also preconfigured by this repository.

## Usage

To switch between _article_ and _journal_ document types, uncomment the top lines in both the master.tex and document.tex. Default is _article_.

To add chapters or other tex files to your master.tex file, use `\include{filename}` for .tex files and `\includepdf{filename.pdf}` for everything else.

I'm a big fan of the APA citation and reference style, and so to cite things use `\citep{}` for a parenthetical citation or `\citet{}` for a text-style citation.

All the cool maths packages are installed so your functions can be extra lit.

Add images with `\includegraphics[options]{filepath}`.

Change the font color with `\textcolor{color}{text}.`

Finish your essay early with `\lipsum[1]`.

If you wish to use the _minted_ package for syntax highlighting, i.e

```latex
\begin{minted}{python}
print('hello world')
\end{minted}
```

you will need to install Python, pip and Pygments manually (I couldn't get it to work with pipenv 😔).

```bash
brew update
brew install python
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
pip install pygments
```
