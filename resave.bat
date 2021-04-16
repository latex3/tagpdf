rem */\(1+[a-z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1


%  Check failed with difference files
l3build save -eluatex test-add-new-tag
l3build save -epdftex test-add-new-tag
l3build save -eluatex test-AF-file
l3build save -epdftex test-AF-file
l3build save -eluatex test-mc-low-luaonly
l3build save -eluatex test-ref
l3build save -epdftex test-ref
l3build save -eluatex test-showattributes
l3build save -eluatex test-sttypes-lists
l3build save -epdftex test-sttypes-lists
