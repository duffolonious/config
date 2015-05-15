" Vim me!
set expandtab
set tabstop=2
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  augroup C
      autocmd BufRead *.c set cindent
      " highlight trailing whitespace in C
      "highlight ExtraWhitespace ctermbg=red guibg=red
      highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
      match ExtraWhitespace /\s\+$/
      autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
      autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
      autocmd InsertLeave * match ExtraWhitespace /\s\+$/
      autocmd BufWinLeave * call clearmatches()
      autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
  augroup END
endif
colors darkblue
if has("autocmd")
  augroup GPGASCII
    au!
    au BufReadPost *.gpg :%!gpg -q -d
    au BufReadPost *.gpg |redraw
    au BufWritePre *.gpg :%!gpg -q -e -a
    au BufWritePost *.gpg u
    au VimLeave *.gpg :!clear
  augroup END
endif " has ("autocmd")

au FileType python setlocal ts=2 sw=2 softtabstop=2 expandtab

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

"from Zach
"Don't loose visual mode highlet after indent/dedent
"vmap > >gv
"vmap < <gv

"move between splits
"map H <C-w>h
"map J <C-w>j
"map K <C-w>k
"map L <C-w>l

"clear syntax highlight by pressing enter
" nnoremap <silent><CR> :nohlsearch<CR><CR>
set hlsearch

"Sudo Write
"cmap w!! w !sudo tee % >/dev/null

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
"command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
"	 	\ | wincmd p | diffthis

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'L9'
Plugin 'Valloric/YouCompleteMe'
Plugin 'matchit.zip'
Plugin 'saltstack/salt-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
call vundle#end()

filetype indent plugin on | syn on

"YCM config
let g:ycm_filetypes_to_completely_ignore = { 'gitcommit': 1, 'vim': 1, 'text': 1 }
let g:ycm_global_ycm_extra_conf = ''
let g:ycm_confirm_extra_conf = 0

map <C-S-n> :NERDTreeToggle<CR>

