rem */\(1+[a-zA-Z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1


REM 
REM Failed tests for configuration config-luatex:
REM 
REM   Check failed with difference files

l3build check -S openaction-2 test-root-AF test-attribute-dev test-reset-attributes test-attribute-name test-attribute openaction-1 openaction-0
REM  l3build save -c config-luatex test-fakespace-gh72 test-reset-attributes test-attribute test-root-AF
