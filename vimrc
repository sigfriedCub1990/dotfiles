set nocompatible "Required for pathogen
"Pathogen configuration
execute pathogen#infect()
syntax on
filetype plugin indent on

"Settings for tabs and spaces
set tabstop=2 "number of visual spaces for TAB
set softtabstop=2 "number of spaces per TAB when editing
set expandtab "tabs are spaces 

"UI setting
set cursorline
set wildmenu "Autocomplete directories & files when editing AWESOME!!
set number
filetype indent on "load specific filetype indent
colorscheme torte 

"Searching
set incsearch "search as characters are entered
set hlsearch "highlight matches
"turn off highlight after pressing space
nnoremap <leader><space> :nohlsearch<CR>

"Folding
set foldenable
set foldmethod=indent "fold based on indent level
nnoremap <space> za

"Movements
nnoremap j gj
nnoremap k gk
"hightlight las inserted text
nnoremap gV `[v`] 

"Where to split
set splitright
"Move from splits easily
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Status line
set noruler

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    return 'N'
  else
    return ''
endfunction
"Get info from fugitive plugin
function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ''.fugitive#head()
  else
    return ''
endfunction

set laststatus=2
set statusline=
set statusline+=%8*\ [%n]                                " buffernr
set statusline+=%0*\(%{GitInfo()})                      " Git Branch name
set statusline+=%8*\ %<%F\\%m\%w\                        " File+path
set statusline+=%9*\ %=                                  " Space
set statusline+=%8*\ %y\                                 " FileType
set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
set statusline+=%0*\ %3p%%\ \ %l:\ %3c\                 " Rownumber/total (%)
