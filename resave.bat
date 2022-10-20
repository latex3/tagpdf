rem */\(1+[a-zA-Z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1



l3build save -cconfig-pdftex -epdftex test-beast-1
l3build save -cconfig-pdftex -epdftex test-namespace-pdf-article
