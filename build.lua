-- Build script for tagpdf
packageversion="0.50"
packagedate="2019/01/04"

module   = "tagpdf"
ctanpkg  = "tagpdf"

uploadconfig = {
  pkg     = ctanpkg,
  version = "v"..packageversion.." "..string.gsub (packagedate,"-", "/"),
  author  = "Ulrike Fischer",
  license = "lppl1.3c",
  summary = "Tools for experimenting with tagging using pdfLATEX and LuaLATEX",
  ctanPath = "/macros/latex/contrib/tagpdf",
  repository = "https://github.com/u-fischer/tagpdf",
  bugtracker = "https://github.com/u-fischer/tagpdf/issues",
  support    = "https://github.com/u-fischer/tagpdf/issues",
  uploader = "Ulrike Fischer",
  email    = "chess@nililand.de",
  update   = true ,
  topic=    "tagged-pdf",
  note     = [[Uploaded automatically by l3build...]],
  description=[[The package offers tools to experiment with tagging and accessibility using pdfLATEX and LuaTEX. It isn't meant for production but allows the user to try out how difficult it is to tag some structures; to try out how much tagging is really needed; to test what else is needed so that a pdf works e.g. with a screen reader. Its goal is to get a feeling for what has to be done, which kernel changes are needed, how packages should be adapted.]],
  announcement="This version adds code for attributes, attribute classes and interword space glyphs."              
}

checkengines = {"pdftex", "luatex"}
checkconfigs = {"build","config-pdftex","config-luatex"}
checkruns = 3
checksuppfiles = {"texmf.cnf"}

sourcefiledir = "./source"

tagfiles = {"source/*.md",
            "source/**/*.sty",
            "source/**/*.def",
            "source/**/*.lua",
            "source/*.tex",
            "README.md"}

function update_tag (file,content,tagname,tagdate)
 tagdate = string.gsub (packagedate,"-", "/")
 if string.match (file, "%.sty$" ) then
  content = string.gsub (content,  
                         "\\ProvidesExplPackage {(.-)} {.-} {.-}",
                         "\\ProvidesExplPackage {%1} {" .. tagdate.."} {"..packageversion .. "}")
  return content                         
 elseif string.match (file, "%.def$") then
  content = string.gsub (content,  
                         "\\ProvidesExplFile {(.-)} {.-} {.-}",
                         "\\ProvidesExplFile {%1} {" .. tagdate.."} {"..packageversion .. "}")                         
  return content 
 elseif string.match (file, "^README.md$") then
   content = string.gsub (content,  
                         "Version: %d%.%d+",
                         "Version: " .. packageversion )
   content = string.gsub (content,  
                         "version%-%d%.%d+",
                         "version-" .. packageversion ) 
   content = string.gsub (content,  
                         "for %d%.%d+",
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
                         "Packageversion: %d%.%d+",
                         "Packageversion: " .. packageversion )
   content = string.gsub (content,  
                         "Packagedate: %d%d%d%d/%d%d/%d%d",
                         "Packagedate: " .. tagdate )                      
   return content
 elseif string.match (file, "%.lua$" ) then
   content = string.gsub (content,  
                         "Packageversion: %d%.%d+",
                         "Packageversion: " .. packageversion )
   content = string.gsub (content,  
                         "Packagedate: %d%d%d%d/%d%d/%d%d",
                         "Packagedate: " .. tagdate )                      
   return content
 elseif string.match (file, "%.tex$" ) then
   content = string.gsub (content,  
                         "package@version{%d%.%d+}",
                         "package@version{" .. packageversion .."}" )
   content = string.gsub (content,  
                         "package@date{%d%d%d%d/%d%d/%d%d}",
                         "package@date{" .. packagedate .."}" )                      
   return content   
 end
 return content
 end

-- ctan setup
docfiles = {"source/tagpdf.tex","source/tagpdf.bib", "source/examples/**/*.tex", "source/examples/**/*.pdf"}
textfiles= {"source/CTANREADME.md"}

ctanreadme= "CTANREADME.md"

packtdszip   = false
installfiles = {
                "**/*.sty",
                "**/*.def",
                "**/*.lua"
               }  
               
sourcefiles  = {
                "**/*.sty",
                "**/*.def",
                "**/*.lua"
               }
                            
typesetfiles = {"tagpdf.tex"}

kpse.set_program_name ("kpsewhich")
if not release_date then
 dofile ( kpse.lookup ("l3build.lua"))
end
