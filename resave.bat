rem */\(1+[a-zA-Z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1

l3build save -eluatex test-add-new-tag-2
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
l3build save -eluatex test-saveboxes-structure
l3build save -epdftex test-saveboxes-structure
l3build save -epdftexmain test-saveboxes-structure
l3build save -eluatex test-sttypes-lists
l3build save -epdftex test-sttypes-lists
l3build save -epdftexmain test-sttypes-lists
