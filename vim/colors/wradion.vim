set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

" Set environment to 256 colours
set t_Co=256

let colors_name = "wradion"

if version >= 700
  hi CursorLine     guibg=#1c1c1c ctermbg=234 cterm=none
  hi CursorColumn   guibg=#1c1c1c ctermbg=234
  hi MatchParen     guifg=#ff0000 guibg=#303030 ctermfg=196 ctermbg=236 cterm=bold
  hi Pmenu          guifg=#eeeeee guibg=#303030 ctermfg=255 ctermbg=236
  hi PmenuSel       guifg=#eeeeee guibg=#808080 ctermfg=255 ctermbg=244
endif

" Background and menu ColorColumns
hi Cursor           guifg=#ffffff guifg=#666666 ctermfg=255 ctermbg=241
hi Normal           guifg=#e4e4e4 guibg=#1c1c1c ctermfg=254 ctermbg=233 cterm=none
hi Search           guifg=#af00ff guibg=#ffd7ff ctermfg=129 ctermbg=225 cterm=bold

hi ColorColumn      guibg=#080808 ctermbg=232

hi NonText          guifg=#585858 guibg=#080808 ctermfg=240 ctermbg=232 cterm=none
hi LineNr           guifg=#8a8a8a guibg=#262626 ctermfg=245 ctermbg=235 cterm=none
hi CursorLineNr     guifg=#ffffff guibg=#585858 ctermfg=231 ctermbg=240 cterm=bold
hi VertSplit        guifg=#000000 guibg=#000000 ctermfg=255 ctermbg=255 cterm=none
hi Visual           guifg=#1c1c1c guibg=#585858 ctermfg=233 ctermbg=240 cterm=none

hi Folded           ctermfg=255 ctermbg=16 cterm=none
hi SpecialKey       ctermfg=211 ctermbg=233 cterm=none

hi DiffChange       guifg=#0087ff guibg=#1c1c1c ctermfg=33  ctermbg=233 cterm=bold
hi DiffAdd          guifg=#00af00 guibg=#1c1c1c ctermfg=34  ctermbg=233 cterm=bold
hi DiffDelete       guifg=#ff0000 guibg=#1c1c1c ctermbg=196 ctermfg=233 cterm=bold
hi DiffText         guifg=#5fffff guibg=#1c1c1c ctermbg=87  ctermfg=233 cterm=bold

hi TabLineFill      guifg=#ffff87 guibg=#262626 ctermfg=228 ctermbg=235 cterm=none
hi TabLineSel       guifg=#87af87 ctermfg=108 cterm=bold

" Syntax highlighting
hi Comment          guifg=#6c6c6c ctermfg=242 cterm=none

hi Constant         guifg=#ff5faf ctermfg=205 cterm=none
hi String           guifg=#5fd75f ctermfg=77 cterm=none
hi Character        guifg=#5fd75f ctermfg=77 cterm=none
hi Number           guifg=#ff8700 ctermfg=208 cterm=none
hi Boolean          guifg=#00cdcd ctermfg=cyan cterm=bold
hi rubyPseudoVariable guifg=#949494 ctermfg=246

hi Identifier       guifg=#d7d75f ctermfg=185 cterm=bold
hi Function         guifg=#8787ff ctermfg=105 cterm=bold
hi rubyBlockParameter guifg=#ffd700 ctermfg=220
hi rubyBlockParameterList guifg=#ffd700 ctermfg=220 cterm=bold

hi Statement        guifg=#949494 ctermfg=246 cterm=none
hi Operator         guifg=#ffd700 ctermfg=220
hi rubyAttribute    guifg=#5fd7ff ctermfg=81

hi Define           guifg=#949494 ctermfg=246
hi rubyControl      guifg=#949494 ctermfg=246

hi rubyRailsRakeMethod            ctermfg=81
hi rubyRailsARAssociationMethod   ctermfg=81
hi rubyRailsARCallbackMethod      ctermfg=81
hi rubyRailsFilterMethod          ctermfg=81
hi rubyRailsARMethod guifg=#e4e4e4 ctermfg=254
hi rubyRailsMethod   guifg=#e4e4e4 ctermfg=254

hi Type             guifg=#d75f5f ctermfg=167 cterm=bold

hi Special          guifg=#5fd75f ctermfg=77 cterm=none
hi Delimiter        guifg=#5fd75f ctermfg=77 cterm=none
hi Tag              cterm=underline

hi Todo             guifg=#ffd700 guibg=#1c1c1c ctermfg=220 ctermbg=233 cterm=underline
