-- Build script for tagpdf
packageversion="0.1"
packagedate="2018/03/25"

module   = "tagpdf"
ctanpkg  = "tagpdf"

checkengines = {"pdftex", "luatex"}
checkconfigs = {"build"}
checkruns = 3

pdfext=""

sourcefiledir = "./source"

tagfiles = {"*.md",
            "texmf/tex/latex/tagpdf/*.sty",
            "texmf/tex/latex/tagpdf/*.def",
            "texmf/tex/latex/tagpdf/*.lua"}

function update_tag (file,content,tagname,tagdate)
 tagdate = string.gsub (tagdate,"-", "/")
 if string.match (file, "%.sty$" ) then
  content = string.gsub (content,  
                         "\\ProvidesExplPackage {(.-)} {.-} {.-}",
                         "\\ProvidesExplPackage {%1} {" .. tagdate.."} {"..tagname .. "}")
  return content                         
 elseif string.match (file, "%.def$") then
  content = string.gsub (content,  
                         "\\ProvidesExplFile {(.-)} {.-} {.-}",
                         "\\ProvidesExplFile {%1} {" .. tagdate.."} {"..tagname .. "}")                         
  return content                         
 elseif string.match (file, "%.md$") then
   content = string.gsub (content,  
                         "Packageversion: %d%.%d",
                         "Packageversion: " .. tagname )
   content = string.gsub (content,  
                         "Packagedate: %d%d%d%d/%d%d/%d%d",
                         "Packagedate: " .. tagdate )                      
   return content
 elseif string.match (file, "%.lua$" ) then
   content = string.gsub (content,  
                         "Packageversion: %d%.%d",
                         "Packageversion: " .. tagname )
   content = string.gsub (content,  
                         "Packagedate: %d%d%d%d/%d%d/%d%d",
                         "Packagedate: " .. tagdate )                      
   return content
 end
 return content
 end

kpse.set_program_name ("kpsewhich")
if not release_date then
 dofile ( kpse.lookup ("l3build.lua"))
end
