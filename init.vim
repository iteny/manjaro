" 常用设置
" 设置行号
set cursorline
set scrolloff=5
set sidescrolloff=15  
set number

" 设置语法高亮
syntax on

" 设置主题
colorscheme gruvbox 
set background=dark

" 复制粘贴到系统剪贴版
set clipboard=unnamed

" 按F2进入粘贴模式
" set pastetoggle=<F2>

" 设置光标颜色
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue

" 高亮搜索
set hlsearch

" 设置折叠方式
" set foldmethod=indent

" 一些方便的映射
let mapleader=','
let g:mapleader=','

" 设置支持python
let g:python3_host_prog = '/usr/local/bin/python3'

" 使用 jj 进入 normal 模式
inoremap jj <Esc>`^

" 使用 leader+w 直接保存
inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>

" 切换 buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> [n :bnext<CR>

" use ctrl+h/j/k/l switch window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" 神奇启动界面
Plug 'mhinz/vim-startify'

" 文件管理
Plug 'scrooloose/nerdtree'

" 状态栏美化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 代码缩进虚线
Plug 'nathanaelkane/vim-indent-guides'

" fzf文件查询
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" far.vim用于多文件批量替换字符
Plug 'brooth/far.vim'

" 文本快速定位
Plug 'easymotion/vim-easymotion'

" 操作成对的内容
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
" rust语法支持
Plug 'rust-lang/rust.vim'
" rust自动提示
Plug 'racer-rust/vim-racer'
" Plug 'ycm-core/YouCompleteMe'
Plug 'ncm2/ncm2-racer'
Plug 'ncm2/ncm2-go'
Plug 'ncm2/ncm2-vim'
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-tern'

" Initialize plugin system
call plug#end()

" for rust configuare
" 开启rust的自动reformat功能
let g:rustfmt_autosave = 1
" 手动补全和定义跳转
set hidden
" 这一行指的是你编译出来racer所在路径
let g:racer_cmd = "/home/mars/.cargo/bin/racer"
" let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1
" 这里填写rust的原来路径
let $RUST_SRC_PATH="/usr/local/rust/source/src"

" for ncm2
set shortmess+=c
inoremap <c-c> <ESC>
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
au User Ncm2Plugin call ncm2#register_source({
            \ 'name' : 'css',
            \ 'priority': 9,
            \ 'subscope_enable': 1,
            \ 'scope': ['css','scss'],
            \ 'mark': 'css',
            \ 'word_pattern': '[\w\-]+',
            \ 'complete_pattern': ':\s*',
            \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
            \ })

" for ycm
" let g:ycm_rust_src_path="/usr/local/rust/source/src"
" nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" inoremap <leader>; <C-x><C-o>

" for vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1 
let g:indent_guides_start_level = 1           
let g:indent_guides_guide_size = 1
let g:indent_guides_tab_guides = 0   

" for fzf
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

" for nerdtree
nnoremap <leader>e :NERDTreeFind<cr>
nnoremap <leader>r :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeIgnore = [
            \ '\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.pyo$', '\.svn$', '\.swp$',
            \ '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$', '\.ropeproject$',
            \ ]

" for easymottion
nmap ss <Plug>(easymotion-s2)
" nmap tt <Plug>(easymotion-t2)

" fzf如果需要使用Ag实现文本搜索需要安装brew install the_sliver_searcher
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
nnoremap <silent> <Leader>t :Ag<CR>
