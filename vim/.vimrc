
" ============================================================================
" Leaders
" ============================================================================
let mapleader = " "
let maplocalleader = "\\"

" Space does nothing (mapped to leader)
nnoremap <space> <nop>

" ============================================================================
" Editor Options
" ============================================================================
" Use tabs instead of spaces
set noexpandtab

" Enable smart indent
set smartindent
set autoindent

" Set tab width to 4 spaces
set tabstop=4

" Set shift width to 4 spaces
set shiftwidth=4

" Set soft tab to be 4 spaces too
set softtabstop=4

" Enable relative line numbers
set relativenumber

" Enable wildmenu for command completion
set wildmenu
set wildmode=longest:list,full

" Set default colorscheme to trigger ColorScheme event and apply custom highlights
colorscheme default

" Enable syntax highlighting
syntax on

" Set the default text color to white
highlight Normal ctermfg=white guifg=#FFFFFF

" Reset the most common syntax groups to match the Normal (white) text
highlight Identifier ctermfg=white guifg=#FFFFFF
highlight Constant   ctermfg=white guifg=#FFFFFF
highlight PreProc    ctermfg=white guifg=#FFFFFF
highlight Type       ctermfg=white guifg=#FFFFFF
highlight Special    ctermfg=white guifg=#FFFFFF

" Finally, set your Green comments
highlight Comment   ctermfg=green guifg=#00FF00
highlight Statement ctermfg=yellow guifg=#FFFF00
highlight String    ctermfg=magenta guifg=#FF00FF

" ============================================================================
" Persistence
" ============================================================================
" Enable persistent undo
set undofile

" ============================================================================
" Keymaps
" ============================================================================
" File explorer
nnoremap <leader>e :Explore<CR>

" Insert current timestamp (YYYY-MM-DDTHH:MM:SS)
nnoremap <leader>ti :call InsertCurrentTime()<CR>

" Write buffer with date as filename (YYYY-MM-DD.txt)
nnoremap <leader>tw :call WriteBufferWithDate()<CR>

" ============================================================================
" Custom Commands
" ============================================================================
" Open config directory
command! ConfigOpen edit ~/.vimrc

" ============================================================================
" Functions
" ============================================================================
" Insert current timestamp at cursor position
function! InsertCurrentTime()
	let l:time_str = strftime('%Y-%m-%dT%H:%M:%S')
	execute "normal! a" . l:time_str
endfunction

" Write buffer to file with today's date as filename
function! WriteBufferWithDate()
	let l:filename = strftime('%Y-%m-%d') . '.txt'
	execute 'write ' . l:filename
	echom 'Buffer written to ' . l:filename
endfunction

" Dont teleport home
set nocdhome

" Fuzzy find picker
nnoremap <leader>f :exe "edit " . trim(system('fzf </dev/tty'))<CR>

set clipboard+=unnamedplus
