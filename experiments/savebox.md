# About tagging when storing/reusing boxes

## Differences between pdftex and luatex

With pdflatex `\tagmcbegin` inserts a BDC literal into the stream and it 
records the current MC-number as a kid in the current structure. `\tagmcend` 
adds an EMC literal. 

With lualatex `\tagmcbegin` sets a (global) attribute which marks all 
following nodes and it records that nodes with this attribute should be added 
as kid into the current structure. `\tagmcend` unsets the attribute, 
following nodes are then unmarked (which normally means they will be marked 
as artifacts). The literals are inserted when the page is post processed at 
shipout.

With pdflatex it important that the same number of begin and end literals are 
inserted and that they are correctly (not) nested and correctly surround all 
the content. For every `\tagmcbegin` there must be a `\tagmcend`. The code 
warn therefore if two `\tagmcbegin` are used without intermediate `\tagmcend` 
(*nested marked content found*, *there is no mc to end*), but when boxes are 
stored and reused these warnings are often not correct, see below. 

With lualatex the `\tagmcend` can often be omitted and so nesting is not 
checked. 

## setbox without inner tagging commands

The following uses the shortcut \savebox{text} for something like 
\setbox\mybox\hbox{text} and \usebox for \copy\mybox. 
 
### pdflatex

With pdftex this simply works as expect. One can do \sbox0\hbox{hello} and 
then use the box everywhere and as often as wanted. 

So

~~~~ 

para 1 \savebox{hello}\usebox monde  

para 2 \usebox welt 

para 3 \usebox world 

~~~~

will give the following structure 

~~~~~

para 1 hello monde 

para 2 hello welt

para 3 hello world

~~~~~  


### lualatex

With lualatex a saved box and its nodes are marked with the currently active 
attributes and it therefore belongs to the currently active structure.

So

~~~~ 

para 1 \savebox{hello}\usebox monde

para 2 \usebox welt

para 3 \usebox world

~~~~

will give the following structure 

~~~~~ 

para 1 hello monde hello hello 

para 2 welt

para 3 world

~~~~~  

### Fixing lualatex

There are two options. 

* At first, before the box is used the MC-attributes can be reset: 

~~~~ 
para 2 \tag_mc_reset_box:N \mybox \usebox welt 
~~~~

* At second, if the box is used only once,
the box can be gives it own special attributes which are not 
recorded directly but stashed and used later:

~~~~ 
para 1 \tagmcbegin{stash,label=X}\savebox{hello}\tagmcbegin{} monde 
  
para 2 \tagmcuse{X}\usebox welt 
~~~~
 
## Box with inner MC-commands

Lets now look at the box `\savebox{\tagmcbegin{}hello\tagmcend}`.

### pdflatex

If the box is saved in a normal paragraph (in hmode) the code will see two 
`\tagmcbegin` in a row and issue a warning about nested mc. This warning is 
actually wrong, as the place where the literals are saved is not of 
importance, what matters is where the box is used. In vmode there is no 
warning. In both cases the MC are recorded as kids in the current structure. 
In case the box is in vmode on the main galley this leads to faulty a
parent-child relation as `Document` does not allow direct content as kid.

Similar to the lualatex example above, it is possible to stash the MC and use 
it later, but only once. When inserting the box the surrounding code has to 
ensure that the MC are correctly nested. Inside a paragraph this means 
additional MC-commands are needed: 

~~~~ 

\savebox{\tagmcbegin{stash,label=blub}hello\tagmcend} 
 
para1 \tagmcend\tagmcuse{blub}\usebox\tagmcbegin{} welt

~~~~ 

In vmode some structure would be enough:

~~~~ 

\savebox{\tagmcbegin{stash,label=blub}hello\tagmcend} 
 
\tagstructbegin{tag=Part}\tagmcuse{blub}\usebox\tagstructend

~~~~

 
