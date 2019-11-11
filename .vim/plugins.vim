filetype off                  " required

"Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'tpope/vim-surround'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'StanAngeloff/php.vim'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'ervandew/supertab'

" Themes
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'dracula/vim',{'name':'dracula'}
Plugin 'joshdick/onedark.vim'
Plugin 'connorholyday/vim-snazzy'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

