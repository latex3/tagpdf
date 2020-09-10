rem */\(1+[a-z\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1



l3build save -epdftex -cconfig-pdftex test-patch-koma

l3build save -eluatex -cconfig-nosyntax test-mc-low-bdc-emc
l3build save -epdftex -cconfig-nosyntax  test-mc-low-bdc-emc
l3build save -eluatex -cconfig-nosyntax  test-mcid-cnt
l3build save -epdftex -cconfig-nosyntax  test-mcid-cnt

l3build save -eluatex -cconfig-luatex test-luatex
l3build save -eluatex -cconfig-luatex test-patch-koma
