# Changelog
All notable changes to the `tagpdf` package since the
2021-04-22 will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
this project uses date-based 'snapshot' version identifiers.

## [2023-10-27]
Version: 0.98m

### Changed
 - use new LaTeX properties if available
 - change name of label to avoid problems with active underscore.
 - start to move x-type functions to e-type functions
 
### Fixed
 - debugging code for structures didn't correctly reflect later changes  
 
## [2023-08-30]
Version: 0.98l

### Changed
- use in generic mode the shipout keyword of \special/\pdfliteral if available

### Added
- \ShowTagging{debug/structures}

## [2023-08-04]
Version: 0.98k

### Changed

- adapted parent-child rule to new ISO 32005
- prepare for changes in the footnote code in latex-lab
- improved compatibility with dvilualatex.


## 2023-07-08
Version: 0.98j

### Changed
 - parent-child message
 
## 2023-06-14
Version: 0.98i
 
### Added
 - lua backend: added function to update attributes in a box.
 - new keywords struct `struct_abs` and `mc_abs` for `\tag_get:n`.
 - \tag_if_box_tagged:N to allow to test if stored boxes have tags.
 - \tag_mc_box_reset:N to reset the attributes in a box (lua mode).
 - a definition for \newlabeldata is provided in the aux-file to ease
   switch between tagged and untagged documents.
   
### Fixed
 - tagging of header/footer if fancyhdr is used: tagging is now correctly stopped. 
  
  
## 2023-06-06
Version: 0.98h

### Fixed
 - orphaned structures without parents are now turned into artifacts.
 - the namespace was not correctly restored after the end of a structure

## 2023-05-16
Version: 0.98g
 
### Changed
 - issue tree-mcid-index-wrong message only once 
   (https://github.com/latex3/latex2e/discussions/1010)
 - add line number to parent-child messages 
   (https://github.com/latex3/latex2e/discussions/1010)  
 - Document structure is always added.  

### Fixed
 - slow down because of an unneeded prop issue #75 
 - activate couldn't be used twice

## [2023-04-24]
Version: 0.98f
 
### Changed 
 - alt and actualtext: test if the value is empty and then do nothing.
 
### Fixed
 - Structure Element "Artifact" doesn't exist in pdf1.7, it is now mapped to NonStruct.
 - parent-child test didn't work if structure was moved with the parent key.
 
## [2023-03-07]
Version: 0.98e
 
### Changed 
 - the automatic paratagging uses now a two-level structure tpara/P
 
### Added
 - \tag_struct_end:n for better debugging 
 

## [2023-02-15]  
Version: 0.98d
 
### Fixed 
 - missing space in luatex, issue #66  

### Added
 - key texsource, a variant of AFinline-o, which creates an associated file
   with extension tex, mimetype application/x-tex, and AFRelationship Source.
 - First draft of \tag_tool:n, \tagtool: a generic interface for tagging related tasks.   
   

## [2023-01-30] 
Version: 0.98c
 
### Added 
 - \tag_check_child:nnTF to test if a tag is allowed as child.
 
### Fixed
 - empty attributes gave faulty PDF  

## [2023-01-24} 
Version: 0.98b
 
### Fixed
 - missing argument declarations in tagpdf-base, issue #65
 
### Added 
 - IDtree and option to retrieve the ID 

## [2022-12-28]
Version: 0.98a
 
### Fixed
 - parent-child test for NonStruct, Part, Div
 - tagging of sectioning in the documentation

## [2022-12-22] 

### Added 
 - started with dedicated latex name spaces
 - namespaces definitions have been externalized and are now read from files.   
 - rules to check if a tag is allowed as child in the current structure. If not allow
   a warning is issued, more messages can be activated with log=v. 
 - The data for namespaces and rules are in a new module, tagpdf-data.dtx.
 
### Changed 
 -  adding a new tag with add-new-tag now requires that the target role is 
    defined. Unknown roles error. 
 -  RoleMap object is no longer written in PDF 2.0 as it uses namespaces
 -  in pdf < 2.0 rolemaps are resolved to the PDF standard.   
 -  Structure destinations are used in PDF < 2.0 too -- they don't harm and
    can improve html export.
 -  \tagmcbegin no longer requires to use the tag key: the value from the surrounding
    structure will be used.   
 
## [2022-08-24]

### Fixed
 - title handling was faulty

### Changed 
 - internal adaptions to changes in l3backend 


## [2022-08-06]

### Fixed
 - \tag_get:n{struct_num} works now correctly in nested structures, and
   can be used if only tagpdf-base has been loaded.

### Changed
 - ref key can be used more than once and collect the values
 - alttext key has been renamed to alt, the older name is provided as alias
 - faster processing by avoiding type look up in pdftex and luatex
 - more commands are now provided by tagpdf-base.sty

### Added
 - \tag_struct_object_ref:n to reference the object ref of a structure.
 - a key parent to allow structures to choose their parent structure.
 - setup option paratag, which allows to change the tag name used for the
   automatically tagged paragraphs.
 - \tag_start:, \tag_stop:n and \tag_start:n to stop and start tagging for
   example in trial typesetting.
  

## [2022-05-29]

### Fixed
 - missing /Pg in /OBJR object (issue #53)
 - a hook was undeclared which didn't close the last structure.
 - interwordspace key not defined for all engines (issue #54)

### Changed
 - structure number is updated also in base
 - allow to access the current structure number

## [2022-05-11]

### Changed
 - attribute names are now passed through \pdf_name_from_unicode_e:n. This means slashes
   and spaces are allowed in the name.

### Added
  - \tag_stop: as companion to \tag_stop_group_begin:
  - tagpdf-base.sty with no-op versions of the main commands.

## [2022-01-13]

### Added

  - key `root-AF` which allows to add associated files to StructTreeRoot
  - support for structure destination. They will be added automatically
    if the engine supports them and the pdf version is 2.0 (unless they are actively suppressed).

### Fixed

 - Value of /AF should be an array
 - setting the meta key activate-all to false didn't work

### Removed
 - `\tagpdfifluatexT`, `\tagpdfifluatexTF`, `\tagpdfifpdftexT`.
    Use iftex or the expl3 commands instead.

## [2021-08-28]

### Added
 - code to close/reopen mc-chunks with pdftex over page breaks
 - header and footer are artifacts by default
 - mc-commands issue now marks to support paratagging with pdftex
 - commands to finish streams in pdftex
 - artifact accepts now also pagination/footer and pagination/header as value.
 - added a check with error if the begin and end para hooks don't match.

### Fixed
 - numbering in paratagging-show

### Removed
 - keys alttext-o and actualtext-o, the keys alttext and actualtext will now expand the
 value once.

## [2021-07-03]
### Fixed
 - undeclared variable, issue #609 in latex2e

## [2021-06-29]
### Changed
 - |\tag_finish_structure:| is no longer a public command.
 - lua mc-attributes are now global again
 - |\tagmcbegin| and |\tagmcend| not longer ignore/remove spaces.
 - space code has been separated and can be used without active tagging
 - code has been reviewed and documented, many internal corrections.
 - code is now in mostly one sty (with the exception of the mc-code)

### Removed
 - |check-tags| key. This is now done with the log-level.
 - |global-mc| key. No longer needed as attributes are global again.
 - user command  |\tagpdfget|, probably unneeded.

### Added
 - key |activate| which opens the main structure
 - |\ShowTagging| command for debugging.
 - code documentation

## [2021-06-14]
### Added
 - commands to add annotations to a structure
 - \tag_if_active: added

## [2021-05-14]
### Changed
 - \tagmcend no longer issues an \unskip in vertical mode. This disturbed
   to often spacing in unwanted places.
 - key `add-new-tag` has been extended to support the PDF 2.0 name spaces
 - key `tag` of \tagpdfstructbegin has been extended to support the
   PDF 2.0 name spaces

### Added
 - Support for PDF 2.0 name spaces.
 - keys paratagging and paratagging-show for automatic tagging of paragraphs,
   commands \tagpdfparaOn and \tagpdfparaOff to disable the automatic tagging.
   This requires a current latex-dev
 - The code to tag links has been moved from the documentation to the main
   package. Links are now tagged automatically (if hyperref or the commands
   from l3pdfannot are used). This requires a current latex-dev.
 - added commands \tag_mc_end_push: and \tag_mc_begin_pop:n which allow to "interrupt"
   a mc-chunk to insert some sub structure by moving the current tag onto a stack.
   This is for example used by the links.
 - a key |global-mc|. With  it in luamode the mc attributes are set globally.
   This allows to test the differences between both approaches.
