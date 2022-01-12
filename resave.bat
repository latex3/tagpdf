rem */\(1+[a-zA-Z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1


l3build save -epdftex test-AF-file
l3build save -epdftex test-alttext
l3build save -epdftex test-artifact-group
l3build save -epdftex test-empty-mc
l3build save -epdftex test-header-footer
l3build save -epdftexmain test-header-footer
l3build save -epdftex test-header-tagging
l3build save -epdftex test-links-backend
l3build save -epdftex test-local-inactive-mc
l3build save -epdftex test-mc-used-twice-b
l3build save -epdftex test-ref
l3build save -epdftex test-root-AF
l3build save -epdftex test-saveboxes-structure
l3build save -epdftex test-struct-OBJR

l3build save -cconfig-pdftex -epdftex ptagging-004-p
l3build save -cconfig-pdftex -epdftex ptagging-006-p
l3build save -cconfig-pdftex -epdftex ptagging-007-p
l3build save -cconfig-pdftex -epdftex test-attribute
l3build save -cconfig-pdftex -epdftex test-beast-1
l3build save -cconfig-pdftex -epdftex test-beast-2
l3build save -cconfig-pdftex -epdftex test-fakespace-tagpdf
l3build save -cconfig-pdftex -epdftex test-mc-alt
l3build save -cconfig-pdftex -epdftex test-pdf
l3build save -cconfig-pdftex -epdftex test-sectioning-koma
