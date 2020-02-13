#!/bin/she -e

# This script is used for testing using Travis
# It is intended to work on their VM set up: Ubuntu 12.04 LTS
# A minimal current TL is installed adding only the packages that are
# required

# See if there is a cached version of TL available
export PATH=/tmp/texlive/bin/x86_64-linux:$PATH
if ! command -v texlua > /dev/null; then
  # Obtain TeX Live
  wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
  tar -xzf install-tl-unx.tar.gz
  cd install-tl-20*

  # Install a minimal system
  ./install-tl --profile=../texlive.profile

  cd ..
fi

tlmgr update --self

# Needed for any use of texlua even if not testing LuaTeX
# kernel
tlmgr install l3kernel l3packages l3build latex latex-bin ctablestack  l3experimental l3backend

tlmgr install collection-langgerman

# luatex
tlmgr install luacode luatex luatexbase luaotfload iftex

# language
tlmgr install babel babel-english babel-german hyph-utf8

# class / content
tlmgr install koma-script fancyhdr enumitem lipsum biblatex tcolorbox pgf tabularx marginnote
tlmgr install enumitem listings

# other tools

tlmgr install oberdiek etoolbox unicode-data  xpatch  amsmath filehook

# oberdiek split

tlmgr install \
accsupp \
askinclude \
atbegshi \
atenddvi \
attachfile2 \
atveryend \
auxhook \
bigintcalc \
bitset \
bookmark \
catchfile \
embedfile \
etexcmds \
gettitlestring \
grfext \
hobsub \
hologo \
hycolor \
iftex \
infwarerr \
inputenx \
intcalc \
kvdefinekeys \
kvoptions \
kvsetkeys \
letltxmacro \
ltxcmds \
luacolor \
magicnum \
mleftright \
pdfescape \
pdfcolmk \
pdflscape \
pdftexcmds \
refcount \
rerunfilecheck \
epstopdf-pkg \
stringenc \
transparent \
uniquecounter \
zref \


# fonts
tlmgr install fontspec  microtype amsfonts gnu-free­font ec cm-super heuristica

# graphics
tlmgr install  graphics graphics-def     duckuments

   

# Required to build plain and LaTeX formats:
# TeX90 plain for unpacking, pdfLaTeX, LuaLaTeX and XeTeX for tests
tlmgr install cm etex knuth-lib latex-bin tex tex-ini-files unicode-data 
 
# Assuming a 'basic' font set up, metafont is required to avoid
# warnings with some packages and errors with others
tlmgr install metafont mfware

# Keep no backups (not required, simply makes cache bigger)
tlmgr option -- autobackup 0

# Update the TL install but add nothing new
tlmgr update --self --all --no-auto-install

