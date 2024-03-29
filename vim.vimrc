set nocompatible              " required
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
 
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
 
" let Vundle manage Vundle, required
"<strong>Plugin 'gmarik/Vundle.vim'</strong>
 
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
 
" All of your Plugins must be added before the following line
"call vundle#end()            " required
filetype plugin indent on    " requiret nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"git interface
Plugin 'tpope/vim-fugitive'
"filesystem
"文件树
Plugin 'jistr/vim-nerdtree-tabs'
"文件树
Plugin 'preservim/nerdtree'

"快速搜索文件插件
"Plugin 'kien/ctrlp.vim' 

"python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'scrooloose/syntastic'
Plugin 'mhinz/vim-startify'

"炫酷的启动界面,tab提示详细信息
Plugin 'bling/vim-airline'

"底下的文件信息提示行
Plugin 'vim-airline/vim-airline-themes'

"buffer切换插件
Plugin 'bling/vim-bufferline'

"以 Vim 插件形式出现的一套工具，它包含了多个用于 Python 开发的工具
"Plugin 'python-mode/python-mode'

"Python自动补全插件
Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'

"Colors,网址https://www.vim.org/scripts/script_search_results.php
Plugin 'posva/vim-vue'

"vue代码高亮插件
Plugin 'godlygeek/tabular'

"Vim支持markdown语法插件
Plugin 'plasticboy/vim-markdown'

"Vim支持markdown语法插件
Plugin 'iamcco/markdown-preview.vim'

"markdown支持展示数学公式
Plugin 'iamcco/mathjax-support-for-mkdp'

"屏保插件矩阵
Plugin 'uguu-org/vim-matrix-screensaver'

"大文件检测，自动关闭事件处理、撤销、语法加亮等功能
Plugin 'vim-scripts/LargeFile'

"括号自动补全
Plugin 'jiangmiao/auto-pairs'

"对某个代码块或代码行加上注释，及反过来把注释去掉
Plugin 'preservim/nerdcommenter'

"语法检查插件
Plugin 'dense-analysis/ale'

"html自动emmet插件
Plugin 'mattn/emmet-vim'

"前端代码检查
Plugin 'scrooloose/syntastic'

"支持css语法
Plugin 'hail2u/vim-css3-syntax'

"支持LESS语法
Plugin 'groenewege/vim-less'

"JavaScript 语法高亮
Plugin 'pangloss/vim-javascript'

"提供强大的JavaScript omnifunc
Plugin 'marijnh/tern_for_vim'

"补全后，自动展开参数
Plugin 'tenfyzhong/CompleteParameter.vim'

"搜索文件插件，性能强大
Plugin 'Yggdroot/LeaderF'

"代码对齐线
Plugin 'Yggdroot/indentLine'

"自动生成和更新 Markdown 文件的目录
Plugin 'mzlogin/vim-markdown-toc'

"检测python虚拟环境
py3 << EOF
import os.path
import sys
import vim
if 'VIRTUA_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"确定什么模式下使用何种配色方案
if has('gui_running')
  colorscheme jellybeans
else
 "colorscheme wombat256mod
  colorscheme jellybeans
endif
"手动切换F5配色方案
"call togglebg#map("<F5>")
call vundle#end()

"开启关闭文件树
map <C-n> :NERDTreeToggle<CR>
"最后只剩下文件树时，关闭vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1
"禁用 rope
let g:pymode_rope = 0
"大文件检测MB
let g:LargeFile = 20
"禁用的键映射Option-P
let g:AutoPairsShortcutToggle = 'π'

"airline特殊配置
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#overflow_marker = '…'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

"vim-bufferline配置
let g:bufferline_show_bufnr = 1 "设置不显示tab number

function Tab_buf_switch(num) abort
    if exists('g:feat_enable_airline') && g:feat_enable_airline == 1
        execute 'normal '."\<Plug>AirlineSelectTab".a:num
    else
        if exists( '*tabpagenr' ) && tabpagenr('$') != 1
            " Tab support && tabs open
            execute 'normal '.a:num.'gt'
        else
            let l:temp=a:num
            let l:buf_index=a:num
            let l:buf_count=len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
            if l:temp > l:buf_count
                return
            endif
            while l:buf_index != 0
                while !buflisted(l:temp)
                    let l:temp += 1
                endw
                let l:buf_index -= 1
                if l:buf_index != 0
                    let l:temp += 1
                endif
            endw
            execute ':'.l:temp.'b'
        endif
    endif
endfunction

" tab or buf 1
nnoremap <leader>1 :call Tab_buf_switch(1)<cr>
" tab or buf 2
nnoremap <leader>2 :call Tab_buf_switch(2)<cr>
" tab or buf 3
nnoremap  <leader>3 :call Tab_buf_switch(3)<cr>
" tab or buf 4
nnoremap  <leader>4 :call Tab_buf_switch(4)<cr>
" tab or buf 5
nnoremap  <leader>5 :call Tab_buf_switch(5)<cr>
" tab or buf 6
nnoremap  <leader>6 :call Tab_buf_switch(6)<cr>
" tab or buf 7
nnoremap  <leader>7 :call Tab_buf_switch(7)<cr>
" tab or buf 8
nnoremap  <leader>8 :call Tab_buf_switch(8)<cr>
" tab or buf 9
nnoremap  <leader>9 :call Tab_buf_switch(9)<cr>

"ALE Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"ale设置虚拟环境的查找路径
let g:ale_virtualenv_dir_names = ['.env', '.venv', 'env', 've-py3', 've', 'virtualenv', 'venv', 'virtualenv_home/*']
"ale设置虚拟环境默认不使用全局
let g:ale_python_pylint_use_global = 0
"文件修改时语法检查不生效
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
"文件打开是不检查语法
let g:ale_lint_on_enter = 0

"bufferline配置
let g:bufferline_echo = 1
let g:bufferline_active_buffer_left = '['
let g:bufferline_active_buffer_right = ']'
let g:bufferline_modified = '+'
let g:bufferline_show_bufnr = 0

"设置ctrlp搜索结果展示数量
"let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'
"Popup Mode is to open LeaderF in a popup window
let g:Lf_WindowPosition = 'popup'
let g:Lf_ShortcutF = '<C-p>'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlColorscheme = 'airline'
let g:Lf_ShowDevIcons = 0 "关闭结果前展示的icon,如果需要展示:https://github.com/ryanoasis/nerd-fonts
"let g:Lf_StlSeparator = { 'left': '⮀', 'right': '⮂' }
"let g:Lf_StlSeparator = { 'left': "\u2b80", 'right': "\u2b82" }

"vim下自动打开nerdtree
"autocmd vimenter * NERDTree

"自动补全
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
let g:ycm_seed_identifiers_with_syntax=1 "关键字自动补全
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python':1 }
"设置ycm跳转,ctrl+o返回,ctrl+i前进；互补ctags:Ctrl+]前往，Ctrl+t返回
nnoremap <leader>l :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>g :YcmCompleter GoToDefinition<CR>
nnoremap <leader>f :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"omnicomplete
autocmd FileType python set omnifunc=python3complete#Complete

"启动flake8检查
autocmd FileType python map <buffer> <F10> :call flake8#Flake8()<CR>

"每次保存都执行flake8检查
autocmd BufWritePost *.py call flake8#Flake8()

"flake8标记有问题行
let g:flake8_show_in_file=1

"打开.md文件时 自动打开预览窗口
let g:mkdp_auto_start= 1  

"pyunit映射键设置
"noremap ,t :call PyUnitRunTests()<CR>
"noremap! ,t <Esc>:call PyUnitRunTests()<CR>

"执行python代码快捷键
nnoremap <buffer> <F9> :exec 'w !python3' shellescape(@%, 1)<cr>

"vue滑动过快高亮失效问题
autocmd FileType vue syntax sync fromstart

"vue语法检查
let g:syntastic_javascript_checkers = ['eslint']

"CSS的自动补全
let g:ycm_semantic_triggers = {
    \   'css': [ 're!^\s{4}', 're!:\s+'],
    \   'html': [ '</' ],
    \ }
"支持高亮写在JavaScript中的CSS和HTML
let javascript_enable_domhtmlcss = 1

"通过这行代码访问你的系统剪贴板
set clipboard=unnamed
"设置字体风格和字体大小
set guifont=Monaco:h20
"设置gui字体
"set macligatures
"set guifont=Source\ Code\ Pro\ for\ Powerline:h18
"nerdtree不显示.pyc文件
let NERDTreeIgnore=['\.pyc$', '\~$'] 
"文件树在vim下自动打开
"let nerdtree_tabs_open_on_console_startup=1
"I don't like swap files
set noswapfile

"显示行号
set nu
"设置查找结果高亮
autocmd cursorhold * set nohlsearch
" 当输入查找命令时，再启用高亮
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>

"------------Start Python PEP 8 stuff----------------
au BufNewFile,BufRead *.py
\:set tabstop=4
\:set softtabstop=4
\:set shiftwidth=4
\:set textwidth=79
\:set expandtab
"\:set autoindent
\:set fileformat=unix

"解决backspace失效设置
set backspace=2
" Set the default file encoding to UTF-8:
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"----------Stop python PEP 8 stuff--------------
"----------前端文件-------------
au BufNewFile,BufRead *.js, *.html, *.css
\ set tabstop=2
\ set softtabstop=2
\ set shiftwidth=2
"----------end 前端文件---------
"Folding based on indentation:
"autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za
" For full syntax highlighting:
let python_highlight_all=1
"设置语法高亮
syntax on
"设置鼠标定位光标
set mouse=a
"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
if has("cscope")
    if filereadable("cscope.out")
        cs add cscope.out
    endif
endif
