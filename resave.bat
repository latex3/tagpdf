rem */\(1+[a-zA-Z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1


REM 
REM Failed tests for configuration config-luatex:
REM 
REM   Check failed with difference files

REM object tracking 2024-04-11
l3build save spacecharoff
  l3build save -e pdftexmain remap-tags
  l3build save -c config-pdftex -e pdftexmain test-AF-file ptagging-007-p test-mc-alt test-sectioning-koma openaction-0 openaction-2 ptagging-004-p test-struct-OBJR test-saveboxes-structure ptagging-006-p test-beast-2 test-reset-attributes test-link test-header-tagging openaction-1 test-fakespace-tagpdf test-header-footer disable-delayed-shipout test-beast-1 test-attribute-name test-attribute-dev test-alttext test-AFref


  l3build check --show-saves spacecharoff
