rem */\(1+[a-zA-Z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1

l3build save -cconfig-pdftex -epdftex ptagging-004-p
l3build save -cconfig-pdftex -epdftex ptagging-006-p
l3build save -cconfig-pdftex -epdftex ptagging-007-p
l3build save -cconfig-pdftex -epdftex test-attribute-name
l3build save -cconfig-pdftex -epdftex test-attribute
l3build save -cconfig-pdftex -epdftex test-fakespace-tagpdf
l3build save -cconfig-pdftex -epdftex test-mc-alt
l3build save -cconfig-pdftex -epdftex test-namespace-pdf-article
l3build save -cconfig-pdftex -epdftex test-namespace-pdf-book
l3build save -cconfig-pdftex -epdftex test-sectioning-koma

REM 
REM Failed tests for configuration config-luatex:
REM 
REM   Check failed with difference files
REM   - ./build/test-config-luatex/issue13-mcid-array.luatex.fc
REM   - ./build/test-config-luatex/issue14-artifact-bool.luatex.fc
REM   - ./build/test-config-luatex/test-attribute.luatex.fc
REM   - ./build/test-config-luatex/test-fakespace-box.luatex.fc
REM   - ./build/test-config-luatex/test-fakespace-fontchange.luatex.fc
REM   - ./build/test-config-luatex/test-fakespace-tagpdf.luatex.fc
REM   - ./build/test-config-luatex/test-mc-alt.luatex.fc
REM   - ./build/test-config-luatex/test-sectioning-koma.luatex.fc
