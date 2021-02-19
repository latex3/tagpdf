rem */\(1+[a-z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1

l3build save -eluatex test-empty-mc
l3build save -epdftex test-empty-mc
 l3build save -eluatex test-getmctag
 l3build save -epdftex test-getmctag
 l3build save -epdftex test-links-backend
 l3build save -eluatex test-mc-ifinartifact
 l3build save -epdftex test-mc-ifinartifact
 l3build save -eluatex test-mc-manual-para-split
 l3build save -epdftex test-mc-manual-para-split
  l3build save -eluatex test-mc-tag-expansion
  l3build save -epdftex test-mc-tag-expansion
  l3build save -eluatex test-saveboxes-structure
  l3build save -epdftex test-saveboxes-structure
l3build save -eluatex test-showattributes
l3build save -epdftex test-showattributes
l3build save -eluatex test-simple
l3build save -epdftex test-simple
l3build save -eluatex test-struct-user
l3build save -epdftex test-struct-user
l3build save -eluatex testauxtree
l3build save -epdftex testauxtree


l3build save -cconfig-pdftex test-attribute
l3build save -cconfig-pdftex test-fakespace-tagpdf
l3build save -cconfig-pdftex test-mc-alt
l3build save -cconfig-pdftex test-patch-koma
l3build save -cconfig-pdftex test-pdf
l3build save -cconfig-pdftex test-sectioning-koma

l3build save -cconfig-nosyntax -eluatex test-mc-low-bdc-emc
l3build save -cconfig-nosyntax -epdftex test-mc-low-bdc-emc
l3build save -cconfig-nosyntax -eluatex test-mcid-cnt
l3build save -cconfig-nosyntax -epdftex test-mcid-cnt

l3build save -cconfig-luatex -eluatex test-luatex
l3build save -cconfig-luatex -eluatex test-patch-koma
