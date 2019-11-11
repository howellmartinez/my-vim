set nocompatible              						"We want the latest Vim settings/options.

so ~/.vim/plugins.vim

syntax enable
set backspace=indent,eol,start                                          "Make backspace behave like every other editor.
let mapleader = ',' 						    	"The default is \, but a comma is much better.
set number								"Let's activate line numbers.

set nowrap
set textwidth=0
set autowriteall 							"Automatically write the file name when switching buffers

set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4

"-------------Visuals--------------"
colorscheme palenight 

"set t_CO=256								"Use 256 colors. This is useful for Terminal Vim.
set guifont=Fira\ Code\ 12						"Set the default font family and size.
set linespace=12                                                        "Macvim-specific line-height.

"set guioptions-=l                                                       "Disable Gui scrollbars.
"set guioptions-=L
"set guioptions-=r
"set guioptions-=R
set guioptions-=m							"Disable menubar
set guioptions-=T							"Disable toolbar




"-------------Search--------------"
set hlsearch								"Highlight all matched terms.
set incsearch								"Incrementally highlight, as we type.


"-------------Split Management--------------"
set splitbelow 								"Make splits default to below...
set splitright								"And to the right. This feels more natural.

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>




"-------------Mappings--------------"
"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Quickly edit the snippets file
nmap <Leader>es :e ~/.vim/snippets/

"Make it easy to edit the Plugins file.
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

nmap <Leader>f :tag<space>


"-------------Plugins--------------"
"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
nmap <C-r> :CtrlPBufTag<cr>
nmap <C-e> :CtrlPMRUFiles<cr>

"/
"/ NERDTree 
"/
let NERDTreeHijackNetrw = 0		"Make NERDTree easier to toggle.
nmap <C-n> :NERDTreeToggle<cr>

"/
"/ Greplace.vim 
"/
set grepprg=ag				"Use Ag for search
let g:grep_cmd_opts = '--line-numbers --noheading'

"/
"/ vim-php-namespace
"/
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

"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

"/
"/ vim-php-cs-fixer 
"/
let g:php_cs_fixer_level = "psr2"                   " options: --level (default:symfony)



"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

"Automatically call php-cs-fixer on save
augroup autopcf 
	autocmd!
	autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
augroup END





" Notes and tips
" C-[ goes to the method
" C-^ goes back to where it was called 
" Z-A open fold
" Z-C close fold
" ctags -R --PHP-kinds=cfit
