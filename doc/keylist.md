# Keys of tagpdfsetup

## latex-lab-math
~~~~
math-tagging  =  
             mathml/writehash .code:n =  {... write template ...}
             mathml/setfiles .clist_set:N = \l__tag_math_mathml_files_clist,
             mathml/panel    .bool_set:N = \l__tag_math_mathml_panel_bool,
             mathml/panel    .initial:n = true,
             mathml/alt      .bool_set:N = \l__tag_math_alt_bool
             
             texsource/panel .bool_set:N = \l__tag_math_texsource_panel_bool, 
~~~~
             
## latex-lab-table  
~~~~           
table-tagging      .choice:     = true/false/layout     
table-header-rows  .clist_set:N = \l_@@_header_rows_clist  
~~~~

             
## tagpdf.dtx
~~~~
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
~~~~
    
    
##  tagpdf-roles
~~~~
mathml-tags .bool_gset:N = \g_@@_role_add_mathml_bool %if mathml->span should be written out 
add-new-tag    
~~~~

## tagpdf-spaces

~~~~
interwordspace    boolean   
show-spaces       boolean
~~~~

## tagpdf-struct

~~~~
root-AF   object name (file reference)
newattribute
~~~~

## tagpdf-user

~~~~
activate-socket .bool_set:N  = \l_@@_active_socket_bool,
activate .meta, 

paratagging .bool_set:N = \l_@@_para_bool,
paratagging-show .bool_set:N = \l_@@_para_show_bool,
paratag          .tl_set:N   = \l_@@_para_tag_tl
exclude-header-footer .choice: true/false/pagination (default true)
~~~~

# keys of debug option in documentmetadata

debug= 
     log= none|v|vv|vvv|all| passes to log of tagpdfsetup
     tagpdf loads tagpdfsetup
     xmpexport [= file] exports the xmp
     pdfmanagement deactivated pdfmanagement (is bound to break stuff)
     uncompress
     firstaidoff
     para = paratagging-show

# Sorting the tagpdfsetup keys

## activate key path

`activate` is used for keys that enable general, typically document wide tagging options related
to the PDF processing.

* make `activate-spacechar` alias for interwordspace 
* make `activate-struct-dest` alias/counterpart to `no-struct-dest`

~~~~
activate . meta:n

activate / spacechar 
activate / mc        (old: activate-mc)
activate / tree      (old: activate-tree)
activate / struct    (old: activate-struct)
activate / all       (old: activate-all)
activate / tagunmarked (old tagunmarked)
activate / socket (temporary until tagging-sockets are in the kernel)
activate / struct-dest
activate / mathml-tags (old mathml-tags, adds them to the global rolemap)
~~~~

## log, paratagging-show, show-spaces
new debug key to align with `\DocumentMetadata`-

~~~~
debug 
    show = {para,spaces,false}
    log  = {...}
    uncompress (not really needed anymore)
~~~~

Check: does both `debug / show=` and `debug={show=, log=}` work?   
    
    
## „document element“ keys

Currently we have keys for four document elements: `page`, `para`, `math`, `table`

### page key path

~~~~
page / tabsorder     (old tabsorder)
page / header-footer (old exclude header-footer)
~~~~

### para key path

~~~~
para / tagging .choice: = true/false (other options are possible)

para / text-tag = sets P-tag (old paratag)
para / unit-tag = sets text-unit-Tag 
~~~~

### math key path
~~~~
math  /  mathml-template (writes the template, old mathml/writehash)
math  /  mathml-files    (list of mathml-files to read)
math  /  mathml-panel    (show mathml-files in attachment panel)
math  /  texsource-panel (show texsource-files in attachment panel)
math  /  use-alt         (use the /Alt key, currently clashes with mathml-AF in foxit, so false
                          if mathml handling is activated)                                                            
~~~~
Perhaps later (currently not offered, as implicit or always true)

~~~~
math  /  mathml-AF       (activates reading of mathml-AF)
math  /  texsource-AF    (add texsource as AF)
~~~~

             
### table key path
~~~~           
table / tagging      .choice:       (true/false/layout, old: table-tagging)
table / header-rows  .clist_set:N   (old: table-header-rows)
~~~~

## add-new-tag, root-AF, newattribute, 

No idea yet so leave if alone currently
??


# Keys of tagtool

paratag .tl_set:N = \l_@@_para_tag_tl,
unittag .tl_set:N = \l_@@_para_main_tag_tl,
para-flattened .bool_set:N = \l_@@_para_flattened_bool


