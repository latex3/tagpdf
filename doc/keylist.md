# Keys of tagpdfsetup


## latex-lab-math
math-tagging  =  
             mathml/writehash .code:n =  {... write template ...}
             mathml/setfiles .clist_set:N = \l__tag_math_mathml_files_clist,
             mathml/panel    .bool_set:N = \l__tag_math_mathml_panel_bool,
             mathml/panel    .initial:n = true,
             mathml/alt      .bool_set:N = \l__tag_math_alt_bool
             
             texsource/panel .bool_set:N = \l__tag_math_texsource_panel_bool, 
             
## latex-lab-table             
table-tagging      .choice:     = true/false/layout     
table-header-rows  .clist_set:N = \l_@@_header_rows_clist  
             
## tagpdf.dtx

    activate-space  .bool_gset:N = \g_@@_active_space_bool,
    activate-mc     .bool_gset:N = \g_@@_active_mc_bool,
    activate-tree   .bool_gset:N = \g_@@_active_tree_bool,
    activate-struct .bool_gset:N = \g_@@_active_struct_bool,
    activate-all    .meta:n =
      {activate-mc={#1},activate-tree={#1},activate-struct={#1}},
    activate-all  .default:n = true,
    no-struct-dest .bool_gset_inverse:N = \g_@@_active_struct_dest_bool,

    log             .choice:, none, v,vv,vvv,all (\l_@@_loglevel_int and \@@_check_typeout_v:n),                 
    
    tagunmarked     .bool_gset:N = \g_@@_tagunmarked_bool,
    
    tabsorder       .choice: (row,column,*structure*, none)
    uncompress       
    
    
##  tagpdf-roles
mathml-tags .bool_gset:N = \g_@@_role_add_mathml_bool %if mathml->span should be written out 
add-new-tag    

## tagpdf-spaces

interwordspace    boolean   
          
show-spaces       boolean

## tagpdf-struct

root-AF   object name (file reference)
newattribute

## tagpdf-user

activate-socket .bool_set:N  = \l_@@_active_socket_bool,
activate .meta, sets activate-mc,activate-tree,activate-struct,activate-socket and sets `Document` as first structure.

paratagging .bool_set:N = \l_@@_para_bool,
paratagging-show .bool_set:N = \l_@@_para_show_bool,
paratag          .tl_set:N   = \l_@@_para_tag_tl
exclude-header-footer .choice: true/false/pagination (default true)

# keys of debug option in documentmetadata

debug= 
     log= none|v|vv|vvv|all| passes to log of tagpdfsetup
     tagpdf loads tagpdfsetup
     xmpexport [= file] exports the xmp
     pdfmanagement deactivated pdfmanagement (is bound to break stuff)
     uncompress
     firstaidoff
     para = paratagging-show

# Sorting the keys

## activate-XX, interwordspace

looks fine, active as meta key too.

activate-space should be made identical to
interwordspace (which can be deprecated).

## log, paratagging-show, show-spaces
new debug key

debug 
    show = {para,spaces,false}
    log  = {...}
    uncompress (not really needed anymore)
    
##  tagunmarked, tabsorder, no-struct-dest

low-level stuff, that normally isn't changed (perhaps with the    
exception ot tabsorder

## "content" key

para

math

table



# Keys of tagtool

paratag .tl_set:N = \l_@@_para_tag_tl,
unittag .tl_set:N = \l_@@_para_main_tag_tl,
para-flattened .bool_set:N = \l_@@_para_flattened_bool


