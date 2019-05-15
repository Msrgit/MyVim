set nocompatible              " required

so ~/.vim/plugins.vim

syntax enable

colorscheme industry                 "Set the colorscheme

let mapleader=","                  "Change default map command leader to ','

"============SplitManagement==============
" split defaults
set splitbelow
set splitright

" split navigations
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>





"============Visuals==============
set t_CO=256





"============Search==============
set hlsearch
set incsearch





"============Mappings==============

"Make it easy to edit the .vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>es :e ~/.vim/snippets/

"Remove search highlighting with comma space
nmap <Leader><space> :nohlsearch<cr>

"Toggle NERDTree
nmap <Leader>tn :NERDTreeToggle<cr>





"============AutoCommands==========

augroup fred
				autocmd!
				"Source .vimrc when we write it
				autocmd BufWritePost .vimrc source %

augroup END

				"Start NERDTree when vim starts
				"autocmd VimEnter * NERDTree

"============Plugins==========
"
" CtrlP
"
let g:ctrlp_custom_ignore='node_modules\|git'

"
" greplace.vim
"
set grepprg=ag

let g:grep_cmd_opts = '--line-numbers --noheading'



"
"Nerdtree
"
let g:NERDTreeDirArrows=0
let NERDTreeIgnore=['\.pyc$', '\~$']
let NERDTreeHijackNetrw=0


"
" vim-php-namespace
"
function! IPhpInsertUse()
				    call PhpInsertUse()
						    call feedkeys('a',  'n')
				endfunction
				autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
				autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
				    call PhpExpandClass()
						    call feedkeys('a', 'n')
				endfunction
				autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
				autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

				vmap <leader>su ! awk '{print length(), $0 \| "sort -n \| cut -d \" \" -f2-" }'<cr>

"
"UltiSnips
"
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsSnippetsDir = $HOME . "/.vim/UltiSnips"

autocmd BufNewFile,BufRead *.blade.php setlocal ft=html.blade

"
" MultiCursors
"
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-b>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"
" vim-test
"
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

"============Functions===============

function! GetAllSnippets()
  call UltiSnips#SnippetsInCurrentScope(1)
  let list = []
  for [key, info] in items(g:current_ulti_dict_info)
    let parts = split(info.location, ':')
    call add(list, {
      \"key": key,
      \"path": parts[0],
      \"linenr": parts[1],
      \"description": info.description,
      \})
  endfor
  return list
endfunction

nmap <Leader>ls :call GetAllSnippets()<cr>


" Prepare a new PHP class
function! Class()
    let name = input('Class name? ')
    let namespace = input('Any Namespace? ')

    if strlen(namespace)
        exec 'normal i<?php namespace ' . namespace . ';'
    else
        exec 'normal i<?php'
    endif

    " Open class
    exec 'normal iclass ' . name . ' {^M}^[O^['
    
    exec 'normal i^M    public function __construct()^M{^M ^M}^['
endfunction
nmap ,1  :call Class()<cr>

" Add a new dependency to a PHP class
function! AddDependency()
    let dependency = input('Var Name: ')
    let namespace = input('Class Path: ')

    let segments = split(namespace, '\')
    let typehint = segments[-1]

    exec 'normal gg/construct^M:H^Mf)i, ' . typehint . ' $' . dependency . '^[/}^>O$this->^[a' . dependency . ' = $' . dependency . ';^[?{^MkOprotected $' . dependency . ';^M^[?{^MOuse ' . namespace . ';^M^['

    " Remove opening comma if there is only one dependency
    exec 'normal :%s/(, /(/g
'
endfunction
nmap ,2  :call AddDependency()<cr>


"============LaravelSpecifics===============




"============PiScreenSpecifics=============
nmap <Leader>pg :e ~/PiScreen/scripts/go.sh<cr>
nmap <Leader>pl :e ~/PiScreen/scripts/loop.sh<cr>



set backspace=indent,eol,start       "Make backspace play nicely

" Enable folding
set foldmethod=indent
set foldlevel=99

set number
set relativenumber
" Enable folding with the spacebar
nnoremap <space> za
let g:SimplyFold_docstring_preview=1

inoremap jk <esc>
inoremap kj <esc>
vmap jk <esc>  
vmap kj <esc>  
set mouse=a
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set autoindent
set copyindent
set smarttab
set smartindent
set showmode

" Notes and tips
"
"  % indicates the current file in any command
"
"  gg goes to the top of the file
"
"  G goes to the bottom of the file
"
"  zz Centres the current line with the curson
"
"  ,<space> gets rid of search highlight
"
"  <c-w>| increases the current vs (vertically split) window to maximum size
"  <c-w>= makes the two vs windows the same size
"
"  <c-^> goes the previous edit point
"
"  vinegar:
"  - to show the files
"  d to make a directory
"  % to create a new file
"  I to toggle through various views
"  . to prepopulate the filename
"
"  
