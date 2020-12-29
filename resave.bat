rem */\(1+[a-z\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1


rem l3build save -eluatex test-mc-manual-para-split
rem l3build save -epdftex test-mc-manual-para-split
rem l3build save -eluatex test-struct-user
rem l3build save -epdftex test-struct-user
l3build save -eluatex testauxtree
l3build save -epdftex testauxtree

rem  Check failed with difference files
rem   - ./build/test/test-empty-mc.luatex.pdf.fc
rem   - ./build/test/test-empty-mc.pdftex.pdf.fc
rem   - ./build/test/test-getmctag.pdftex.fc
rem   - ./build/test/test-links-backend.luatex.pdf.fc
rem   - ./build/test/test-links-backend.pdftex.pdf.fc
rem   - ./build/test/test-mc-ifinartifact.pdftex.fc
rem   - ./build/test/test-mc-low-luaonly.pdftex.fc
rem   - ./build/test/test-mc-manual-para-split.luatex.fc
rem   - ./build/test/test-mc-manual-para-split.pdftex.fc
rem   - ./build/test/test-mc-tag-expansion.pdftex.fc
rem   - ./build/test/test-saveboxes-structure.luatex.pdf.fc
rem   - ./build/test/test-saveboxes-structure.pdftex.pdf.fc
rem   - ./build/test/test-showattributes.pdftex.fc
rem   - ./build/test/test-struct-user.luatex.fc
rem   - ./build/test/test-struct-user.pdftex.fc
rem
rem Failed tests for configuration config-pdftex:
rem
rem   Check failed with difference files
rem   - ./build/test-config-pdftex/test-attribute.pdftex.pdf.fc
rem   - ./build/test-config-pdftex/test-fakespace-tagpdf.pdftex.pdf.fc
rem   - ./build/test-config-pdftex/test-mc-alt.pdftex.pdf.fc
rem   - ./build/test-config-pdftex/test-patch-koma.pdftex.fc
rem   - ./build/test-config-pdftex/test-pdf.pdftex.pdf.fc
rem   - ./build/test-config-pdftex/test-sectioning-koma.pdftex.pdf.fc
rem
rem Failed tests for configuration config-nosyntax:
rem
rem   Check failed with difference files
rem   - ./build/test-config-nosyntax/test-mc-low-bdc-emc.luatex.fc
rem   - ./build/test-config-nosyntax/test-mc-low-bdc-emc.pdftex.fc
rem   - ./build/test-config-nosyntax/test-mcid-cnt.luatex.fc
rem   - ./build/test-config-nosyntax/test-mcid-cnt.pdftex.fc
rem
rem Failed tests for configuration config-luatex:
rem
rem   Check failed with difference files
rem   - ./build/test-config-luatex/issue13-mcid-array.luatex.pdf.fc
rem   - ./build/test-config-luatex/issue14-artifact-bool.luatex.pdf.fc
rem   - ./build/test-config-luatex/test-attribute.luatex.pdf.fc
rem   - ./build/test-config-luatex/test-fakespace-fontchange.luatex.pdf.fc
rem   - ./build/test-config-luatex/test-fakespace-tagpdf.luatex.pdf.fc
rem   - ./build/test-config-luatex/test-luatex-pdf.luatex.pdf.fc
rem   - ./build/test-config-luatex/test-mc-alt.luatex.pdf.fc
rem   - ./build/test-config-luatex/test-sectioning-koma.luatex.pdf.fc
