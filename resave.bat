rem */\(1+[a-z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1

REM Lang and two lipsum ...
REM   Check failed with difference files
REM    - ./build/test-config-pdftex/test-attribute.pdftex.pdf.fc
REM    - ./build/test-config-pdftex/test-fakespace-tagpdf.pdftex.pdf.fc
REM    - ./build/test-config-pdftex/test-mc-alt.pdftex.pdf.fc
REM    - ./build/test-config-pdftex/test-pdf.pdftex.pdf.fc
REM    - ./build/test-config-pdftex/test-sectioning-koma.pdftex.pdf.fc
REM
REM  Failed tests for configuration config-luatex:
REM
REM    Check failed with difference files
REM    - ./build/test-config-luatex/issue13-mcid-array.luatex.pdf.fc
REM    - ./build/test-config-luatex/issue14-artifact-bool.luatex.pdf.fc
REM    - ./build/test-config-luatex/test-attribute.luatex.pdf.fc
REM    - ./build/test-config-luatex/test-fakespace-fontchange.luatex.pdf.fc
REM    - ./build/test-config-luatex/test-fakespace-tagpdf.luatex.pdf.fc
REM    - ./build/test-config-luatex/test-luatex-pdf.luatex.pdf.fc
REM    - ./build/test-config-luatex/test-mc-alt.luatex.pdf.fc
REM    - ./build/test-config-luatex/test-sectioning-koma.luatex.pdf.fc
