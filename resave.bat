rem */\(1+[a-zA-Z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1


REM 
REM Failed tests for configuration config-luatex:
REM 
REM   Check failed with difference files

REM object tracking 2024-04-11


REM To detect engine-specific differences, run after that
REM 
l3build check --show-saves remap-tags
REM   l3build check --show-saves -c config-pdftex test-ref
REM   l3build check --show-saves -c config-luatex test-patch-koma test-ref
