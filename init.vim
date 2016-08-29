syntax on
filetype on

highlight Normal ctermbg=black ctermfg=green
highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray

set backspace=start,eol,indent
set whichwrap=b,s,[,],,~
set mouse=a
set nohlsearch
set cursorline
set number
set laststatus=2
set statusline=%F%r%h%=
set incsearch
set wildmenu wildmode=list:full
set runtimepath+=~/.vim/
set nocompatible
set nobackup
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
set t_Co=256

filetype off

if has('vim_starting')
    set nocompatible
	" Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
        
"Required:
call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'
          
    NeoBundle 'Shougo/neosnippet.vim'
    NeoBundle 'Shougo/neosnippet-snippets'
    NeoBundle 'tpope/vim-fugitive'
    NeoBundle 'kien/ctrlp.vim'
    NeoBundle 'flazz/vim-colorschemes'
    NeoBundle 'yko/mojo.vim'
    NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
    NeoBundle 'Shougo/neocomplcache.vim'
    NeoBundle 'scrooloose/nerdtree'
call neobundle#end()

filetype plugin indent on
              
NeoBundleCheck

nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
	\ 'default' : ''
        \ }

        " Plugin key-mappings.
        inoremap <expr><C-g>     neocomplcache#undo_completion()
        inoremap <expr><C-l>     neocomplcache#complete_common_string()

        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
        function! s:my_cr_function()
	return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
