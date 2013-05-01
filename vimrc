" Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'
    "Add your bundles here
    Bundle 'https://github.com/scrooloose/syntastic.git' 
    Bundle 'https://github.com/tpope/vim-fugitive' 
    Bundle 'https://github.com/majutsushi/tagbar.git'
    Bundle 'https://github.com/altercation/vim-colors-solarized.git'
    Bundle 'https://github.com/scrooloose/nerdtree.git'
    Bundle 'https://github.com/vim-scripts/Better-CSS-Syntax-for-Vim.git'
    Bundle 'https://github.com/Raimondi/delimitMate.git' 
    Bundle 'https://github.com/tpope/vim-haml.git'
    Bundle 'pangloss/vim-javascript'
    Bundle 'kchmck/vim-coffee-script'
    Bundle 'tpope/vim-surround'
    Bundle 'mileszs/ack.vim'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'Lokaltog/vim-powerline'
    Bundle 'git://git.wincent.com/command-t.git'
    Bundle 'https://github.com/rstacruz/sparkup.git'
    Bundle 'https://github.com/Lokaltog/vim-easymotion.git'
    Bundle 'https://github.com/vim-scripts/ShowMarks.git'
    Bundle 'https://github.com/kien/ctrlp.vim.git'
    Bundle 'nathanaelkane/vim-indent-guides'
    Bundle 'xolox/vim-session'
    Bundle 'MarcWeber/vim-addon-mw-utils'
    Bundle 'tomtom/tlib_vim'
    Bundle 'honza/snipmate-snippets'
    Bundle 'drmingdrmer/xptemplate'
    "Bundle 'garbas/vim-snipmate:'
    "...All your other bundles...
    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif
" Setting up Vundle - the vim plugin bundler end

syntax enable
set background=dark
colorscheme solarized
let mapleader=","


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

:nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

":nnoremap <silent> <Leader>n :execute 'match Search /\%'.virtcol('.').'v/'<CR>

" ShowMarks {
		let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
		" Don't leave on by default, use :ShowMarksOn to enable
		let g:showmarks_enable = 0
		" For marks a-z
		highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
		" For marks A-Z
		highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
		" For all other marks
		highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
		" For multiple marks on the same line.
		highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen
	" }

" NerdTree {
		map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
		map <leader>e :NERDTreeFind<CR>
		nmap <leader>nt :NERDTreeFind<CR>

		let NERDTreeShowBookmarks=1
		let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
		let NERDTreeChDirMode=0
		let NERDTreeQuitOnOpen=1
		let NERDTreeShowHidden=1
		let NERDTreeKeepTreeInNewTab=1
	" }
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

set autoread
set mouse=a
set nu

" To use, do this:
" :set tabline=%!MyTabLine()

function MyTabLine()
  let s = ''
    for i in range(tabpagenr('$'))
            " select the highlighting
                if i + 1 == tabpagenr()
                          let s .= '%&TabLineSel;'
                              else
                                        let s .= '%&TabLine;'
                                            endif
                                            
                                                " set the tab page number (for mouse clicks)
                                                    let s .= '%' . (i + 1) . 'T'
                                                    
                                                        " the label is made by MyTabLabel()
                                                            "let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
                                                                let s .= ' %{BradLabel(' . (i + 1) . ')} '
                                                                  endfor
                                                                  
                                                                    " after the last tab fill with TabLineFill and reset tab page nr
                                                                      let s .= '%&TabLineFill;%T'
                                                                      
                                                                        " right-align the label to close the current tab page
                                                                          if tabpagenr('$') > 1
                                                                                  let s .= '%=%&TabLine;%999Xclose'
                                                                                    endif
                                                                                    
                                                                                      return s
                                                                                      endfunction
                                                                                      
                                                                                      function BradLabel(n)
                                                                                        let buflist = tabpagebuflist(a:n)
                                                                                          let winnr   = tabpagewinnr(a:n)
                                                                                            let bufnam  = bufname(buflist[winnr - 1])
                                                                                              " This is getting the basename() of bufname above
                                                                                                let base    = substitute(bufnam, '.*/', '', '')
                                                                                                  let name    = a:n . ' ' . base
                                                                                                    return name
                                                                                                    endfunction
                                                                                                    
                                                                                                    function MyTabLabel(n)
                                                                                                      let buflist = tabpagebuflist(a:n)
                                                                                                        let winnr = tabpagewinnr(a:n)
                                                                                                          return bufname(buflist[winnr - 1])
                                                                                                          endfunction
                                                                                                          
                                                                                                          " Use the above tabe naming scheme
                                                                                                      set tabline=%!MyTabLine())
                                                                            "set runtimepath+=~/.vim/bundle/UltiSnips
filetype plugin on
