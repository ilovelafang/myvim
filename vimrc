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
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
" isnowfy only compatible with python not python3
"python sytax checker
Plugin 'nvie/vim-flake8'
"空格标记插件
Plugin 'vim-scripts/indentpython.vim'
"自动进行语法检查, 高亮错误位置
Plugin 'scrooloose/syntastic'
"Powerline是状态栏插件，可以显示当前的虚拟环境、Git分支、正在编辑的文件等信息
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"auto-completion stuff
Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/rope-vim'
"code folding
Plugin 'tmhedberg/SimpylFold'
"go插件"
Plugin 'fatih/vim-go'
"配色方案地址https://www.vim.org/scripts/script.php?script_id=627
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
  colorscheme jellybeans
  "colorscheme wombat256mod
endif
call vundle#end()
"指定使用Python3
let g:pymode_python = 'python3'
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
"折叠代码的文档字符串
let g:SimpylFold_docstring_preview=1
"模糊搜索插件kien/ctrlp.vim
"<leader>f   " 模糊搜索最近打开的文件(MRU)
"<leader>p   " 模糊搜索当前目录及其子目录下的所有文件
"ctrl + j/k  # 进行上下选择
"ctrl + x    # 在当前窗口水平分屏打开文件
"ctrl + v    # 同上, 垂直分屏
"ctrl + t    # 在tab中打开
"开启关闭文件树
map <C-n> :NERDTreeToggle<CR>
"nerdtree不显示.pyc文件
let NERDTreeIgnore=['\.pyc$', '\~$'] 
filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1
"autocomplete自动补全插件ycm设置
set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
"回车即选中当前项
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" 
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1 " 语法关键字补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python':1 }
"设置ycm跳转,ctrl+o返回,ctrl+i前进
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>ff :YcmCompleter GoToDefinitionElseDeclaration<CR>
"自动补全括号
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
"split navigations Ctrl-j 切换到下方的分割窗口,Ctrl-k 切换到上方的分割窗口,Ctrl-l 切换到右侧的分割窗口,Ctrl-h 切换到左侧的分割窗口
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"设置字体风格和字体大小
set guifont=Monaco:h16
"I don't like swap files
set noswapfile
"turn on numbering
set nu
"------------Start Python PEP 8 stuff----------------
au BufNewFile,BufRead *.py
\:set tabstop=4
\:set softtabstop=4
\:set shiftwidth=4
\:set textwidth=79
\:set expandtab
\:set autoindent
\:set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8
"----------Stop python PEP 8 stuff--------------
" For full syntax highlighting:
let python_highlight_all=1
syntax on

