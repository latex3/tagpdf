rem */\(1+[a-z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1


REM
REM Failed tests for configuration config-pdftex:
REM
REM   Check failed with difference files
l3build save -cconfig-pdftex -epdftex test-attribute
l3build save -cconfig-pdftex -epdftex test-fakespace-tagpdf
l3build save -cconfig-pdftex -epdftex test-mc-alt
l3build save -cconfig-pdftex -epdftex test-pdf
l3build save -cconfig-pdftex -epdftex test-sectioning-koma
REM
REM Failed tests for configuration config-luatex:
REM
REM   Check failed with difference files
REM   - ./build/test-config-luatex/issue13-mcid-array.luatex.pdf.fc
REM   - ./build/test-config-luatex/issue14-artifact-bool.luatex.pdf.fc
REM   - ./build/test-config-luatex/test-attribute.luatex.pdf.fc
REM   - ./build/test-config-luatex/test-fakespace-fontchange.luatex.pdf.fc
REM   - ./build/test-config-luatex/test-fakespace-tagpdf.luatex.pdf.fc
REM   - ./build/test-config-luatex/test-luatex-pdf.luatex.pdf.fc
REM   - ./build/test-config-luatex/test-mc-alt.luatex.pdf.fc
REM   - ./build/test-config-luatex/test-sectioning-koma.luatex.pdf.fc
