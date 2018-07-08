-- Packageversion: 0.1 
-- Packagedate: 2018/07/04
-- tagpdf.lua
-- Ulrike Fischer

--[[
The code has quite probably a number of problems
 - more variables should be local instead of global
 - the naming is not always consistent due to the development of the code
 - the traversing of the shipout box must be tested with more complicated setups
 - it should probably handle more node types
 - 
--]]



--[[
the main table is named uftag. It contains the functions and also the data
collected during the compilation.

uftag.mc     will contain mc connected data.
uftag.struct will contain structure related data.
uftag.page   will contain page data
uftag.tables contains also data from mc and struct (from older code). This needs cleaning up. 
             There are certainly dublettes, but I don't dare yet ...
uftag.func   will contain (public) functions. 
uftag.trace  will contain tracing/loging functions.
local funktions starts with __

functions
 uftag.func.get_num_from (tag):    takes a tag (string) and returns the id number
 uftag.func.output_num_from (tag): takes a tag (string) and prints (to tex) the id number
 uftag.func.get_tag_from (num):    takes a num and returns the tag
 uftag.func.output_tag_from (num): takes a num and prints (to tex) the tag
 uftag.func.store_mc_data (num,key,data): stores key=data in uftag.mc[num] 
 uftag.func.store_mc_label (label,num): stores label=num in uftag.mc.labels
 uftag.func.store_mc_kid (mcnum,kid,page): stores the mc-kids of mcnum on page page
 uftag.func.store_mc_in_page(mcnum,mcpagecnt,page): stores in the page table the number of mcnum on this page
 uftag.func.store_struct_mcabs (structnum,mcnum): stores relations structnum<->mcnum (abs)
 uftag.func.mc_insert_kids (mcnum): inserts the /K entries for mcnum by wandering throught the [kids] table
 uftag.func.mark_page_elements(box,mcpagecnt,mccntprev,mcopen,name,mctypeprev) : the main function 
 uftag.func.mark_shipout (): a wrapper around the core function which inserts the last EMC
 uftag.func.fill_parent_tree_line (page): outputs the entries of the parenttree for this page
 uftag.func.output_parenttree(): outputs the content of the parenttree
 uftag.trace.show_mc_data (num): shows uftag.mc[num] 
 uftag.trace.show_all_mc_data (max): shows a maximum about mc's
 uftag.trace.show_seq: shows a sequence (array)
 uftag.trace.show_struct_data (num): shows data of structure num
 uftag.trace.show_prop: shows a prop 
 uftag.trace.log
--]]

local mctypeattributeid   = luatexbase.registernumber ("g__uftag_mc_type_attr")
local mccntattributeid    = luatexbase.registernumber ("g__uftag_mc_cnt_attr")

local catlatex       = luatexbase.registernumber("catcodetable@latex")
local tagunmarkedbool= token.create("g__uftag_tagunmarked_bool")
local truebool       = token.create("c_true_bool") 

local tableinsert    = table.insert 

-- not all needed, copied from lua-visual-debug.
local nodeid           = node.id
local nodecopy         = node.copy
local nodegetattribute = node.get_attribute
local nodenew          = node.new
local nodetail         = node.tail
local nodeslide        = node.slide
local noderemove       = node.remove
local nodetraverseid   = node.traverse_id
local nodeinsertafter  = node.insert_after
local nodeinsertbefore = node.insert_before
local pdfpageref       = pdf.pageref 

local HLIST          = node.id("hlist")
local VLIST          = node.id("vlist")
local RULE           = node.id("rule")
local DISC           = node.id("disc")
local GLUE           = node.id("glue")
local KERN           = node.id("kern")
local PENALTY        = node.id("penalty")
local LOCAL_PAR      = node.id("local_par")
local MATH           = node.id("math")

local function __uftag_get_mathsubtype  (mathnode)
 if mathnode.subtype == 0 then
  subtype = "beginmath"
 else 
  subtype = "endmath"
 end  
 return subtype
end 



uftag                = uftag        or { }
uftag.mc             = uftag.mc     or  { } -- mc data
uftag.struct         = uftag.struct or  { } -- struct data
uftag.tables         = uftag.tables or  { } -- tables created with new prop and new seq. 
                                            -- wasn't a so great idea ...
uftag.page           = uftag.page   or  { } -- page data, currently only i->{0->mcnum,1->mcnum,...}  
uftag.trace          = uftag.trace  or  { } -- show commands
uftag.func           = uftag.func   or  { } -- functions 
uftag.conf           = uftag.conf   or  { } -- configuration variables

local __uftag_log = 
 function (message,loglevel)
  if (loglevel or 3) <= tex.count["l__uftag_loglevel_int"] then
   texio.write_nl("tagpdf: ".. message)
  end
 end 

uftag.trace.log = __uftag_log


local __uftag_get_mc_cnt_type_tag = function (n)
  local mccnt      =  nodegetattribute(n,mccntattributeid)  or -1
  local mctype     =  nodegetattribute(n,mctypeattributeid)  or -1
  local tag        =  uftag.func.get_tag_from(mctype)
  return mccnt,mctype,tag
end


local function __uftag_insert_emc_node (head,current)
 local emcnode = nodenew("whatsit","pdf_literal")
       emcnode.data = "EMC"
       emcnode.mode=1
       head = node.insert_before(head,current,emcnode)
 return head
end


local function __uftag_insert_bmc_node (head,current,tag)
 local bmcnode = nodenew("whatsit","pdf_literal")
       bmcnode.data = "/"..tag.." BMC"
       bmcnode.mode=1
       head = node.insert_before(head,current,bmcnode)
 return head
end

local function __uftag_insert_bdc_node (head,current,tag,dict)
 local bdcnode = nodenew("whatsit","pdf_literal")
       bdcnode.data = "/"..tag.."<<"..dict..">> BDC"
       bdcnode.mode=1
       head = node.insert_before(head,current,bdcnode)
 return head
end


--[[
    Now follows the core function
    It wades through the shipout box and checks the attributes
    ARGUMENTS
    box: is a box, 
    mcpagecnt: num, the current page cnt of mc (should start at -1 in shipout box), needed for recursion
    mccntprev: num, the attribute cnt of the previous node/whatever - if different we have a chunk border
    mcopen: num, records if some bdc/emc is open 
    These arguments are only needed for log messages, if not present are replaces by fix strings:
    name: string to describe the box
    mctypeprev: num, the type attribute of the previous node/whatever
    
    there are lots of logging messages currently. Should be cleaned up in due course.
    One should also find ways to make the function shorter.
--]]

local space_node = node.new'glyph'
space_node.char = (' '):byte(1)
space_node.font = font.current()

function uftag.func.mark_page_elements (box,mcpagecnt,mccntprev,mcopen,name,mctypeprev)
  local name = name or ("SOMEBOX")
  local mctypeprev = mctypeprev or -1
  local abspage = tex.count["g__uftag_abspage_int"]  --["c@abspage"]
  uftag.trace.log ("PAGE " .. abspage,3)
  uftag.trace.log ("FUNC ARGS: pagecnt".. mcpagecnt.." prev "..mccntprev .. " type prev "..mctypeprev,4)
  uftag.trace.log ("TRAVERSING BOX ".. tostring(name).." TYPE ".. node.type(node.getid(box)),3) 
  local head = box.head -- AtBeginShipoutBox is a vlist?
  if head then
    mccnthead, mctypehead,taghead = __uftag_get_mc_cnt_type_tag (head)
    uftag.trace.log ("HEAD " .. node.type(node.getid(head)).. " MC"..tostring(mccnthead).." => TAG "..tostring(mctypehead).." => "..tostring(taghead),3) 
  else
    uftag.trace.log ("HEAD is ".. tostring(head),3)
  end  
  for n in node.traverse(head) do
    local mccnt, mctype, tag = __uftag_get_mc_cnt_type_tag (n)
    uftag.trace.log ("NODE ".. node.type(node.getid(n)).." MC"..tostring(mccnt).." => TAG "..tostring(mctype).." => " .. tostring(tag),3)
    if n.id == HLIST
    then -- enter the hlist
     mcopen,mcpagecnt,mccntprev,mctypeprev= 
      uftag.func.mark_page_elements (n,mcpagecnt,mccntprev,mcopen,"INTERNAL HLIST",mctypeprev)
    elseif n.id == VLIST then -- enter the vlist     
     mcopen,mcpagecnt,mccntprev,mctypeprev= 
      uftag.func.mark_page_elements (n,mcpagecnt,mccntprev,mcopen,"INTERNAL VLIST",mctypeprev)
    elseif n.id == GLUE then
      if n.subtype == 13 then -- spaceskip
        local space
        head, space = node.insert_before(head, n, node.copy(space_node)) -- Set the right font
        n.width = n.width - space.width
        space.attr = n.attr
      end
    elseif n.id == LOCAL_PAR then  -- local_par is ignored 
    elseif n.id == PENALTY then    -- penalty is ignored
    elseif n.id == KERN then       -- kern is ignored
    else
     -- math is currently only logged. 
     -- we could mark the whole as math
     -- for inner processing the mlist_to_hlist callback is probably needed.
     if n.id == MATH then       
      uftag.trace.log("NODE "..node.type(node.getid(n)).." "..__uftag_get_mathsubtype(n),3)
     end
     -- endmath
     uftag.trace.log("CURRENT "..mccnt.." PREV "..mccntprev,3)
     if mccnt~=mccntprev then -- a new mc chunk
      uftag.trace.log ("NODE ".. node.type(node.getid(n)).." MC"..tostring(mccnt).." <=> PREVIOUS "..tostring(mccntprev),3)
      if mcopen~=0 then -- there is a chunk open, close it (hope there is only one ...
       box.list=__uftag_insert_emc_node (box.list,n)
       mcopen = mcopen - 1
       uftag.trace.log ("INSERT EMC " .. mcpagecnt .. " MCOPEN = " .. mcopen,2)
       if mcopen ~=0 then
        uftag.trace.log ("!WARNING! open mc" .. " MCOPEN = " .. mcopen,1)
       end 
      end 
      if uftag.mc[mccnt] then
       if uftag.mc[mccnt]["artifact"] then
        uftag.trace.log("THIS IS AN ARTIFACT of type "..tostring(uftag.mc[mccnt]["artifact"]),3)
        if uftag.mc[mccnt]["artifact"] == "notype" then
         box.list = __uftag_insert_bmc_node (box.list,n,"Artifact")
        else
         box.list = __uftag_insert_bdc_node (box.list,n,"Artifact", "/Type /"..uftag.mc[mccnt]["artifact"])
        end
       else
        uftag.trace.log("THIS IS A TAG "..tostring(tag),3)  
        mcpagecnt = mcpagecnt +1
        uftag.trace.log ("INSERT BDC "..mcpagecnt,2)
        box.list = __uftag_insert_bdc_node (box.list,n,tag, "/MCID "..mcpagecnt)
        uftag.func.store_mc_kid (mccnt,mcpagecnt,abspage)
        uftag.func.store_mc_in_page(mccnt,mcpagecnt,abspage)
        uftag.trace.show_mc_data (mccnt)
       end 
       mcopen = mcopen + 1
      else
       uftag.trace.log("THIS HAS NOT BEEN TAGGED",1)
     -- perhaps code that tag a artifact can be added ...  
       if tagunmarkedbool.mode == truebool.mode then
        box.list = __uftag_insert_bmc_node (box.list,n,"Artifact")
       end 
       mcopen = mcopen + 1
      end
      mccntprev = mccnt
     end  
    end -- end if
  end -- end for
  if head then
    mccnthead, mctypehead,taghead = __uftag_get_mc_cnt_type_tag (head)
    uftag.trace.log ("ENDHEAD " .. node.type(node.getid(head)).. " MC"..tostring(mccnthead).." => TAG "..tostring(mctypehead).." => "..tostring(taghead),3) 
  else
    uftag.trace.log ("ENDHEAD is ".. tostring(head),3)
  end  
  uftag.trace.log ("QUITTING TRAVERSING BOX ".. tostring(name).." TYPE ".. node.type(node.getid(box)),3)
 return mcopen,mcpagecnt,mccntprev,mctypeprev
end 

function uftag.func.mark_shipout ()
 mcopen = uftag.func.mark_page_elements (tex.box["AtBeginShipoutBox"],-1,-100,0,"Shipout",-1)
 if mcopen~=0 then -- there is a chunk open, close it (hope there is only one ...
  local emcnode = nodenew("whatsit","pdf_literal")
  local box = tex.box["AtBeginShipoutBox"].list 
  emcnode.data = "EMC"
  emcnode.mode=1
  if box then
     box = node.insert_after (box,node.tail(box),emcnode)
     mcopen = mcopen - 1
     uftag.trace.log ("INSERT LAST EMC, MCOPEN = " .. mcopen,2)
  else
     uftag.trace.log ("UPS ",1)
  end
  if mcopen ~=0 then
     uftag.trace.log ("!WARNING! open mc" .. " MCOPEN = " .. mcopen,1)
  end 
 end
end

function uftag.trace.show_seq (seq)
 if (type(seq) == "table") then
  for i,v in ipairs(seq) do 
   __uftag_log ("[" .. i .. "] => " .. tostring(v),1)
  end 
  else 
   __uftag_log ("sequence " .. tostring(seq) .. " not found",1)   
  end  
end 

local __uftag_pairs_prop =
 function  (prop)
      local a = {}
      for n in pairs(prop) do tableinsert(a, n) end
      table.sort(a)
      local i = 0                -- iterator variable
      local iter = function ()   -- iterator function
        i = i + 1
        if a[i] == nil then return nil
        else return a[i], prop[a[i]]
        end
      end
      return iter
  end


function uftag.trace.show_prop (prop)
 if (type(prop) == "table") then
  for i,v in __uftag_pairs_prop (prop) do
    __uftag_log ("[" .. i .. "] => " .. tostring(v),1)
  end 
 else 
   __uftag_log ("prop " .. tostring(prop) .. " not found or not a table",1)
 end 
 end 


local __uftag_get_num_from =  
 function (tag)
  if uftag.tables["g__uftag_role_tags_prop"][tag] then
    a= uftag.tables["g__uftag_role_tags_prop"][tag]
  else
    a= -1 
  end
  return a 
 end     
 
uftag.func.get_num_from = __uftag_get_num_from

function uftag.func.output_num_from (tag)
  local num = __uftag_get_num_from (tag)
  tex.sprint(catlatex,num)
  if num == -1 then
   __uftag_log ("Unknown tag "..tag.." used")
  end
end     
 
local __uftag_get_tag_from =
 function  (num)
  if uftag.tables["g__uftag_role_tags_seq"][num] then
   a = uftag.tables["g__uftag_role_tags_seq"][num]
  else
   a= "UNKNOWN"
  end
 return a
end

uftag.func.get_tag_from = __uftag_get_tag_from

function uftag.func.output_tag_from (num)
  tex.sprint(catlatex,__uftag_get_tag_from (num))
end   

function uftag.func.store_mc_data (num,key,data)
 uftag.mc[num] = uftag.mc[num] or { }
 uftag.mc[num][key] = data
 __uftag_log  ("storing mc"..num..": "..tostring(key).."=>"..tostring(data))
end

function uftag.trace.show_mc_data (num)
 if uftag and uftag.mc and uftag.mc[num] then
  for k,v in pairs(uftag.mc[num]) do
   __uftag_log  ("mc"..num..": "..tostring(k).."=>"..tostring(v),3)
  end
  if uftag.mc[num]["kids"] then
  __uftag_log ("mc" .. num .. " has " .. #uftag.mc[num]["kids"] .. " kids",3)
   for k,v in ipairs(uftag.mc[num]["kids"]) do
    __uftag_log ("mc ".. num .. " kid "..k.." =>" .. v.kid.." on page " ..v.page,3)
   end
  end
 else
  __uftag_log  ("mc"..num.." not found",3)   
 end
end

function uftag.trace.show_all_mc_data (max)
 for i = 1, max do 
  uftag.trace.show_mc_data (i)
 end
end 


function uftag.func.store_mc_label (label,num)
 uftag.mc["labels"] = uftag.mc["labels"] or { }
 uftag.mc.labels[label] = num
end

function uftag.func.store_mc_kid (mcnum,kid,page)
 uftag.trace.log("MC"..mcnum.." STORING KID" .. kid.." on page " .. page,3)
 uftag.mc[mcnum]["kids"] = uftag.mc[mcnum]["kids"] or { }
 local kidtable = {kid=kid,page=page}
 tableinsert(uftag.mc[mcnum]["kids"], kidtable )
end

function uftag.func.mc_insert_kids (mcnum)
  if uftag.mc[mcnum] then
  uftag.trace.log("MC-KIDS test " .. mcnum,4)
   if uftag.mc[mcnum]["kids"] then
    for i,kidstable in ipairs( uftag.mc[mcnum]["kids"] ) do
     local kidnum  = kidstable["kid"]
     local kidpage = kidstable["page"]
     local kidpageobjnum = pdfpageref(kidpage)
     uftag.trace.log("MC" .. mcnum .. " insert KID " ..i.. " with num " .. kidnum .. " on page " .. kidpage.."/"..kidpageobjnum,3)
     tex.sprint(catlatex,"<</Type /MCR /Pg "..kidpageobjnum .. " 0 R /MCID "..kidnum.. ">> " )
    end 
   else
    uftag.trace.log("WARN! MC"..mcnum.." has no kids",0)
   end
  else
   uftag.trace.log("WARN! MC"..mcnum.." doesn't exist",0)
  end
end


function uftag.func.store_struct_mcabs (structnum,mcnum)
 uftag.struct[structnum]=uftag.struct[structnum] or { }
 uftag.struct[structnum]["mc"]=uftag.struct[structnum]["mc"] or { }
 -- a structure can contain more than on mc chunk, the content should be ordered
 tableinsert(uftag.struct[structnum]["mc"],mcnum)
 -- but every mc can only be in one structure
 uftag.mc[mcnum]= uftag.mc[mcnum] or { }
 uftag.mc[mcnum]["parent"] = structnum 
end  

function uftag.trace.show_struct_data (num)
 if uftag and uftag.struct and uftag.struct[num] then
  for k,v in ipairs(uftag.struct[num]) do
   __uftag_log  ("struct "..num..": "..tostring(k).."=>"..tostring(v))
  end
 else 
  __uftag_log   ("struct "..num.." not found ") 
 end 
end

-- pay attention: lua counts arrays from 1, tex pages from one
-- mcid and arrays in pdf count from 0. 
function uftag.func.store_mc_in_page (mcnum,mcpagecnt,page)
 uftag.page[page] = uftag.page[page] or {}
 uftag.page[page][mcpagecnt] = mcnum 
 uftag.trace.log("PAGE " .. page .. ": inserting MCID " .. mcpagecnt .. " => " .. mcnum,3)
end

function uftag.func.fill_parent_tree_line (page)
     -- we need to get page-> i=kid -> mcnum -> structnum 
     -- pay attention: the kid numbers and the page number in the parent tree start with 0!
    local numsentry =""
    local pdfpage = page-1
    if uftag.page[page] and uftag.page[page][0] then
     mcchunks=#uftag.page[page] 
     uftag.trace.log("PAGETREE PAGE "..page.." has "..mcchunks.."+1 Elements ",3)  
     for i=0,mcchunks do
      uftag.trace.log("PAGETREE CHUNKS "..uftag.page[page][i],0)        
     end
     if mcchunks == 0 then 
      -- only one chunk so no need for an array
      local mcnum  = uftag.page[page][0] 
      local structnum = uftag.mc[mcnum]["parent"]
      local propname  = "g__uftag_struct_"..structnum.."_prop"
      local objnum   =  uftag.tables[propname]["objnum"] or "XXXX"
       texio.write_nl("=====>"..tostring(objnum))
      numsentry = pdfpage .. " ".. objnum .. " 0 R"
      uftag.trace.log("PAGETREE PAGE" .. page.. " NUM ENTRY = ".. numsentry,3)
     else
      numsentry = pdfpage .. " ["
       for i=0,mcchunks do
        local mcnum  = uftag.page[page][i]
        local structnum = uftag.mc[mcnum]["parent"]
        local propname  = "g__uftag_struct_"..structnum.."_prop"
        local objnum   =  uftag.tables[propname]["objnum"] or "XXXX"
        numsentry = numsentry .. " ".. objnum .. " 0 R"
       end
      numsentry = numsentry .. "] "
      uftag.trace.log("PAGETREE PAGE" .. page.. " NUM ENTRY = ".. numsentry,3)
     end  
    else
      uftag.trace.log ("PAGETREE: NO DATA FOR PAGE "..page,3)
    end
    return numsentry 
end

function uftag.func.output_parenttree (abspage)
 for i=1,abspage do
  line = uftag.func.fill_parent_tree_line (i) .. "^^J"
  tex.sprint(catlatex,line)
 end
end
