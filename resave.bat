rem */\(1+[a-z\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1


l3build save -eluatex test-mc-manual-para-split
l3build save -epdftex test-mc-manual-para-split
l3build save -eluatex test-struct-user
l3build save -epdftex test-struct-user
l3build save -eluatex testauxtree
l3build save -epdftex testauxtree
