# Changelog
All notable changes to the `tagpdf` package since the 
2021-04-22 will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
this project uses date-based 'snapshot' version identifiers.

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
