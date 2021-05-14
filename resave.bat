rem */\(1+[a-zA-Z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1


REM
 l3build save -eluatex test-AF-file
 l3build save -epdftex test-AF-file
 l3build save -eluatex test-getmctag
 l3build save -eluatex test-mc-ifinartifact
 l3build save -eluatex test-mc-low-luaonly
 l3build save -eluatex test-mc-manual-para-split
 l3build save -eluatex test-mc-tag-expansion
 l3build save -eluatex test-showattributes
 l3build save -eluatex test-simple
 l3build save -eluatex test-struct-user
 l3build save -eluatex testauxtree
REM
 l3build save -cconfig-nosyntax -eluatex test-mc-low-bdc-emc
 l3build save -cconfig-nosyntax -eluatex test-mcid-cnt

 l3build save -cconfig-luatex -eluatex test-luatex
 l3build save -cconfig-luatex -eluatex test-patch-koma
