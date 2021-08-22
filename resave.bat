rem */\(1+[a-zA-Z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1

REM Failed tests for configuration config-pdftex:
REM
REM   Check failed with difference files
REM   - ./build/test-config-pdftex/test-beast-1.pdftex.fc
REM   - ./build/test-config-pdftex/test-beast-2.pdftex.fc
REM   - ./build/test-config-pdftex/test-patch-koma.pdftex.fc
REM   - ./build/test-config-pdftex/test-sectioning-koma.pdftex.fc
REM
REM Failed tests for configuration config-nosyntax:
REM
REM   Check failed with difference files
REM   - ./build/test-config-nosyntax/test-mc-low-bdc-emc.luatex.fc
REM   - ./build/test-config-nosyntax/test-mc-low-bdc-emc.pdftex.fc
REM   - ./build/test-config-nosyntax/test-mcid-cnt.luatex.fc
REM   - ./build/test-config-nosyntax/test-mcid-cnt.pdftex.fc
REM
REM Failed tests for configuration config-luatex:
REM
REM   Check failed with difference files
REM   - ./build/test-config-luatex/issue13-mcid-array.luatex.fc
REM   - ./build/test-config-luatex/test-luatex.luatex.fc
REM   - ./build/test-config-luatex/test-mc-alt.luatex.fc
REM   - ./build/test-config-luatex/test-patch-koma.luatex.fc
REM   - ./build/test-config-luatex/test-sectioning-koma.luatex.fc
