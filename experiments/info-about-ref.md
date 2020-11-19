# lists:
* __tagzrl
* __tagzrlstruct
* LastPage (from zref)

# contents of the lists:
### __tagzrlstruct, used when a structure is labeled

* tagstruct \c@g_@@_struct_abs_int
   unknown (in checks)
### __tagzrl
* tagabspage:  (could use abspage) \int_use:N \g_shipout_readonly_int, default 0
  -1
* tagmcabs     \c@g__tag_MCID_abs_int, absolut mcid counter (latex counter)
  empty, -1
* tagmcid      \g_@@_MCID_tmp_bypage_int

### LastPage (used attributes)
* tagmcabs to get the last mc. \c@g__tag_MCID_abs_int
* abspage   
  -1 (0 ginge auch)

# xref setup
\xref_attribute_gset:nnnn {@@_struct} {0}{now}    { \int_use:N \c@g_@@_struct_abs_int }
% replace by abspage?? 
\xref_attribute_gset:nnnn {@@_abspage}{0}{shipout}{ \int_use:N \g_shipout_readonly_int }
\xref_attribute_gset:nnnn {@@_mcabs } {0}{now}    { \int_use:N \c@g_@@_MCID_abs_int }
\xref_attribute_gset:nnnn {@@_mcid }  {0}{now}    { \int_use:N \g_@@_MCID_tmp_bypage_int }

\clist_const:Nn \c_@@_refmc_clist     %mc or empty??
\clist_const:Nn \c_@@_refstruct_clist

% faking the LastPage setting:
\cs_new_protected:Npn \@@_lastpagelabel:
  {
    \legacy_if:nT { @filesw }
      {
        \exp_args:NNnx \exp_args:NNx\iow_now:Nn \@auxout
           {
             \token_to_str:N \newlabeldata
               {@@_LastPage}
               { 
                 {abspage} { \int_use:N \g_shipout_readonly_int}
                 {@@_mcabs}{ \int_use:N \c@g_@@_MCID_abs_int }
               }
           }
      }
  }

\AddToHook{enddocument/afterlastpage}
 {\@@_lastpagelabel:}

# zref setup
\zref@newprop*{tagabspage}[0] { \int_use:N \g_shipout_readonly_int }
\zref@newprop {tagmcabs}  [0] { \int_use:N \c@g_@@_MCID_abs_int }
\zref@newprop {tagmcid}   [0] { \int_use:N \g_@@_MCID_tmp_bypage_int }
\zref@newprop {tagstruct} [0] { \int_use:N \c@g_@@_struct_abs_int }

\zref@newlist {@@zrl} %zrl=zreflist --> change name to zrlmc
\zref@newlist {@@zrlstruct}

\zref@addprop {@@zrl} {tagabspage}
\zref@addprop {@@zrl} {tagmcabs}
\zref@addprop {@@zrl} {tagmcid}

\zref@addprop {@@zrlstruct}{tagstruct}

\zref@addprop {LastPage} {tagmcabs}


# Code to label things


\zref@labelbylist{tagpdf-#1}{@@zrl}
\zref@labelbylist
  {
    mcid-\int_use:N \c@g_@@_MCID_abs_int
  }
  { @@zrl }

\zref@labelbylist{tagpdfstruct-\l_@@_struct_key_label_tl}{@@zrlstruct}

## zref version
\cs_new_protected:Npn \@@_ref_label:nn #1 #2 %#1 label, #2 name of list mc or struct
  {
     \zref@labelbylist{#1}{@@zrl#2}  
  }
  
## xref version  
\cs_generate_variant:Nn \xref_label:nn { nv }
\cs_new_protected:Npn \@@_ref_label:nn #1 #2 %#1 label, #2 name of list mc or struct
  {
     \xref_label:nv {#1}{c_@@_ref#2_clist}
  }

% xref doesn't expand the label so we need 
\cs_generate_variant:Nn \@@_ref_label:nn {en}

# Code to extract the values

% we need local options
\cs_if_exist:NF \xref_value:nnn 
  {
    \cs_new:Npn \xref_value:nnn #1#2#3
      {
        \exp_args:Nee \__xref_value:nnn { \tl_to_str:n {#1} } { \tl_to_str:n {#2} } {#3}
      }
    \cs_new:Npn \__xref_value:nnn #1#2#3
      {
        \tl_if_exist:cTF { g__xref_label_ #1 _ #2 _tl }
          { \tl_use:c { g__xref_label_ #1 _ #2 _tl } }
          {
            % test if attribute exist at all?
            #3
          }
      }
  }

% zref version
\cs_new:Npn \@@_ref_value:nnn #1 #2 #3
  {
    \zref@extractdefault {#1}{#2}{#3}
  }

% xref version
\cs_new:Npn \@@_ref_value:nnn #1 #2 #3
  {
    \xref_value:nnn {#1}{#2}{#3}
  }

\cs_generate_variant:Nn \@@_ref_value:nnn {enn}

%the last page label has a different name: LastPage with zref,
% @@_LastPage with xref, so we need a dedicted function here until this 
% is sorted

% zref version
\cs_new:Npn \@@_ref_value_lastpage:nn #1 #2
  {
    \zref@extractdefault {LastPage}{#1}{#2}
  }

% xref version
\cs_new:Npn \@@_ref_value_lastpage:nn #1 #2
  {
    \xref_value:nnn {@@_LastPage}{#1}{#2}
  }


\zref@extractdefault
          {LastPage}
          {abspage}
          {-1}
\zref@extractdefault
          {LastPage}
          {tagmcabs}
          {-1}
\zref@extractdefault
          {mcid-####1}
          {tagabspage}
          {-1}



\zref@newlabel{LastPage}{\default{1}\page{1}\abspage{1}\tagmcabs{2}}
\zref@newlabel{tagpdfstruct-blub}{\tagstruct{2}}
\zref@newlabel{mcid-1}{\tagabspage{1}\tagmcabs{1}\tagmcid{0}}


%mc-code


\cs_new:Nn \_@@_mc_handle_mc_label:n
  {
    \zref@labelbylist{tagpdf-#1}{@@zrl}
  }


% local default:

\cs_if_exist:NF \xref_value:nnn 
  {
    \cs_new:Npn \xref_value:nnn #1#2#3
      {
        \exp_args:Nee \__xref_value:nnn { \tl_to_str:n {#1} } { \tl_to_str:n {#2} } {#3}
      }
    \cs_new:Npn \__xref_value:nnn #1#2#3
      {
        \tl_if_exist:cTF { g__xref_label_ #1 _ #2 _tl }
          { \tl_use:c { g__xref_label_ #1 _ #2 _tl } }
          {
            % test if attribute exist at all?
            #3
          }
      }
  }
\prg_new_conditional:Npnn \xref_if:nn #1 #2 %#1 label, #2 attribute
 {
   \tl_if_exist:cTF { g__xref_label_ #1 _ #2 _tl }
     {
       \prg_return_true:
     }
     {
       \prg_return_false:
     } 
 }  

%main


%struct


%check
\zref@extractdefault
          {LastPage}
          {abspage}
          {-1}
\zref@extractdefault
          {LastPage}
          {tagmcabs}
          {-1}
\zref@extractdefault
          {mcid-####1}
          {tagabspage}
          {-1}
        %mc
        \zref@extractdefault %3 args
          {
            mcid-\int_use:N \c@g_@@_MCID_abs_int
          }
          { tagabspage }
          {-1}
                   \zref@extractdefault
                     {mcid-####1}
                     {tagmcid}
                     {-1}

    \zref@labelbylist
      {
        mcid-\int_use:N \c@g_@@_MCID_abs_int
      }
      { @@zrl }

\zref@extractdefault{tagpdf-#1}{tagmcabs}{} %#1 label name

%struct
\zref@extractdefault{mcid-#2}{tagabspage}{1}


\zref@extractdefault{tagpdfstruct-#1}{tagstruct}{unknown}
\zref@extractdefault{tagpdfstruct-#1}{tagstruct}{0}
\zref@extractdefault{tagpdfstruct-#1}{tagstruct}{0}

%tree
\zref@extractdefault{LastPage}{abspage}{100}
\zref@extractdefault{LastPage}{abspage}{-1}
\zref@extractdefault{LastPage}{tagmcabs}{-1}
\zref@extractdefault{mcid-####1}{tagabspage}{-1}
\zref@extractdefault{mcid-####1}{tagmcid}{-1}
