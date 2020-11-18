# lists:
* __tagzrl
* __tagzrlstruct
* LastPage (from zref)

# contents of the lists:
### __tagzrlstruct, used when a structure is labeled

* tagstruct \c@g_@@_struct_abs_int

### __tagzrl
* tagabspage:  (could use abspage) \int_use:N \g_shipout_readonly_int, default 0
* tagmcabs     \c@g__tag_MCID_abs_int, absolut mcid counter (latex counter)
* tagmcid      \g_@@_MCID_tmp_bypage_int

### LastPage (used attributes)
* tagmcabs to get the last mc. \c@g__tag_MCID_abs_int
* abspage   

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
\cs_new_protected:Npn \@@_label:nn #1 #2 %#1 label, #2 name of list mc or struct
  {
     \zref@labelbylist{#1}{@@zrl#2}  
  }
  
## xref version  
\cs_generate_variant:Nn \xref_label:nn { nv }
\cs_new_protected:Npn \@@_label:nn #1 #2 %#1 label, #2 name of list mc or struct
  {
     \xref_label:nv {#1}{c_@@_ref#2_clist}
  }

\zref@newlabel{LastPage}{\default{1}\page{1}\abspage{1}\tagmcabs{2}}
\zref@newlabel{tagpdfstruct-blub}{\tagstruct{2}}
\zref@newlabel{mcid-1}{\tagabspage{1}\tagmcabs{1}\tagmcid{0}}


%mc-code


\cs_new:Nn \_@@_mc_handle_mc_label:n
  {
    \zref@labelbylist{tagpdf-#1}{@@zrl}
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
