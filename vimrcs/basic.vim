"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:  Amir Salihefendic — @amix3k
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " With a map leader it's possible to do extra key combinations
    " like <leader>w saves the current file
    let mapleader = ","

    " Vundle
    "
    " set the runtime path to include vundle and initialize
    set nocompatible              " be iMproved, required
    filetype off                  " required
    set rtp+=$HOME/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let vundle manage vundle, required
    Plugin 'vundlevim/vundle.vim'

    "Plugin 'JamshedVesuna/vim-markdown-preview'
    Plugin 'iamcco/markdown-preview.nvim' 
    let g:mkdp_auto_start = 1
    let g:mkdp_refresh_slow = 1


    " Fuzzy finder. Note need to `brew install fzf` first
    " Install `brew install ripgrep` to find string within files
    " Sorta like Cmd-shift-f in VSCode
    Plugin 'junegunn/fzf'
    Plugin 'junegunn/fzf.vim'
    " Ctrl+f to search Files using fzf
    " nnoremap <silent> <C-f> :Files<CR>
    " " Ctrl+g to search string within many files (using Vim-rooter to allow access to all files within a git repo as well) using fzf (and ripgrep)
    " nnoremap <silent> <C-g> :Rg<CR>
    " " Ctrl+l to do basically a convenient `:/` search within a file
    " " where you can see vertically the lines that match the search
    " " The autocmd VimEnter * stuff is to overwrite vim pluggin mapping
    " " because ctrl+l is already used by fzf for some useless commands.
    " " Overwritting pluggin mapping: https://vi.stackexchange.com/questions/756/how-can-i-redefine-plugin-key-mappings
    " autocmd VimEnter * nnoremap <C-l> :Lines<CR>

    " display the fzf in the bottom pane about 30%
    " estate of the screen
    " let g:fzf_layout = { 'down': '~30%' }
    " Note: use ctrl+c or ESC to exit fzf

    " Useful reference for fuzzy finder: https://www.youtube.com/watch?v=on1AzaZzQ7k&ab_channel=ChrisAtMachine
    " Allow fuzzy finder to search for files
    " in all of this current git repo not only
    " just the current directory
    Plugin 'airblade/vim-rooter'



    " vim-airline to show git info at the bottom of the screen
    " Plugin 'vim-airline/vim-airline'
    " let g:airline#extensions#tabline#enabled = 1
    " let g:airline_powerline_fonts = 1
    " " Might have to install this https://github.com/vim-airline/vim-airline-themes
    " let g:airline_theme='dracula'
    " let g:airline#extensions#tabline#formatter = 'default'
    
    " even more icons for airline!!
    Plugin 'ryanoasis/vim-devicons'


    
    " Cool way to show all the functions/class within a file
    Plugin 'preservim/tagbar'
    nmap <leader>tt :TagbarToggle<CR>
    
    " https://www.redhat.com/sysadmin/five-vim-plugins



    " github support for vim
    " https://www.youtube.com/watch?v=PO6DxfGPQvw&ab_channel=ThePrimeagen
    Plugin 'tpope/vim-fugitive'
    " :Git or :G (for short) to open git status
    nmap <leader>gs :G<CR>
    " hit s or u to stage or unstage the file(s) and hit enter to commit
    nmap <leader>gp :Git push<CR>
    nmap <leader>gc :Git commit<CR>
    " Git merge b to merge the current branch with branch "b"
    " Some useful mappings for git merge:
    "
    "get the code from the left
    nmap <leader>gf :diffget //2<CR>
    "get the code from the right
    nmap <leader>gj :diffget //3<CR>
    " to see diff change in a staged file
    " https://stackoverflow.com/questions/15407652/how-can-i-run-git-diff-staged-with-fugitive/29454450
    " Hit "dd" on the file in :Git
    " https://stackoverflow.com/questions/23263499/jumping-between-changed-lines-in-vim-with-fugitive/23267735
    " Use "]c" and "[c" to jump between changed lines


    " intellisense for vim using coc
    " https://www.youtube.com/watch?v=OXEVhnY621M&t=3s&ab_channel=ChrisAtMachine
    " https://github.com/neoclide/coc.nvim/issues/3258. Go to the ~/.vim/bundle/coc.nvim/ folder and run:
    " `yarn install` and `yarn build`
    " https://github.com/neoclide/coc.nvim/wiki/Language-servers
    " Plugin 'neoclide/coc.nvim'
    " Python: :CocInstall coc-pyright
    " Javascript: :CocInstall coc-tsserver
    " C/C++/Objective-C: :CocInstall coc-clangd
    " CSS: :CocInstall coc-css
    " HTML: :CocInstall coc-html
    " Vim: :CocInstall coc-vimlsp
    " have github copilot.
    " Do :checlhealth to see if everything is installed for the current file

    " https://www.youtube.com/watch?v=ebrEY-6EwXI&t=294s&ab_channel=chris%40machine
    " CocInstall coc-snippets
    " coc-snippets lets you preview snippets and include
    " snippets (alternative https://github.com/SirVer/ultisnips)
    " vim-snippets are the actual snippets provided for different languages
    Plugin 'honza/vim-snippets'
    imap <C-l> <Plug>(coc-snippets-expand)


    " https://github.com/neoclide/coc.nvim
    " has a setup of keybindings for coc.
    " gd jump to definition using Coc (which can locate the definition of a symbol
    " across files in the current project. Without coc, `gd` only works for the
    " current file.)
    nmap <silent> gd <Plug>(coc-definition)
    " gD to jump definition in a new pane
    autocmd VimEnter * nmap  <silent> gD :call CocAction('jumpDefinition', 'vsplit')<CR>
    " gr highlight references to the symbol under the cursor across files in the
    " current project. This is equivalent to using fzf to do :Rg (ctrl+g) and
    " then search for the symbol
    nmap gr <Plug>(coc-references)
    " cool Coc :call CocAction('format') to format
    " :CocConfig to go to coc config and add stuff like
    "     {"coc.preferences.formatOnSaveFiletypes": ["python", "javascript", "typescript", "c", "cpp", "objective-c", "css", "html"]}
    "  to call :CocAction('format') on save (i.e. on :w)
    "  :h Coc to see documentation and search for e.g. formatOnSaveFiletypes

    " Use ctrl+space to trigger/bring out completion.
    if has('nvim')
      inoremap <expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif
    " :CocDiagnostics to see errors in the current file
    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocAction('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction

    "issue: https://github.com/neoclide/coc.nvim/issues/1405
    " Fix: use ctrl+w ctrl+w (or <leader>n in our binding) to switch to the documentation preview window,
    " and scroll there


    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=100

    " Highlight the symbol under the cursor and its references within the file
    " e.g. we have a function def fn() and then we have fn() in the file. When the
    " cursor is on fn() then we want to highlight fn() and its references (including the def fn() part)
    " NOTE: updatetime=100 means that the cursor has to be on the symbol for only 100 ms
    " to trigger the highlighting instead of 4s as default.
    autocmd CursorHold * silent call CocActionAsync('highlight')



    " rename a symbol mostly within a file
    nmap <leader>r <Plug>(coc-rename)
    " search for the symbol under the cursor across files in the current project
    " useful to rename a symbol across files
    nnoremap <leader>f :CocSearch <C-R>=expand('<cword>')<CR><CR>

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    " Action like "extract method" or "extract variable"
    " Need module rope "pip install rope"
    " " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    " Commented out in favor of the coc-actions
    " <leader>a for the current selected range
    " <leader>aw for the current word
    " <leader>aas for the current sentence
    " <leader>aap for the current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)



    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    " xmap: visual mode map, omap: operator mode map
    " E.g. "daf" delete the current function
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " The following is __NOT__ needed. https://github.com/neoclide/coc.nvim/wiki/Statusline-integration
    " because I have vim airline plugin, which works out of the box.
    "set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
    " coc videos: https://www.youtube.com/watch?v=q7gr6s8skt0&ab_channel=ThePrimeagen

    " coc-explorer: like vscode. Should use this instead of :Sex!
    " https://www.youtube.com/watch?v=vrEJ6NopAGo&ab_channel=ChrisAtMachine
    " https://github.com/weirongxu/coc-explorer
    " Issue: https://iboxshare.com/weirongxu/coc-explorer/issues/480
    " Add "explorer.icon.enableNerdfont": true
    " to coc-settings.json
    " To make it like Vscode, we'll use Cmd+b to open the explorer
    " but vim doesn't support cmd, so we'll have to use iterm key
    " sending trick. https://stackoverflow.com/questions/40990454/how-to-map-mac-command-key-in-vim.
    " Go to iterm preferences>keys and add a new key mapping with Cmd+b
    " and action "Send text with "vim" special chars" :CocCommand explorer\n
    " :nmap <leader>f <Cmd>CocCommand explorer<CR>
    " Default keybindings added from github
    " can be seen in :CocConfig
    " Left side is staged and right side is unstaged in coc-explorer

    let g:coc_explorer_open_win = 'g:open_float_win_for_coc_explorer'
    " quit 
"" if only one buffer named 'coc-explorer' is shown, then exit

    function! SmartCloseFile()
        let has_good = 0
        for i in range(1, winnr('$'))
            " get filetype
           if getwinvar(i, '&ft') != '' && getwinvar(i, '&ft') != 'minimap'  " && getwinvar(i, '&ft') != 'coc-explorer'
                let has_good = 1
                break
            endif
        endfor
        if has_good == 0
             quit
        endif
    endfunction

" close vim if there's no vim file i.e. only coc-explorer or minimap are open
"autocmd BufEnter * call SmartCloseFile()


    " navigate between error
    nmap <silent> [e <Plug>(coc-diagnostic-prev)
    nmap <silent> ]e <Plug>(coc-diagnostic-next)
    " then <leader>q to close the diagnostic window!
    nmap <leader>d :CocDiagnostics<CR>



    " https://github.com/lilydjwg/colorizer
    " to color #rgb, #rgba, #rrggbb, #rrgbbaa, rgb(...), rgba(...)
    " similar to plugin in vscode
    " ColorTogggle: toggle colorizer
    Plugin('lilydjwg/colorizer')


    " in insert mode, use shift-tab to do ctrl+p
    " ctrl+p is to go backward in coc suggestion list
    " (i.e. inverse of tab)
    inoremap <S-Tab> <C-P>


    Plugin 'ThePrimeagen/vim-be-good'

    " vertical movement by typing "s" follow by 2 chars
    Plugin 'justinmk/vim-sneak'
    let g:sneak#label = 1
    " " case insensitive search
    " let g:sneak#use_ic_scs = 1
    " " use s to search downward and S to search upward


    " horizontal movement with "f"
    Plugin 'unblevable/quick-scope'

    " Latex support
    Plugin 'lervag/vimtex'
    " close quickfix menu while compiling bc it's annoying
    " can always bring it back with \le
    " let g:vimtex_quickfix_enabled = 0

    " compiling on save
    let g:vimtex_latexmk_preview_continuosly=1

    " tabulizer, align text in Vim.
    " E.g. if we have lines like this
    " one=1
    " three=3
    " Run :Tabularize /= (replace "=" with whatever symbol you want)
    " then the result is
    " one   = 1
    " three = 3
    Plugin 'godlygeek/tabular'
    " https://github.com/preservim/vim-markdown
    " Provide syntax highlight, folding, concealing links, ect. for markdown
    Plugin 'preservim/vim-markdown'


    " List of useful plugins: https://github.com/rockerBOO/awesome-neovim

    " Plugin 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}
    " let g:minimap_width = 5
    " let g:minimap_auto_start = 1
    " let g:minimap_auto_start_win_enter = 1
    " Plugin 'petertriho/nvim-scrollbar'
    " augroup scrollbar-highlights
    "     autocmd!
    "     autocmd BufEnter * lua require("scrollbar").setup()
    " augroup END

    " a bit more extensive file name at the top status line" use nvim packer instead
    " Plugin 'nvim-treesitter/nvim-treesitter' " use nvim packer instead
    " the following plugin adds more stuff to status line to display function's context
    " but too much work to get working
    " Plugin 'SmiteshP/nvim-gps'

    
    " vim ranger (note that nvim cannot display preview image)" use nvim packer instead
    " Plugin 'rbgrouleff/bclose.vim'
    " Plugin 'francoiscabrol/ranger.vim'
    " nnoremap <silent> <leader>rr :Ranger<CR>

    " ranger in floating window
    Plugin 'kevinhwang91/rnvimr'
    let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}
    let g:rnvimr_ranger_cmd = 'ranger --cmd="set draw_borders both"'
    nnoremap <silent> <leader>rr :RnvimrToggle<CR>
    " Make Ranger to be hidden after picking a file
    let g:rnvimr_enable_picker = 1

    " use this in order to get the highlighting in https://github.com/kevinhwang91/nvim-hlslens
    Plugin 'haya14busa/vim-asterisk'
    map *   <Plug>(asterisk-*)
    map #   <Plug>(asterisk-#)
    map g*  <Plug>(asterisk-g*)
    map g#  <Plug>(asterisk-g#)
    map z*  <Plug>(asterisk-z*)
    map gz* <Plug>(asterisk-gz*)
    map z#  <Plug>(asterisk-z#)
    map gz# <Plug>(asterisk-gz#)



    " Plugin 'ashisha/image.vim' " doesn't work
    " colorscheme
    Plugin 'cormacrelf/vim-colors-github'
    Plugin 'ayu-theme/ayu-vim'
    Plugin 'srcery-colors/srcery-vim'
    Plugin 'tomasiser/vim-code-dark'

    " bookmark files, mm to mark current file, mi to edit text,
    " ma to show all bookmarks in a quickfix window, mx to clear all bookmarks
    Plugin 'MattesGroeger/vim-bookmarks'
    " https://stackoverflow.com/questions/896145/more-efficient-movements-editing-python-files-in-vim
    "
    let g:no_python_maps = 1 " disable vim's python mapping that makes ]m to jump to next function defn
    nmap ]m :BookmarkNext<cr>
    nmap [m :BookmarkPrev<cr>

    Plugin 'tpope/vim-commentary'
    call vundle#end()            " required




    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => General
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Sets how many lines of history VIM has tq remember
    set history=500

    " Enable filetype plugins
    filetype plugin on
    filetype indent on

    " Set to auto read when a file is changed from the outside
    set autoread


    " Fast saving
    nmap <leader>w :w!<cr>

    " :W sudo saves the file
    " (useful for handling the permission-denied error)
    command W w !sudo tee % > /dev/null


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => VIM user interface
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Set 7 lines to the cursor - when moving vertically using j/k
    " set so=7
    "
    " Avoid garbled characters in Chinese language windows OS
    let $LANG='en'
    set langmenu=en
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    " Turn on the Wild menu
    set wildmenu

    " Ignore compiled files
    set wildignore=*.o,*~,*.pyc
    if has("win16") || has("win32")
        set wildignore+=.git\*,.hg\*,.svn\*
    else
        set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
    endif

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
    " Will do case-sensitive search if the search term
    " contains a capital letter. Otherwise, do
    " case-insensitive seach
    set smartcase

    " Highlight search results
    set hlsearch

    " Makes search act like search in modern browsers
    " highlight as I search
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

    " Properly disable sound on errors on MacVim
    if has("gui_macvim")
        autocmd GUIEnter * set vb t_vb=
    endif



    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Colors and Fonts
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Enable syntax highlighting
    syntax enable

    " Enable 256 colors palette in Gnome Terminal
    if $COLORTERM == 'gnome-terminal'
        set t_Co=256
    endif

    "try
    "     colorscheme desert
    "catch
    " endtry

    set background=dark
    " colorscheme gruvbox
    " colorscheme molokai
    " colorscheme atom-dark
    " colorscheme onedark


    " packadd! dracula
    "colorscheme dracula
    " colorscheme atom-dark
    "colorscheme codedark


    " https://github.com/cormacrelf/vim-colors-github
    " use a slightly darker background, like GitHub inline code blocks
    " let g:github_colors_soft = 1
    "
    " " use the dark theme
    " set background=dark
    "
    " " more blocky diff markers in signcolumn (e.g. GitGutter)
    " let g:github_colors_block_diffmark = 1
    "
    " colorscheme github
    "

    "https://github.com/ayu-theme/ayu-vim
    "let ayucolor="light"  " for light version of theme
    "let ayucolor="mirage" " for mirage version of theme
    "let ayucolor="dark"   " for dark version of theme
    "colorscheme ayu
    "
    " colorscheme srcery

    set cursorline
    " https://stackoverflow.com/questions/33936915/how-to-underline-rather-than-highlight-the-current-line-in-vim
    " get underline instead of highlight the current line
    hi clear CursorLine
    hi CursorLine gui=underline cterm=underline

    " https://stackoverflow.com/questions/37712730/set-vim-background-transparent. Make
    " transparent background
    " autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE


    " Set extra options when running in GUI mode
    if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
    endif

    " Set utf8 as standard encoding and en_US as the standard language
    set encoding=utf8

    " Use Unix as the standard file type
    set ffs=unix,dos,mac


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Files, backups and undo
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Turn backup off, since most stuff is in SVN, git et.c anyway...
    set nobackup
    set nowb
    set noswapfile


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


    """"""""""""""""""""""""""""""
    " => Visual mode related
    """"""""""""""""""""""""""""""
    " Visual mode pressing * or # searches for the current selection
    " Super useful! From an idea by Michael Naumann
    vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
    vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Moving around, tabs, windows and buffers
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
    map <space> /
    "map <c-space> ?

    " Disable highlight when <leader><cr> is pressed
    map <silent> <leader><cr> :noh<cr>

    " Smart way to move between split windows
    autocmd VimEnter * map <leader>j <C-W>j
    autocmd VimEnter * map <leader>k <C-W>k
    autocmd VimEnter * map <leader>h <C-W>h
    autocmd VimEnter * map <leader>l <C-W>l
    " Map <leader>n to Ctrl+w Ctrl+w to switch between panes
    nnoremap <leader>n <C-w><C-w>
    noremap ]w <C-w><C-w>
    " Map <leader>w to Ctrl+w v to open a vertical pane split
    nnoremap <leader>v <C-w>v
    " Map <leader>w to Ctrl+w s to open a horizontal pane split
    nnoremap <leader>s <C-w>s
    " to rearrange panes https://superuser.com/questions/219009/how-do-i-move-around-and-otherwise-rearrange-splits-in-vim/219098
    " We do ctrl+w shift + [either j, k, h, l] to move the current pane to down, up, left, right.
    " remap these verbose commands
    " autocmd VimEnter * map <leader><S-j> <C-w><S-j>
    " Map Ctrl+q to Ctrl+w c to close the current split
    " not really necessary, since <leader>q will do the same
    " nnoremap <C-q> <C-w>c



    " Close the current buffer. USE THIS ONE!!
    "map <leader>bd :Bclose<cr>:tabclose<cr>gT
    map <leader>bd :bd<cr>

    " Close all the buffers
    map <leader>ba :bufdo bd<cr>

    noremap ]b :bnext<cr>
    noremap [b :bprevious<cr>

    " Useful mappings for managing tabs
    map <leader>tn :tabnew<cr>
    map <leader>to :tabonly<cr>
    " should use <leader>q
    map <leader>tc :tabclose<cr>
    noremap<leader>td :tabclose<cr>
    map <leader>tm :tabmove
    " should use gt 
    map <leader>t<leader> :tabnext<cr>
    " Opens a new tab with the current buffer's path
    " Super useful when editing files in the same directory
    map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>
    " to replace gt and gT
    noremap ]t :tabnext<CR> 
    noremap [t :tabprevious<CR>
    " move between tabs, gt (next tab) gT (previous tab)
    " Let 'tl' toggle between this and the last accessed tab
    let g:lasttab = 1
    nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
    au TabLeave * let g:lasttab = tabpagenr()



    " Switch CWD to the directory of the open buffer
    map <leader>cd :cd %:p:h<cr>:pwd<cr>

    " Specify the behavior when switching between buffers
    try
      set switchbuf=useopen,usetab,newtab
      set stal=2
    catch
    endtry

    " Return to last edit position when opening files (You want this!)
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


    """"""""""""""""""""""""""""""
    " => Status line
    """"""""""""""""""""""""""""""
    " Always show the status line
    set laststatus=2

    " Format the status line
    set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Editing mappings
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Remap VIM 0 to first non-blank character
    map 0 ^

    " Move a line of text using ALT+[jk] or Command+[jk] on mac
    " nmap <leader> jj> mz:m+<cr>`z
    " nmap <leader> kk> mz:m-2<cr>`z
    " vmap <leader> jj> :m'>+<cr>`<my`>mzgv`yo`z
    " vmap <leader> kk> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <leader> jj>
  nmap <D-k> <leader> kk>
  vmap <D-j> <leader> jj>
  vmap <D-k> <leader> kk>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" turn on spell checking
"set spell
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
" map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
"map <leader>pp :setlocal paste!<cr>

" code line number on the right
set number
set relativenumber


" enable fold
" setlocal foldmethod=syntax
set foldmethod=indent   "fold based on indent
" set foldmethod=syntax "fold based on syntax
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
set foldclose=all




" My custom (Jan 28, 2022). Following ThePrimeagen
" hit <esc> twice to turn off search highlight. nohls
" enables search highlight for the next search
nohls
nnoremap <esc><esc> :nohl<cr>
"Sex! is open a pane to show the file folder in this dir
" Sorta like Cmd + b in Vscode
" Deprecated in favor of coc-explorer
" nnoremap <leader>f :Sex!<CR>
" automatically source .vimrc within a project folder.
" Allowing custom behavior for different folders
set exrc

" keep the cursor roughly in the middle
" the higher value of scrollup is.
" Value = no. of padding lines at the bottom
" when scrolling
set scrolloff=100

" add extra column to display linting error ect...
" set signcolumn=yes

"https://vi.stackexchange.com/questions/4600/how-to-copy-across-terminals
" Copy across terminals
set clipboard^=unnamed

" resize more quickly. <silent> prevents vim from printing
nnoremap  <silent> = :exe "vertical resize +5"<CR>
nnoremap  <silent> - :exe "vertical resize -5"<CR>
nnoremap  <silent> + :exe "resize +5"<CR>
nnoremap  <silent> _ :exe "resize -5"<CR>


" https://vim.fandom.com/wiki/Moving_lines_up_or_down
" https://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim
" In mac, option+j = ∆, option + k = ˚
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv


" to quit vim using <leader> (i.e. ",") q because typing
" :q! is too long
nnoremap <leader>q :q!<CR>
" nnoremap <leader>q :bd<CR>


"Custom to always open split below or to the right
" set splitbelow
" set splitright

" open terminal in splits horizontal below or vertical right
command Vterm :belowright vsplit | terminal
command Sterm :belowright split | terminal
" use ctrl+\ ctrl+n to quit terminal mode
nnoremap tv :Vterm<CR>
nnoremap ts :Sterm<CR>
" open terminal in new buffer
nnoremap tt :term<CR> 


" Note: in vim, ctrl+[ functions as <ESC>
" remap to quit terminal faster using ctrl+[
" Also use M + hjkl to move around pane splits that involve a terminal
if has('nvim')
" terminal mode
  tnoremap <C-[> <C-\><C-n>
  " tnoremap <leader> nn <c-\><c-n> <c-w><c-w>
endif
" use ctrl+c as ESC
inoremap <C-C> <ESC>
nnoremap <C-C> <ESC>


" for colorscheme such as synthwave84
set termguicolors

" enable mouse to select panes, scrolling down ect... in Vim
set mouse=a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Other packages installed in ~/.vim:
" - tcomment_vim https://github.com/tomtom/tcomment_vim
" in Neovim: ~/.config/nvim/pack
" - github copilot https://github.com/github/copilot.vim
" Porting config from vim to neovim
" Include the following in your ~/.config/nvim/init.vim
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath=&runtimepath
" source ~/.vimrc
"
