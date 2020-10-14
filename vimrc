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
Plugin 'kien/ctrlp.vim'

"python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'mhinz/vim-startify'

"炫酷的启动界面,tab提示详细信息
Plugin 'bling/vim-airline'
"底下的文件信息提示行
Plugin 'vim-airline/vim-airline-themes'
"以 Vim 插件形式出现的一套工具，它包含了多个用于 Python 开发的工具
"Plugin 'python-mode/python-mode'

"Python自动补全插件
Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
"code folding
"Plugin 'tmhedberg/SimpylFold'

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
  "colorscheme wombat256mod
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
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#overflow_marker = '…'
let g:airline#extensions#tabline#formatter = 'unique_tail'
"设置ctrlp搜索结果数量
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'
"vim下自动打开nerdtree
"autocmd vimenter * NERDTree
"autocomplete
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
"let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python':1 }
"设置ycm跳转,ctrl+o返回,ctrl+i前进；互补ctags:Ctrl+]前往，Ctrl+t返回
nnoremap <leader>l :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>g :YcmCompleter GoToDefinition<CR>
"nnoremap <C-[> :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>f :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"启动flake8检查
autocmd FileType python map <buffer> <F10> :call flake8#Flake8()<CR>
"每次保存都执行flake8检查
autocmd BufWritePost *.py call flake8#Flake8()
"flake8标记有问题行
let g:flake8_show_in_file=1
"pyunit映射键设置
"noremap ,t :call PyUnitRunTests()<CR>
"noremap! ,t <Esc>:call PyUnitRunTests()<CR>
"执行python代码快捷键
nnoremap <buffer> <F9> :exec 'w !python3' shellescape(@%, 1)<cr>
"通过这行代码访问你的系统剪贴板
"set clipboard=unnamed
"设置字体风格和字体大小
set guifont=Monaco:h16
"设置gui字体
"set macligatures
set guifont=Source\ Code\ Pro\ for\ Powerline:h16
"nerdtree不显示.pyc文件
let NERDTreeIgnore=['\.pyc$', '\~$']
"文件树在vim下自动打开
"let nerdtree_tabs_open_on_console_startup=1
"I don't like swap files
set noswapfile

"显示行号
set nu
"设置查找结果高亮
set hlsearch

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

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
