rem */\(1+[a-zA-Z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1


l3build save -eluatex test-AF-file
l3build save -epdftex test-AF-file
l3build save -epdftexmain test-AF-file
l3build save -eluatex test-add-new-tag
l3build save -epdftex test-add-new-tag
l3build save -epdftexmain test-add-new-tag
l3build save -eluatex test-alttext
l3build save -epdftex test-alttext
l3build save -epdftexmain test-alttext
l3build save -eluatex test-artifact-group
l3build save -epdftex test-artifact-group
l3build save -epdftexmain test-artifact-group
l3build save -eluatex test-empty-mc
l3build save -epdftex test-empty-mc
l3build save -epdftexmain test-empty-mc
l3build save -eluatex test-header-footer
l3build save -epdftex test-header-footer
l3build save -epdftexmain test-header-footer
l3build save -eluatex test-header-tagging
l3build save -epdftex test-header-tagging
l3build save -epdftexmain test-header-tagging
l3build save -eluatex test-links-backend
l3build save -epdftex test-links-backend
l3build save -epdftexmain test-links-backend
l3build save -eluatex test-local-inactive-mc
l3build save -epdftex test-local-inactive-mc
l3build save -epdftexmain test-local-inactive-mc
l3build save -eluatex test-mc-used-twice-b
l3build save -epdftex test-mc-used-twice-b
l3build save -epdftexmain test-mc-used-twice-b
l3build save -eluatex test-paratag
l3build save -epdftex test-paratag
l3build save -epdftexmain test-paratag
l3build save -eluatex test-parent-key
l3build save -epdftex test-parent-key
l3build save -epdftexmain test-parent-key
l3build save -eluatex test-ref
l3build save -epdftex test-ref
l3build save -epdftexmain test-ref
l3build save -eluatex test-root-AF
l3build save -epdftex test-root-AF
l3build save -epdftexmain test-root-AF
l3build save -eluatex test-saveboxes-structure
l3build save -epdftex test-saveboxes-structure
l3build save -epdftexmain test-saveboxes-structure
REM l3build save -eluatex test-simple
REM l3build save -epdftex test-simple
REM l3build save -epdftexmain test-simple
l3build save -eluatex test-struct-OBJR
l3build save -epdftex test-struct-OBJR
l3build save -epdftexmain test-struct-OBJR
l3build save -eluatex test-struct-user
l3build save -epdftex test-struct-user
l3build save -epdftexmain test-struct-user
l3build save -eluatex testauxtree
l3build save -epdftex testauxtree
l3build save -epdftexmain testauxtree

REM Failed tests for configuration config-pdftex:
REM 
REM   Check failed with difference files
l3build save -cconfig-pdftex -epdftex ptagging-004-p
l3build save -cconfig-pdftex -epdftex ptagging-006-p
l3build save -cconfig-pdftex -epdftex ptagging-007-p
l3build save -cconfig-pdftex -epdftex test-attribute-name
l3build save -cconfig-pdftex -epdftex test-attribute
l3build save -cconfig-pdftex -epdftex test-beast-1
l3build save -cconfig-pdftex -epdftex test-beast-2
l3build save -cconfig-pdftex -epdftex test-fakespace-tagpdf
l3build save -cconfig-pdftex -epdftex test-mc-alt
l3build save -cconfig-pdftex -epdftex test-namespace-pdf-article
l3build save -cconfig-pdftex -epdftex test-namespace-pdf-book
l3build save -cconfig-pdftex -epdftex test-namespace-pdfII-article
l3build save -cconfig-pdftex -epdftex test-namespace-pdfII-book
l3build save -cconfig-pdftex -epdftex test-sectioning-koma
REM 
REM Failed tests for configuration config-luatex:
REM 
REM   Check failed with difference files
l3build save -cconfig-luatex -eluatex issue13-mcid-array
l3build save -cconfig-luatex -eluatex issue14-artifact-bool
l3build save -cconfig-luatex -eluatex test-attribute
l3build save -cconfig-luatex -eluatex test-fakespace-box
l3build save -cconfig-luatex -eluatex test-fakespace-fontchange
l3build save -cconfig-luatex -eluatex test-fakespace-tagpdf
REM l3build save -cconfig-luatex -eluatex test-luatex
l3build save -cconfig-luatex -eluatex test-mc-alt
l3build save -cconfig-luatex -eluatex test-sectioning-koma
