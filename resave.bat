rem */\(1+[a-zA-Z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1


REM 
REM Failed tests for configuration config-luatex:
REM 
REM   Check failed with difference files
  l3build save test-add-new-tag-2
  l3build save -c config-pdftex test-struct-OBJR test-root-AF test-ref test-AFref show-variables-17 test-beast-1 test-namespace-pdfII-book test-namespace-pdfII-article test-link test-AF-file test-header-footer test-beast-2 parent-child-20-structures show-variables-20
  l3build save -c config-luatex parent-child-20-structures test-header-footer test-struct-OBJR test-root-AF test-ref test-link test-AF-file



  l3build check --show-saves test-add-new-tag-2
  l3build check --show-saves -c config-pdftex test-struct-OBJR test-root-AF test-ref test-AFref show-variables-17 test-beast-1 test-namespace-pdfII-book test-namespace-pdfII-article test-link test-AF-file test-header-footer test-beast-2 parent-child-20-structures show-variables-20
  l3build check --show-saves -c config-luatex parent-child-20-structures test-header-footer test-struct-OBJR test-root-AF test-ref test-link test-AF-file
