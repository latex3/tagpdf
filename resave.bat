rem */\(1+[a-zA-Z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1


l3build save -eluatex test-AF-file
l3build save -eluatex test-alttext
l3build save -eluatex test-artifact-group
l3build save -eluatex test-empty-mc
l3build save -epdftex test-getmctag
l3build save -eluatex test-header-footer
l3build save -eluatex test-header-tagging
l3build save -eluatex test-link
l3build save -eluatex test-links-backend
l3build save -eluatex test-local-inactive-mc
l3build save -epdftex test-mc-ifinartifact
l3build save -eluatex test-mc-manual-para-split
l3build save -epdftex test-mc-manual-para-split
l3build save -epdftex test-mc-tag-expansion
l3build save -eluatex test-mc-used-twice-b
l3build save -eluatex test-ref
l3build save -eluatex test-saveboxes-structure
l3build save -epdftex test-showattributes
l3build save -eluatex test-struct-OBJR
l3build save -eluatex test-struct-user
l3build save -epdftex test-struct-user
l3build save -eluatex testauxtree
l3build save -epdftex testauxtree

l3build save -cconfig-pdftex -epdftex ptagging-002
l3build save -cconfig-pdftex -epdftex test-patch-koma


l3build save -cconfig-nosyntax -eluatex test-mc-low-bdc-emc
l3build save -cconfig-nosyntax -epdftex test-mc-low-bdc-emc
l3build save -cconfig-nosyntax -eluatex test-mcid-cnt
l3build save -cconfig-nosyntax -epdftex test-mcid-cnt
REM
REM  Failed tests for configuration config-luatex:
REM
REM    Check failed with difference files
l3build save -cconfig-luatex -eluatex issue13-mcid-array
l3build save -cconfig-luatex -eluatex issue14-artifact-bool
l3build save -cconfig-luatex -eluatex test-attribute
l3build save -cconfig-luatex -eluatex test-fakespace-box
l3build save -cconfig-luatex -eluatex test-fakespace-fontchange
l3build save -cconfig-luatex -eluatex test-fakespace-tagpdf
l3build save -cconfig-luatex -eluatex test-luatex-pdf
l3build save -cconfig-luatex -eluatex test-mc-alt
l3build save -cconfig-luatex -eluatex test-sectioning-koma
