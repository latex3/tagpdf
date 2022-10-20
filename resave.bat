rem */\(1+[a-zA-Z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1


REM  Check failed with difference files
l3build save -cconfig-luatex -eluatex issue13-mcid-array
l3build save -cconfig-luatex -eluatex issue14-artifact-bool
l3build save -cconfig-luatex -eluatex test-attribute
l3build save -cconfig-luatex -eluatex test-fakespace-box
l3build save -cconfig-luatex -eluatex test-fakespace-fontchange
l3build save -cconfig-luatex -eluatex test-fakespace-tagpdf
l3build save -cconfig-luatex -eluatex test-luatex-pdf
l3build save -cconfig-luatex -eluatex test-luatex
l3build save -cconfig-luatex -eluatex test-mc-alt
l3build save -cconfig-luatex -eluatex test-patch-koma
l3build save -cconfig-luatex -eluatex test-sectioning-koma
