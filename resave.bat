rem */\(1+[a-z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1


l3build save -eluatex test-empty-mc
l3build save -epdftex test-empty-mc
l3build save -eluatex test-links-backend
l3build save -epdftex test-links-backend
l3build save -eluatex test-saveboxes-structure
l3build save -epdftex test-saveboxes-structure

l3build save -cconfig-pdftex -epdftex test-attribute
l3build save -cconfig-pdftex -epdftex test-fakespace-tagpdf
l3build save -cconfig-pdftex -epdftex test-mc-alt
l3build save -cconfig-pdftex -epdftex test-pdf
l3build save -cconfig-pdftex -epdftex test-sectioning-koma

l3build save -cconfig-luatex -eluatex issue13-mcid-array
l3build save -cconfig-luatex -eluatex issue14-artifact-bool
l3build save -cconfig-luatex -eluatex test-attribute
l3build save -cconfig-luatex -eluatex test-fakespace-fontchange
l3build save -cconfig-luatex -eluatex test-fakespace-tagpdf
l3build save -cconfig-luatex -eluatex test-luatex-pdf
l3build save -cconfig-luatex -eluatex test-mc-alt
l3build save -cconfig-luatex -eluatex test-sectioning-koma
