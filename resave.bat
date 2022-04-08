rem */\(1+[a-zA-Z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1


REM   Check failed with difference files
l3build save -epdftex test-getmctag
l3build save -epdftex test-mc-ifinartifact
l3build save -epdftex test-mc-low-luaonly
l3build save -eluatex test-mc-manual-para-split
l3build save -epdftex test-mc-manual-para-split
l3build save -epdftex test-mc-tag-expansion
l3build save -epdftex test-root-AF
l3build save -epdftexmain test-root-AF
l3build save -epdftex test-showattributes
l3build save -eluatex test-struct-user
l3build save -epdftex test-struct-user
l3build save -eluatex testauxtree
l3build save -epdftex testauxtree
REM
REM Failed tests for configuration config-pdftex:
REM
REM   Check failed with difference files
l3build save -cconfig-pdftex -epdftex ptagging-002
l3build save -cconfig-pdftex -epdftex test-patch-koma
REM
REM Failed tests for configuration config-nosyntax:
REM
REM   Check failed with difference files
l3build save -cconfig-nosyntax -eluatex test-mc-low-bdc-emc
l3build save -cconfig-nosyntax -epdftex test-mc-low-bdc-emc
l3build save -cconfig-nosyntax -eluatex test-mcid-cnt
l3build save -cconfig-nosyntax -epdftex test-mcid-cnt
REM
REM Failed tests for configuration config-luatex:
REM
REM   Check failed with difference files
l3build save -cconfig-luatex -eluatex test-patch-koma
