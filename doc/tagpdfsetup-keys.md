# Sorting the tagpdfsetup keys

The keys are split in a number of key paths. 

## Unhandled key

root-AF (in tagpdf-struct)

## activate key path

`activate` is used for keys that enable general, typically document wide tagging options related
to the PDF processing.

```
activate .meta:n
OK activate/spaces    (boolean, old interwordspace) in tagpdf-space.dtx
OK activate/mc        (boolean, old: activate-mc)
OK activate/tree      (boolean, old: activate-tree)
OK activate/struct    (boolean, old: activate-struct)
OK activate/all       (boolean, old: activate-all)
OK activate/tagunmarked (boolean, old: tagunmarked)
activate/socket (boolean, temporary until tagging-sockets are in the kernel)
activate/struct-dest (boolean, old: no-struct-dest)
activate/mathml-tags (boolean, old: mathml-tags, adds them to the global rolemap)
activate/latex-namespace (boolean, default true)
```

## debug key path

The (new) debug key aligns various logging and debugging option with the debug key
of `\DocumentMetadata`-

```
debug/show = {para,spaces,paraOff,spacesOff} (old: paratagging-show, show-spaces)
debug/log  = v|vv|vvv|none|all   (old: log) 
debug/uncompress  (old: uncompress, not really needed anymore) 
```

Check: does both `debug / show=` and `debug={show=, log=}` work?

## role key path

These are keys related to tags and attribute names.

```
role/new-tag       (old: add-new-tag)
role/new-attribute (old: newattribute)
role/mathml-tags   (old: mathml-tags)  
role/tagset (choice, default is latex, with pdf only PDF-tags are used)
```

## viewer keys 

viewer keys influence some display options in a pdf viewer. There is an overlap with
similar "non-tagging" options. 

```
OK/math viewer/pane/mathml     show mathml-files in attachment pane (old mathml-panel)
OK/math viewer/pane/mathsource show math sources files in attachment pane (old texsource-panel)
TODO viewer/display-title   
``` 

## „Document element“ keys

Currently we have setup keys for four document elements: `page`, `para`, `math`, `table`.


### page key path

```
page/tabsorder     (old tabsorder)
page/exclude-header-footer (old exclude-header-footer)
```

### para key path

```
para/tagging .choice: = true/false (other options are possible)

para/text-tag = sets P-tag (old paratag)
para/unit-tag = sets text-unit-Tag 
```

### math key path

Key definitions are in latex-lab-math

```
OK math/mathml/write-dummy (no value, activates the writing of the template, old mathml/writehash)
OK math/alt/use            (boolean, use the /Alt key, currently clashes with mathml-AF in foxit, so false
                          if mathml handling is activated)  
OK math/mathml/sources  (additional clist of mathml-files to read)
OK math/mathml/AF       (boolean, TODO, attach mathml-AF)
OK math/tex/AF       (boolean, TODO, attach texsource as AF)
TODO math/alt/type = source|manual|     (later)                                                                               
```



### table key path

key definitions are in latex-lab-table.dtx

```           
OK table/tagging      .choice:       (true/false/layout, old: table-tagging)
OK table/header-rows  .clist_set:N   (old: table-header-rows)
```

## Example

`\tagpdfsetup{debug/log = vv, debug/show = para, table/tagging = layout, math/mathml-template}` 
