rem */\(1+[a-zA-Z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1

REM Check failed with difference files
REM   - ./build/test/test-link.luatex.pdf.fc
REM   - ./build/test/test-link.pdftex.pdf.fc
REM   - ./build/test/test-struct-user.luatex.fc
REM   - ./build/test/test-struct-user.pdftex.fc
REM   - ./build/test/testauxtree.luatex.fc
REM   - ./build/test/testauxtree.pdftex.fc
