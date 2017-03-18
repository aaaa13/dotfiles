"dein Scripts----------------------------- 
" curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
" sh ./installer.sh ~/.cache/dein/

if &compatible
   set nocompatible               " Be iMproved
 endif
" Required:
 set runtimepath^=~/.cache/dein/repos/github.com/Shougo/dein.vim 
 " Required:
 call dein#begin(expand('~/.cache/dein')) 
    call dein#add('Shougo/dein.vim')
	call dein#add('fatih/vim-go')
	call dein#add('vim-airline/vim-airline')
	call dein#add('w0ng/vim-hybrid')
	call dein#add('Shougo/neocomplete.vim')
	call dein#add('glidenote/memolist.vim')
	call dein#add('ctrlpvim/ctrlp.vim')
	" for elixir
	call dein#add('liquidz/vivi.vim')
	call dein#add('elixir-lang/vim-elixir')
	call dein#add('Shougo/unite.vim')
	call dein#add('Shougo/vimfiler.vim')
	call dein#add('mattn/emmet-vim')
	call dein#add('othree/yajs.vim')
	call dein#add('derekwyatt/vim-scala')
    call dein#add('Shougo/neocomplete')
    call dein#add('leafgarland/typescript-vim')
    call dein#add('colepeters/spacemacs-theme.vim')
    " python
    call dein#add('davidhalter/jedi-vim')
    call dein#add('nvie/vim-flake8')
    call dein#add('tell-k/vim-autopep8')
    " rust
    call dein#add('rust-lang/rust.vim')
    call dein#add('racer-rust/vim-racer')
call dein#end()
if dein#check_install()
      call dein#install()
  endif
" plugin manger settings

" base settings
if (has("termguicolors"))
    set termguicolors
endif

colorscheme spacemacs-theme
syntax on
set t_Co=256
set backspace=indent,eol,start
set background=dark
set expandtab
set tabstop=4
set shiftwidth=4
set laststatus=2
set statusline=2
set noswapfile
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
" base settings


" vim-go settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:EclimCompletionMethod = 'omnifunc'
let g:memolist_path = "~/memo"

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" jedi
let g:jedi#completions_command = "<C-Space>"
let g:jedi#goto_assignments_command = "<C-g>" 
let g:jedi#goto_definitions_command = "<C-d>"
let g:jedi#documentation_command = "<C-k>"
let g:jedi#rename_command = "[jedi]r"
let g:jedi#usages_command = "[jedi]n"
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "0"
autocmd FileType python setlocal completeopt-=preview

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_command = $HOME . '/.cargo/bin/rustfmt'
set hidden
let g:racer_cmd = $HOME . '/.cargo/bin/racer'


" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'



let g:user_emmet_expandabbr_key = '<c-e>'
au BufNewFile,BufRead *.scala setf scala

let g:user_emmet_leader_key='<c-e>'

" filerを自動起動
autocmd BufRead * VimFiler -split -simple -winwidth=35 -no-quit
let g:vimfiler_edit_action = 'tabopen'
filetype plugin on
filetype indent on
augroup filerkeymap
    autocmd FileType vimfiler nmap <buffer> l <Plug>(vimfiler_cd_file)
augroup END


nnoremap j gj
nnoremap k gk
