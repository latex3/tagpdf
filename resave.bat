rem */\(1+[a-z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1

REMCheck failed with difference files
REM  - ./build/test-config-luatex/issue13-mcid-array.luatex.pdf.fc
REM  - ./build/test-config-luatex/test-patch-koma.luatex.fc
REM
REMFailed tests for configuration build:
REM
REM  Check failed with difference files
REM  - ./build/test/test-getmctag.luatex.fc
REM  - ./build/test/test-mc-ifinartifact.luatex.fc
REM  - ./build/test/test-mc-low-luaonly.luatex.fc
REM  - ./build/test/test-mc-tag-expansion.luatex.fc
REM  - ./build/test/test-showattributes.luatex.fc
REM
REMFailed tests for configuration config-pdftex:
REM
REM  Check failed with difference files
REM  - ./build/test-config-pdftex/test-attribute.pdftex.pdf.fc
REM
REMFailed tests for configuration config-luatex:
REM
REM  Check failed with difference files
REM  - ./build/test-config-luatex/issue13-mcid-array.luatex.pdf.fc
REM  - ./build/test-config-luatex/test-patch-koma.luatex.fc
