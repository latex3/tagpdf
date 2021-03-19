rem */\(1+[a-z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1

REM Failed tests for configuration build:
REM
REM   Check failed with difference files
l3build save -eluatex test-AF-file
l3build save -epdftex test-AF-file
l3build save -eluatex test-empty-mc
l3build save -epdftex test-empty-mc
l3build save -eluatex test-links-backend
l3build save -epdftex test-links-backend
l3build save -eluatex test-ref
l3build save -epdftex test-ref
l3build save -eluatex test-saveboxes-structure
l3build save -epdftex test-saveboxes-structure
REM
REM Failed tests for configuration config-pdftex:
REM
REM   Check failed with difference files
REM   - ./build/test-config-pdftex/test-attribute.pdftex.pdf.fc
REM   - ./build/test-config-pdftex/test-fakespace-tagpdf.pdftex.pdf.fc
REM   - ./build/test-config-pdftex/test-mc-alt.pdftex.pdf.fc
REM   - ./build/test-config-pdftex/test-pdf.pdftex.pdf.fc
REM   - ./build/test-config-pdftex/test-sectioning-koma.pdftex.pdf.fc
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
