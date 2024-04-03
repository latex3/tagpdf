rem */\(1+[a-zA-Z0-9\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1
rem l3build save -cconfig-pdftex -e\2 \1
rem l3build save -cconfig-luatex -e\2 \1


REM 
REM Failed tests for configuration config-luatex:
REM 
REM   Check failed with difference files

 l3build save teststructref test-mc-ifinartifact test-links-backend test-fancyhdr test-paratag test-box-is-tagged test-mc-used-twice test-lang-change test-mc-used-twice-b open-structures texsource test-parent-key test-empty-mc mc-parent-child test-get-counter test-get-counter-base remap-tags test-local-inactive-mc test-add-mathml test-artifact-group test-getmctag
  l3build save -c config-pdftex testauxtree test-header-footer test-mc-low-luaonly test-struct-user test-namespace-pdf-book test-struct-OBJR test-showattributes test-sectioning-koma test-saveboxes-structure debug-structures-2 test-root-AF test-beast-2 ptagging-005 parent-child-rolemap-17 ptagging-002 test-mc-alt test-patch-koma check-child test-ref ptagging-004-p test-mc-manual-para-split test-fakespace-tagpdf test-AFref openaction-2 test-reset-attributes ptagging-006 test-parentkey para-main-struct test-namespace-pdfII-book test-namespace-pdfII-article test-attribute-dev test-alttext test-namespace-pdf-article test-beast-1 test-mcid-cnt test-mc-tag-expansion openaction-1 test-link orphan-01 parent-child-17 parent-child-rolemap-20 test-mc-low-bdc-emc parent-child-17-nonstruct parent-child-20 test-mc-user ptagging-004 test-header-tagging orphan-02 ptagging-003 ptagging-006-p test-attribute test-AF-file openaction-0 socket-2 ptagging-007-p test-attribute-name parent-child-20-structures debug-structures test-mc-savebox parent-child-17-structures disable-delayed-shipout parent-child-20-nonstruct ptagging-001b
