rem */\(1+[a-z\-]\)\.\(2+[a-z]\)\.*
rem l3build save -e\2 \1



rem rem
rem rem Failed tests for configuration config-pdftex:
rem rem
rem rem   Check failed with difference files
rem l3build save -epdftex test-attribute
rem l3build save -epdftex test-fakespace-tagpdf
rem l3build save -epdftex test-mc-alt
rem l3build save -epdftex test-patch-koma
rem l3build save -epdftex test-pdf
rem l3build save -epdftex test-sectioning-koma
rem rem
rem rem Failed tests for configuration config-nosyntax:
rem rem
rem rem   Check failed with difference files
rem l3build save -eluatex test-mc-low-bdc-emc
rem l3build save -epdftex test-mc-low-bdc-emc
rem l3build save -eluatex test-mcid-cnt
rem l3build save -epdftex test-mcid-cnt
rem rem
rem rem Failed tests for configuration config-luatex:
rem rem
rem rem   Check failed with difference files
rem rem   - ./build/test-config-luatex/issue13-mcid-array.luatex.pdf.fc
rem rem   - ./build/test-config-luatex/issue14-artifact-bool.luatex.pdf.fc
rem l3build save -eluatex test-attribute
rem l3build save -eluatex test-fakespace-fontchange
rem l3build save -eluatex test-fakespace-tagpdf
rem l3build save -eluatex test-luatex-pdf
rem l3build save -eluatex test-mc-alt
rem l3build save -eluatex test-sectioning-koma
