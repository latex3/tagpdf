-- Build script for tagpdf
packageversion="0.99l"
packagedate="2025-01-12"

module   = "tagpdf"
ctanpkg  = "tagpdf"

local luatexstatus = status.list()

local ok, mydata = pcall(require, "ulrikefischerlatex3data.lua")
if not ok then
  mydata= {email="XXX",github="XXX",name="XXX"}
end

uploadconfig = {
  pkg     = ctanpkg,
  version = "v"..packageversion.." "..packagedate,
  author  = mydata.name,
  license = "lppl1.3c",
  summary = "Code for PDF tagging using pdfLaTeX and LuaLaTeX",
  ctanPath = "/macros/latex/contrib/tagpdf",
  repository = mydata.github .. "tagpdf",
  bugtracker = mydata.github .. "tagpdf/issues",
  support    = mydata.github .. "tagpdf/issues",
  uploader = mydata.name,
  email    = mydata.email,
  update   = true ,
  topic=    "tagged-pdf",
  note     = [[Uploaded automatically by l3build...]],
  description=[[The package contains the core code for tagging and accessibility used by the LaTeX kernel in the Tagged PDF project. See https://github.com/latex3/tagging-project for more information.]],
  announcement_file="ctan.ann"
}
-- tests are mostly with dev-format always
specialformats = specialformats or {}
specialformats["latex"] = specialformats["latex"] or
  {
    luatex     = {binary="luahbtex",format = "lualatex-dev"},
    luatexmain     = {binary="luahbtex",format = "lualatex",options="-utc"},
    pdftex     = {format = "pdflatex-dev"},
    pdftexmain = {binary="pdftex",format = "pdflatex"},
    xetex      = {format = "xelatex-dev"},
    latexdvips = {binary="latex",format = "latex-dev"}
  }

local luatexstatus = status.list()


checkengines = {"pdftex","luatex","pdftexmain"}

-- force once in a while the full run to find wrong saves

forcecheckruns=true
recordstatus = true
checkconfigs = {
                 "build",
                 "config-pdftex",
                 "config-luatex",
                  }
      
      
checkruns = 2
checksuppfiles = {"pdfaPilotSyntaxChecks.kfpx","checksyntax.bat","checksyntax-all.bat"}
--excludetests = {"test-saveboxes-structure-dev","test-link"}


docfiledir = "./doc"


tagfiles = {"*.md",
            "tag*.sty",
            "tag*.def",
            "*.lua",
            "*.tex",
            "*.dtx",
            "Readme.md"}

function update_tag (file,content,tagname,tagdate)
 tagdate = string.gsub (packagedate,"-", "/")
 if string.match (file, "%.dtx$" ) then
  content = string.gsub (content,
                         "\\ProvidesExplPackage {(.-)} {.-} {.-}",
                         "\\ProvidesExplPackage {%1} {" .. packagedate.."} {"..packageversion .. "}")
  content = string.gsub (content,
                         "\\ProvidesExplFile {(.-)} {.-} {.-}",
                         "\\ProvidesExplFile {%1} {" .. packagedate.."} {"..packageversion .. "}")
  content = string.gsub (content,
                         '(version%s*=%s*")%d%.%d+%l?(",%s*--TAGVERSION)',
                         "%1"..packageversion.."%2")
  content = string.gsub (content,
                         '(date%s*=%s*")%d%d%d%d%-%d%d%-%d%d(",%s*--TAGDATE)',
                         "%1"..packagedate.."%2")
  content = string.gsub (content,
                         "date{Version %d%.%d+%l?, released %d%d%d%d%-%d%d%-%d%d",
                         "date{Version "..packageversion..", released ".. packagedate)
  content = string.gsub (content,
                         "Copyright %(C%) 2019%-%d%d%d%d",
                         "Copyright (C) 2019-"..os.date("%Y"))                         
  return content
elseif string.match (file, "%.sty$" ) then
  content = string.gsub (content,
                         "\\ProvidesExplPackage {(.-)} {.-} {.-}",
                         "\\ProvidesExplPackage {%1} {" .. packagedate .."} {"..packageversion .. "}")
  return content
 elseif string.match (file, "^Readme.md$") then
   content = string.gsub (content,
                         "Version: %d%.%d+%l?",
                         "Version: " .. packageversion )
   content = string.gsub (content,
                         "version%-%d%.%d+%l?",
                         "version-" .. packageversion )
   content = string.gsub (content,
                         "for %d%.%d+%l?",
                         "for " .. packageversion )
   content = string.gsub (content,
                         "%d%d%d%d%-%d%d%-%d%d",
                         packagedate )
   local imgpackagedate = string.gsub (packagedate,"%-","--")
   content = string.gsub (content,
                         "%d%d%d%d%-%-%d%d%-%-%d%d",
                         imgpackagedate)
   return content
 elseif string.match (file, "%.md$") then
   content = string.gsub (content,
                         "Packageversion: %d%.%d+%l?",
                         "Packageversion: " .. packageversion )
   content = string.gsub (content,
                         "Packagedate: %d%d%d%d/%d%d/%d%d",
                         "Packagedate: " .. tagdate )
   content = string.gsub (content,
                         "Unreleased",
                          packagedate )                         
   return content
 elseif string.match (file, "%.tex$" ) then
   content = string.gsub (content,
                         "package@version{%d%.%d+%l?}",
                         "package@version{" .. packageversion .."}" )
   content = string.gsub (content,
                         "package@date{%d%d%d%d%-%d%d%-%d%d}",
                         "package@date{" .. packagedate .."}" )
   return content
 end
 return content
 end

-- ctan setup
docfiles = {"tagpdf.tex",
            "tagpdf-code.tex",
            "tagpdfdocu-patches.sty",
            "tagpdfsetup-keys.tex",
            "tagpdf-docelements.tex",
            "tagpdf.bib",
            "link-figure-input.tex",
            "pac3.PNG",
            "pac2024-version.png",
            "pac2024-report.png",
            "acrobat.png",
            "global-ex.png",
            "examples/mc/ex-*.tex",
            "examples/mc/ex-*.pdf",
            "examples/structure/ex-*.tex",
            "examples/structure/ex-*.pdf",
            "examples/other/ex-*.tex",
            "examples/other/ex-*.pdf",
            }

textfiles= {"doc/CTANREADME.md"}
binaryfiles = {"*.pdf", "*.png", "*.PNG", "*.zip"}

ctanreadme= "CTANREADME.md"

typesetexe = "lualatex-dev"
packtdszip   = false
installfiles = {
                "**/*.sty",
                "**/*.def",
                "**/*.csv",
                "**/*.lua",
                "**/*.ltx",
               }

sourcefiles  = {"*.dtx",
                "*.ins",
                --"*.sty",
                --"*.def",
                --"**/*.lua"                
               }



typesetfiles =
 {
   "tagpdf.tex","tagpdf-code.tex",
   "ex-*.tex",
--   "tagpdf-tree.dtx",
--   "tagpdf-checks.dtx",
--   "tagpdf-space.dtx",
--   "tagpdf-roles.dtx",
--   "tagpdf-mc.dtx",
--   "tagpdf-struct.dtx",
--   "tagpdf-user.dtx",
--   "tagpdf.dtx"
 }

typesetruns = 5
