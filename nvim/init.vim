" allows copy pasting from/to OS clipboard
set clipboard+=unnamedplus

" Disable the arrow keys in normal mode
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

" Disable the arrow keys in insert mode
inoremap <Up>    <Nop>
inoremap <Down>  <Nop>
inoremap <Left>  <Nop>
inoremap <Right> <Nop>

" enjoy editing same file from multiple nvim process
set noswapfile

" save undo tree in files
set undofile
set undodir=$HOME/.config/nvim/undo

" number of undo saved
set undolevels=10000
set undoreload=10000

" line number settings
set number
set rnu

" tab settings
set expandtab
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Auto reload file upon external change
" based on: https://stackoverflow.com/a/53860166
if ! exists("g:CheckUpdateStarted")
    let g:CheckUpdateStarted=1
    call timer_start(1,'CheckUpdate')
endif
function! CheckUpdate(timer)
    silent! checktime
    call timer_start(100,'CheckUpdate')
endfunction
