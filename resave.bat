rem */\(1+[a-z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1

REM  Check failed with difference files
l3build save -eluatex test-getmctag
l3build save -eluatex test-mc-ifinartifact
l3build save -eluatex test-mc-low-luaonly
l3build save -eluatex test-mc-tag-expansion
l3build save -eluatex test-showattributes
REM
REMFailed tests for configuration config-luatex:
REM
REM  Check failed with difference files
l3build save -cconfig-luatex -eluatex issue13-mcid-array
l3build save -cconfig-luatex -eluatex test-patch-koma
